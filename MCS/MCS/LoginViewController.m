//
//  LoginViewController.m
//  MCS
//
//  Created by gener on 16/10/31.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>
@property UITextField * username;
@property UITextField * userpwd;
@property UIView * backgroundview;
@end

@implementation LoginViewController
{

}
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//   BOOL b = [SAMKeychain setPassword:@"pwd123456" forService:@"com.mcs.data" account:@"light"];
//    NSString * pwd = [SAMKeychain passwordForService:@"com.mcs.data" account:@"light"];
    
    [self addSubviews];
    [self _init];
}

-(void)addSubviews
{
    self.backgroundview = [[UIView alloc]init];
    _backgroundview.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_backgroundview];
    _backgroundview.backgroundColor = [UIColor colorWithRed:0.965 green:0.969 blue:0.973 alpha:1];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_backgroundview(400)]" options:NSLayoutFormatAlignAllCenterX metrics:nil views:NSDictionaryOfVariableBindings(_backgroundview)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_backgroundview(280)]" options:NSLayoutFormatAlignAllCenterY metrics:nil views:NSDictionaryOfVariableBindings(_backgroundview)]];//180
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_backgroundview attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:-50]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_backgroundview attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    
    self.username = [[UITextField alloc]init];
    _username.delegate = self;
    _username.returnKeyType = UIReturnKeyNext;
    _username.keyboardType = UIKeyboardTypeDefault;
    _username.clearButtonMode = UITextFieldViewModeWhileEditing;
    _username.translatesAutoresizingMaskIntoConstraints = NO;
    _username.placeholder = @"please input user name";
    _username.borderStyle = UITextBorderStyleRoundedRect;
    [_backgroundview addSubview:_username];
    
    UIView * v0 = [[UIView alloc]initWithFrame:CGRectMake(0, 5, 30, 30)];
    UIImageView * nameleftv =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"user_icon"]];
    nameleftv.frame = CGRectMake(10, (CGRectGetHeight(v0.frame)-16)/2.0, 16, 16);
    [v0 addSubview:nameleftv];
    _username.leftView = v0;
    _username.leftViewMode = UITextFieldViewModeAlways;
    
    self.userpwd = [[UITextField alloc]init];
    _userpwd.delegate = self;
    _userpwd.returnKeyType = UIReturnKeyDone;
    _userpwd.secureTextEntry = YES;
    _userpwd.clearButtonMode = UITextFieldViewModeWhileEditing;
    _userpwd.translatesAutoresizingMaskIntoConstraints = NO;
    _userpwd.placeholder = @"please input user pwd";
    _userpwd.borderStyle = UITextBorderStyleRoundedRect;
    [_backgroundview addSubview:_userpwd];
    UIView * v1 = [[UIView alloc]initWithFrame:CGRectMake(0, 5, 30, 30)];
    UIImageView *pwdleftv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"user_pwd"]];
    pwdleftv.frame = CGRectMake(10, (CGRectGetHeight(v1.frame)-16)/2.0, 16, 16);
    [v1 addSubview:pwdleftv];
    _userpwd.leftView =v1;
    _userpwd.leftViewMode = UITextFieldViewModeAlways;

    UIButton * loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.translatesAutoresizingMaskIntoConstraints = NO;
    loginBtn.backgroundColor = [UIColor colorWithRed:0.318 green:0.243 blue:0.533 alpha:1];
    [_backgroundview addSubview:loginBtn];
    [loginBtn setTitle:@"Login" forState:UIControlStateNormal];
    [loginBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
    [loginBtn addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel * titleLab = [[UILabel alloc]init];
    titleLab.translatesAutoresizingMaskIntoConstraints = NO;
    titleLab.text = @"维修控制系统";
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.font = [UIFont boldSystemFontOfSize:30];
    [_backgroundview addSubview:titleLab];
    
    
    [_backgroundview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_username]-10-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_username)]];
    [_backgroundview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[titleLab(30)]-35-[_username(==40)]-30-[_userpwd(==_username)]->=0-[loginBtn(44)]-2-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_username,_userpwd,loginBtn,titleLab)]];
    
    [_backgroundview addConstraint:[NSLayoutConstraint constraintWithItem:_username attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_userpwd attribute:NSLayoutAttributeLeading multiplier:1 constant:0]];
    [_backgroundview addConstraint:[NSLayoutConstraint constraintWithItem:_username attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_userpwd attribute:NSLayoutAttributeTrailing multiplier:1 constant:0]];
    
    [_backgroundview addConstraint:[NSLayoutConstraint constraintWithItem:loginBtn attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_userpwd attribute:NSLayoutAttributeLeading multiplier:1 constant:-3]];
    [_backgroundview addConstraint:[NSLayoutConstraint constraintWithItem:loginBtn attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_userpwd attribute:NSLayoutAttributeTrailing multiplier:1 constant:3]];
    
    [_backgroundview addConstraint:[NSLayoutConstraint constraintWithItem:titleLab attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_userpwd attribute:NSLayoutAttributeLeading multiplier:1 constant:-3]];
    [_backgroundview addConstraint:[NSLayoutConstraint constraintWithItem:titleLab attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_userpwd attribute:NSLayoutAttributeTrailing multiplier:1 constant:3]];
}

-(void)_init
{
    _username.text = @"admin";
    _userpwd.text = @"admin123456";
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [self.view addGestureRecognizer:tap];
    
    __block float offset_y = 0;
    UIView * tmpview = _backgroundview;
    [[NSNotificationCenter defaultCenter]addObserverForName:UIKeyboardWillShowNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        NSDictionary * userinfo = note.userInfo;
        CGRect keyboardendFrame = [userinfo[@"UIKeyboardFrameEndUserInfoKey"]CGRectValue];

        if (CGRectIntersectsRect(keyboardendFrame, tmpview.frame)) {
            float key_y = CGRectGetMinY(keyboardendFrame);
            float key_b = CGRectGetMaxY(tmpview.frame);
            offset_y = (key_b - key_y) + 15;
            [UIView animateWithDuration:[userinfo[@"UIKeyboardAnimationDurationUserInfoKey"]floatValue] animations:^{
                 NSArray * cons= self.view.constraints;
                for (NSLayoutConstraint *obj in cons) {
                    if (obj.firstAttribute == NSLayoutAttributeCenterY) {
                        obj.constant -= offset_y;
                    }
                }
                [self.view layoutIfNeeded];
            }]; 
        }
    }];
    
    [[NSNotificationCenter defaultCenter]addObserverForName:UIKeyboardWillHideNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        NSDictionary * userinfo = note.userInfo;
        [UIView animateWithDuration:[userinfo[@"UIKeyboardAnimationDurationUserInfoKey"]floatValue] animations:^{
            NSArray * con= self.view.constraints;
            for (NSLayoutConstraint *obj in con) {
                if (obj.firstAttribute == NSLayoutAttributeCenterY) {
                    obj.constant += offset_y;
                }
            }
            [self.view layoutIfNeeded];
        } completion:^(BOOL finished) {
            offset_y = 0;
        }];
    }];
}


-(void)tapAction : (UITapGestureRecognizer*)gestureRecognizer
{
    if (self.username.isFirstResponder ) {
        [self.username resignFirstResponder];
    }
    else if (self.userpwd.isFirstResponder)
    {
        [self.userpwd resignFirstResponder];
    }
}

#pragma mark - UITextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == _username) {
        [_userpwd becomeFirstResponder];
    }
    else [_userpwd resignFirstResponder];
    
    return YES;
}

- (void)loginAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    return;
    
    [MBHUD showStatueInView:self.view WithMsg:@"正在登陆..."];
    

//    NSDictionary *_d = [NSDictionary dictionaryWithObjectsAndKeys:@"wangyiwen",@"userName",@"069684",@"password", nil];
    
//    RequestTaskHandle * task = [RequestTaskHandle taskWith:@"/adp-osm/rest/login" parms:_d andSuccess:^(NSURLSessionDataTask *task, id responseObject) {
//
//         [MBHUD dismiss];
//
//         [self dismissViewControllerAnimated:YES completion:nil];
//        
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        
//    }];
    
    /*
    RequestTaskHandle * task = [RequestTaskHandle taskWith:@"/adp-tools/rest/fleetStatus/list?tenantCode=CCA" parms:nil andSuccess:^(NSURLSessionDataTask *task, id responseObject) {
        
        [MBHUD dismiss];
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
    
    [HttpManager doGetWithTask:task];
     */
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
