//
//  FleetFaultDesVC.m
//  MCS
//
//  Created by gener on 16/11/11.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "FleetFaultDesVC.h"

#define reloadSectionWithIndex(index)  [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:index] withRowAnimation:UITableViewRowAnimationNone]

#define kPossibleFaultSectionIndex   (_tablviewSectionNum - 2)

typedef NS_ENUM(NSInteger,WarnDescribleType)
{
    WarnDescribleTypeFaultReasonCell_1,
    WarnDescribleTypeFaultManualCell_2,
    WarnDescribleTypeDevicesListCell_3
};

static NSString * WarnDescribleFaultReasonCellReuseIdentifier = @"WarnDescribleFaultReasonCellReuseIdentifier";


@interface FleetFaultDesVC ()
{
    BOOL _section_1_formatter_msg;//section_1报文格式

    CustomMultipleButtons * _section1_headerView;
    CustomMultipleButtons * _sectionN_2_headerView;

    NSDictionary * _faultInfoDic;//故障信息
    NSArray * _reportSetArray;//报文数据集合
    
    NSArray * _otherListDataArray;//其他航段故障
    
    NSInteger _tablviewSectionNum;

    NSMutableArray * _reportIsOpenArray;//报文是否展开
    NSMutableDictionary * _reportTextDic;//原始报文内容
    NSMutableArray * _reportSectionHeadViewArr;
    
    //可能的故障原因
    NSInteger _faultReasonSectionCellType;
    NSMutableArray * _possibleCasesDataArray;
    NSMutableArray * _possibleManualArray;
    
    NSString * _possibleReasonUrl;
    NSString * _possibleManualUrl;
    NSString * _possibleDeviceListUrl;
}

@end

@implementation FleetFaultDesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"故障分析";
    
    _section_1_formatter_msg = YES;
    _faultReasonSectionCellType = WarnDescribleTypeFaultReasonCell_1;

    _reportIsOpenArray = [[NSMutableArray alloc]init];
    _reportTextDic = [[NSMutableDictionary alloc]init];
    _reportSectionHeadViewArr = [[NSMutableArray alloc]init];
    
    [self initSubviews];
    [self loadData];
}

-(void)loadData
{
    __weak typeof(self)weakSelf = self;
    NSString * alarmId = [[self.dic[@"detail"]objectAtIndex:0] objectForKey:@"alarmEventId"];
    if (!alarmId) {
        [SVProgressHUD showInfoWithStatus:@"Invalid alarmEventId"]; return;
    }
    
    //故障基本信息
    NSDictionary * parm = [NSDictionary dictionaryWithObjectsAndKeys:alarmId,@"id",kTeantCode,@"tenantCode", nil];
    [SVProgressHUD showWithStatus:NSLocalizedString(@"Loading", nil)];
    dispatch_group_t _group = dispatch_group_create();
    dispatch_group_enter(_group);
    RequestTaskHandle * task = [RequestTaskHandle taskWith:krecommendDocUrl parms:parm andSuccess:^(NSURLSessionDataTask *task, id responseObject) {
        if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
            _faultInfoDic = responseObject[@"faultDetail"];
            _reportSetArray = responseObject[@"alarmEventReportVoSet"];
            for (int i=0; i<_reportSetArray.count; i++) {
                NSDictionary  * tmp = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO] forKey:@(i)];
                [_reportIsOpenArray addObject:tmp];
                
               UIView * _view = [[CustomMultipleButtons alloc]initWithFrame:CGRectMake(0, 0, CURRNET_SCREEN_WIDTH, 40) buttonTitles:@[@"原始报文"] selectedHandler:^(NSInteger index) {

                }];
                
                [_reportSectionHeadViewArr addObject:_view];
            }

            _tablviewSectionNum = _reportSetArray.count + 3;
            if (responseObject[@"causeUrl"]) {
                _possibleReasonUrl = responseObject[@"causeUrl"];
            }
            if (responseObject[@"tsmUrl"]) {
                _possibleManualUrl = responseObject[@"tsmUrl"];
            }
            if (responseObject[@"melUrl"]) {
                _possibleDeviceListUrl = responseObject[@"melUrl"];
            }
            if (_possibleReasonUrl) {
                [weakSelf possibleFault:_possibleReasonUrl isManual:NO];
            }
        }
        dispatch_group_leave(_group);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [SVProgressHUD showInfoWithStatus:@"Failed from server"];
        dispatch_group_leave(_group);
    }];
    [HttpManager doGetWithTask:task];
    
    dispatch_group_enter(_group);
    NSDictionary * listParms = [NSDictionary dictionaryWithObjectsAndKeys:
                                kTeantCode,@"tenantCode",
                                self.dic[@"legId"],@"legId",
                                self.dic[@"tailId"],@"tailId",
                                [[self.dic[@"detail"]objectAtIndex:0] objectForKey:@"id"],@"alarmId",
                                //                          @"false",@"_search",
                                //                          @"",@"nd",
                                @"-1",@"rows",
                                @"1",@"page",
                                //                                @"",@"sidx",
                                @"desc",@"sord",nil];
    //获取其他航段故障数据
    RequestTaskHandle * task2 = [RequestTaskHandle taskWith:kFaultSummaryListUrl parms:listParms andSuccess:^(NSURLSessionDataTask *task, id responseObject) {
        if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
            _otherListDataArray = responseObject[@"rows"];
        }
        dispatch_group_leave(_group);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [SVProgressHUD showInfoWithStatus:@"Failed from server"];
        dispatch_group_leave(_group);
    }];
    [HttpManager doGetWithTask:task2];
    
    dispatch_group_notify(_group, dispatch_get_main_queue(), ^{
        NSLog(@"all ok");
        [self.tableView reloadData];
        [SVProgressHUD dismiss];
    });
}

//可能的故障原因
-(void)possibleFault:(NSString *)url isManual:(BOOL)is
{
    if (!url)return;
    if ([url hasPrefix:@"/"]) url = [url substringFromIndex:1];
    
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:_sectionN_2_headerView animated:YES];
    [hud show:YES];
    RequestTaskHandle * task = [RequestTaskHandle taskWith:url parms:nil andSuccess:^(NSURLSessionDataTask *task, id responseObject) {
        [hud hide:NO];
        if (responseObject && [responseObject isKindOfClass:[NSArray class]]) {
            if (is) {
                _possibleManualArray = [[NSMutableArray alloc]init];
                [_possibleManualArray addObjectsFromArray:responseObject];
            }
            else
            {
                _possibleCasesDataArray = [[NSMutableArray alloc]init];
                NSMutableArray * _tmpKeyArray = [[NSMutableArray alloc]init];
                NSArray * obj = responseObject;
                for (int i =0; i < obj.count; i++) {
                    NSDictionary * dic = [obj objectAtIndex:i];
                    NSString * key = dic[@"taskCode"];
                    if (![_tmpKeyArray  containsObject:key]) {
                        [_tmpKeyArray addObject:key];
                        NSMutableDictionary * muldic = [NSMutableDictionary dictionaryWithDictionary:dic];
                        [muldic setObject:@(1) forKey:@"taskCodeKey"];
                        [_possibleCasesDataArray addObject:muldic];
                    }
                    [_possibleCasesDataArray addObject:dic];
                }
            }
            reloadSectionWithIndex(kPossibleFaultSectionIndex);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [hud hide:NO];
    }];
    
    [HttpManager doGetWithTask:task];
}

-(void)initSubviews
{
    __weak typeof(self)weakSelf = self;
    _section1_headerView = [[CustomMultipleButtons alloc]initWithFrame:CGRectMake(0, 0, CURRNET_SCREEN_WIDTH, 40) buttonTitles:@[@"原始报文"] selectedHandler:^(NSInteger index) {
        _section_1_formatter_msg = index==1?YES:NO;
        
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationNone];
    }];
    
    _sectionN_2_headerView = [[CustomMultipleButtons alloc]initWithFrame:CGRectMake(0, 0, CURRNET_SCREEN_WIDTH, 40) buttonTitles:@[@"可能的故障原因",@"排故手册",@"最低设备清单",@"上传文件"] selectedHandler:^(NSInteger index) {
        switch (index) {
            case 1:
            {
                _faultReasonSectionCellType = WarnDescribleTypeFaultReasonCell_1;
                if (!_possibleCasesDataArray) {
                    [weakSelf possibleFault:_possibleReasonUrl isManual:NO];
                }
                else
                    reloadSectionWithIndex(kPossibleFaultSectionIndex);
                break;
            }
            case 2:
            {
                _faultReasonSectionCellType = WarnDescribleTypeFaultManualCell_2;
                if (!_possibleManualArray) {
                    [weakSelf possibleFault:_possibleManualUrl isManual:YES];
                }
                else
                    reloadSectionWithIndex(kPossibleFaultSectionIndex);
                break;
            }
            case 3:_faultReasonSectionCellType = WarnDescribleTypeDevicesListCell_3;
            case 4:_faultReasonSectionCellType = 55;reloadSectionWithIndex(kPossibleFaultSectionIndex);break;
            default:break;
        }
#warning //...

    }];
   
    [self.tableView registerClass:[WarnDescribleFaultReasonCell class] forCellReuseIdentifier:WarnDescribleFaultReasonCellReuseIdentifier];
    [self.tableView registerNib:[UINib nibWithNibName:@"FaultDescribleWarnListCell" bundle:nil] forCellReuseIdentifier:@"FaultDescribleWarnListCellReuseID"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark -
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _tablviewSectionNum;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section < kPossibleFaultSectionIndex)
    {
        return 1;
    }
    else if(section == kPossibleFaultSectionIndex)
    {
        switch (_faultReasonSectionCellType) {
            case WarnDescribleTypeFaultReasonCell_1:return _possibleCasesDataArray.count?_possibleCasesDataArray.count:1;break;
            case WarnDescribleTypeFaultManualCell_2:return _possibleManualArray.count?_possibleManualArray.count:1;break;
            default:return 1; break;
        }
    }

    else if (section == _tablviewSectionNum - 1)
        return _otherListDataArray.count;
    
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell  * cell;
    if (indexPath.section ==0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell1_IdentifierId" forIndexPath:indexPath];
        [((WarnDescribleFaultInfoCell*)cell) setCellWith:_faultInfoDic];
    }
    else if (indexPath.section && indexPath.section < kPossibleFaultSectionIndex) {
        NSString * cellId = _section_1_formatter_msg ? @"cell2_IdentifierId" : @"cell21_IdentifierId";
        cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
        if (_section_1_formatter_msg) {
            ((WarnDescribleMsgCell*)cell).msg.text = [self getSectionReportText:indexPath.section - 1];
        }
        
    }
    else if (indexPath.section == kPossibleFaultSectionIndex) {
        __weak typeof(self)weakSelf = self;
        switch (_faultReasonSectionCellType) {
            case WarnDescribleTypeFaultReasonCell_1:
            {
                if (!_possibleCasesDataArray.count) {
                    cell = [tableView dequeueReusableCellWithIdentifier:@"cell31_IdentifierId" forIndexPath:indexPath];
                }
                else
                {
                    cell = [tableView dequeueReusableCellWithIdentifier:WarnDescribleFaultReasonCellReuseIdentifier forIndexPath:indexPath];
                    NSDictionary * tmp = _possibleCasesDataArray[indexPath.row];
                    [(WarnDescribleFaultReasonCell *)cell setCellWithData:tmp isManula:NO];
                }
            } break;
            case WarnDescribleTypeFaultManualCell_2:
            {
                if (!_possibleManualArray.count) {
                    cell = [tableView dequeueReusableCellWithIdentifier:@"cell31_IdentifierId" forIndexPath:indexPath];
                }
                else
                {
                    cell = [tableView dequeueReusableCellWithIdentifier:WarnDescribleFaultReasonCellReuseIdentifier forIndexPath:indexPath];
                    NSDictionary * tmp = _possibleManualArray[indexPath.row];
                    [(WarnDescribleFaultReasonCell *)cell setCellWithData:tmp isManula:YES];
                    ((WarnDescribleFaultReasonCell *)cell).tapActionBlock = ^(NSString * urlStr){
#warning 有待处理的操作
                        //                    WebViewVC * vc = [[WebViewVC alloc]init];
                        //                    vc.urlString = urlStr;
                        //                    [weakSelf.navigationController pushViewController:vc animated:YES];
                    };
                }
            } break;
                
            default:
            {
                cell = [tableView dequeueReusableCellWithIdentifier:@"cell31_IdentifierId" forIndexPath:indexPath];
            }break;
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    else if (indexPath.section ==_tablviewSectionNum - 1) {
        cell.backgroundColor = [UIColor whiteColor];
        
        NSDictionary * dic = _otherListDataArray[indexPath.row];
        cell = [tableView dequeueReusableCellWithIdentifier:@"FaultDescribleWarnListCellReuseID" forIndexPath:indexPath];
        cell.backgroundColor = indexPath.row %2 ? kTableViewCellBgColorDeep:kTableViewCellBgColorLight;
        
        [((FaultDescribleWarnListCell*)cell) setCellWith:dic];
        
        if (indexPath.row %2) {
            cell.backgroundColor = kTableViewCellBgColorDeep;
        }
    }

    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==0) {
        return 240;
        return 270;
    }
    else if (indexPath.section && indexPath.section < kPossibleFaultSectionIndex)
    {
        NSDictionary * tmp = _reportIsOpenArray[indexPath.section - 1];
        return [[tmp objectForKey:@(indexPath.section - 1)]boolValue] ? 200:0;
    }
    else if (indexPath.section == kPossibleFaultSectionIndex)
    {
        return 30;
    }
    else if (indexPath.section == _tablviewSectionNum - 1)
    {
        return 80;
    }
    else
        return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section && section < kPossibleFaultSectionIndex) {
        return [self getSectionOpenStatus:section - 1]?45:2;
    }
    return 45;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section < _reportSetArray.count) {
        return 40;
    }
    return 1;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section ==0 || section == _tablviewSectionNum - 1) {
        UILabel * l = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, CURRNET_SCREEN_WIDTH, 20)];
        NSMutableParagraphStyle * style = [NSMutableParagraphStyle new];
        style.firstLineHeadIndent = 20;
        NSAttributedString * attri = [[NSAttributedString alloc]initWithString:section?@"本航段其它故障": @"故障分析" attributes:[NSDictionary dictionaryWithObjectsAndKeys:style,NSParagraphStyleAttributeName,[UIFont boldSystemFontOfSize:16],NSFontAttributeName,[UIColor darkGrayColor],NSForegroundColorAttributeName, nil]];
        l.attributedText = attri;
        return l;
    }
    else if (section && section < kPossibleFaultSectionIndex)
    {
        if ([self getSectionOpenStatus:section-1]) {
            return _reportSectionHeadViewArr[section-1];
        }
        UILabel *l = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, CURRNET_SCREEN_WIDTH, 2)];
        l.backgroundColor = [UIColor whiteColor];
        return l;
    }
    else if (section == kPossibleFaultSectionIndex)
    {
        return  _sectionN_2_headerView;
    }
    else if (section == 1000)
    {
        UIView * bg = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(tableView.frame), 100)];
        bg.backgroundColor = [UIColor clearColor];

        UIView * bottom = [[UIView alloc]initWithFrame:CGRectMake(0, 40, CGRectGetWidth(tableView.frame), 40)];
        bottom.backgroundColor = [UIColor colorWithRed:0.961 green:0.961 blue:0.961 alpha:1];
        UILabel * lab1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(tableView.frame)/2.0-200, CGRectGetHeight(bottom.frame))];
        lab1.textAlignment = NSTextAlignmentCenter;
        lab1.textColor = [UIColor darkGrayColor];
        lab1.text = @"告警等级";
        lab1.font = [UIFont systemFontOfSize:14];
        [bottom addSubview:lab1];
        UILabel * lab2 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(tableView.frame)/2.0, 0, CGRectGetWidth(tableView.frame)/2.0-180, CGRectGetHeight(bottom.frame))];
        lab2.textAlignment = NSTextAlignmentCenter;
        lab2.textColor = [UIColor darkGrayColor];
        lab2.text = @"状态";
        lab2.font = [UIFont systemFontOfSize:14];
        [bottom addSubview:lab2];
        
        [bg addSubview:bottom];
        return bg;
    }
    
    return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section < _reportSetArray.count) {
        NSDictionary * firstReport = _reportSetArray[section];
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, CURRNET_SCREEN_WIDTH, 40);
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.textAlignment = NSTextAlignmentLeft;
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;

        [btn setTitle:[NSString stringWithFormat:@"%@\t\t%@",firstReport[@"code"],firstReport[@"message"]] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:0.161 green:0.675 blue:0.941 alpha:1] forState:UIControlStateNormal ];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn setImage:[UIImage imageNamed:@"open"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"close"] forState:UIControlStateSelected];
        [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 15, 0, 0)];
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 25, 0, 0)];
        btn.tag = section;
        btn.ID = firstReport[@"reportInfoId"];
        [btn addTarget:self action:@selector(sectionBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.selected = [self getSectionOpenStatus:section];
        return btn;
    }

    return nil;
}

#pragma mark - section methods
-(void)sectionBtnAction :(UIButton *)btn
{
    btn.selected = !btn.selected;
    BOOL _b = [self getSectionOpenStatus:btn.tag];
    [self setSectionOpenStatus:btn.tag withValue:!_b];

    if (!_b) {
        if (![self getSectionReportText:btn.tag]) {
            MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:btn animated:YES];
            [hud show:YES];
            
            AFHTTPSessionManager *_manager = [[AFHTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString:kServerBaseUrl]];
            _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
            _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            [_manager GET:kOriginalReportUrl parameters:[NSDictionary dictionaryWithObjectsAndKeys:btn.ID,@"rid", nil] progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [hud hide:NO];
                if ([responseObject isKindOfClass:[NSData class]]) {
                    NSData *textData = [NSData dataWithData:[responseObject mutableCopy]];
                    NSString *textStr = [[NSString alloc]initWithData:textData encoding:NSUTF8StringEncoding];
                    [_reportTextDic setObject:textStr forKey:@(btn.tag)];
                    reloadSectionWithIndex(btn.tag+1);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [hud hide:NO];
            }];
        }
        else
            reloadSectionWithIndex(btn.tag+1);
    }
    
    else
     reloadSectionWithIndex(btn.tag+1);
}

-(NSString*)getSectionReportText:(NSInteger)index
{
    return [_reportTextDic objectForKey:@(index)];
}

-(BOOL)getSectionOpenStatus:(NSInteger)index
{
    NSDictionary * tmp = _reportIsOpenArray[index];
    return [[tmp objectForKey:@(index)]boolValue] ;
}

-(void)setSectionOpenStatus:(NSInteger)index withValue:(BOOL)b
{
    NSDictionary * dic = [NSDictionary dictionaryWithObject:@(b) forKey:@(index)];
    [_reportIsOpenArray replaceObjectAtIndex:index withObject:dic];
}

@end






