<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<link rel="shortcut icon" type="image/x-icon" href="/adp-map/static/adp/images/airchina.ico" />
<title>飞机零件选择</title>

<link type="text/css" rel="stylesheet" href="/adp-map/static/adp/css/adp.css" />
<link type="text/css" rel="stylesheet" href="/adp-map/static/adp/css/adp-bs.css" />


<link type="text/css" rel="stylesheet" href="/adp-map/static/jquery/css/jquery-ui-1.11.3.css" />    
<link type="text/css" rel="stylesheet" href="/adp-map/static/bootstrap/3.3.6/css/bootstrap.css" /> 
<link type="text/css" rel="stylesheet" href="/adp-map/static/bootstrap/switch/css/bootstrap-switch.css" />

<link type="text/css" rel="stylesheet" href="/adp-map/static/assets/css/toolkit.css" />
<link type="text/css" rel="stylesheet" href="/adp-map/static/assets/css/application.css" />




<!--[if lt IE 9]>
  <script type="text/javascript" src="/adp-map/static/assets/js/html5shiv.min.js"></script>
  <script type="text/javascript" src="/adp-map/static/assets/js/respond.min.js"></script>
<![endif]-->



<script type="text/javascript" src="/adp-map/static/jquery/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/adp-map/static/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/adp-map/static/bootstrap/switch/js/bootstrap-switch.js"></script>
<script type="text/javascript" src="/adp-map/static/bootstrap/filestyle/bootstrap-filestyle.js"></script>

<script type="text/javascript" src="/adp-map/static/i18n/messages_zh_CN.js"></script>
<!-- 请在bootstrap.min.js文件后引入 。两者插件有冲突（如：tooltip），后者覆盖前者 。-->
<script type="text/javascript" src="/adp-map/static/jquery/js/jquery-ui-1.11.3.min.js"></script>
<script type="text/javascript" src="/adp-map/static/lodop/6.180/LodopFuncs.js"></script>
<script type="text/javascript" src="/adp-map/static/templatejs/template.js"></script>


<script type="text/javascript">	
	//定义全局的变量
	window.publicPath = "/adp-map";
	window.sp_locale = "zh_CN";
    window.time_zone = parseInt('') ;
    if(window.time_zone === ''|| !$.isNumeric(window.time_zone)){
        window.time_zone = 8;
    }


	function fixTop(){
		$('#clearFixTop').css('padding-top',$('#fixTopDiv').height()+5);  
	}
	$(document).ready(function(){
        fixTop();
        $(window).resize(function(){ fixTop();});
		 
	 });

</script>
    
  

<link type="text/css" rel="stylesheet" href="/adp-map/static/jqgrid/5.1.1/css/ui.jqgrid.css" />
<script type="text/javascript" src="/adp-map/static/jqgrid/5.1.1/js/jquery.jqGrid.min.js"></script>
<script type="text/javascript" src="/adp-map/static/jqgrid/5.1.1/js/i18n/grid_locale_zh_CN.js" ></script>
<script type="text/javascript" src="/adp-map/static/jqgrid/jqgrid-responsive.js"></script>


<link type="text/css" rel="stylesheet" href="/adp-map/static/jquery/css/jquery.autocomplete.css"/>
<link type="text/css" rel="stylesheet" href="/adp-map/static/datepicker/css/bootstrap-datetimepicker.min.css" />
<link type="text/css" rel="stylesheet" href="/adp-map/static/jquery-validation/1.11.1/validate.css"  /> 

<script type="text/javascript" src="/adp-map/static/jquery/js/jquery.autocomplete.js"></script>
<script type="text/javascript" src="/adp-map/static/jquery/js/jquery.placeholder.js"></script>
<script type="text/javascript" src="/adp-map/static/datepicker/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="/adp-map/static/datepicker/i18n/bs_datetimepicker_zh_CN.js"></script>
<script type="text/javascript" src="/adp-map/static/datepicker/js/custom-datepicker-init.js"></script> 
<script type="text/javascript" src="/adp-map/static/jquery-validation/1.11.1/jquery.validate.js" ></script>
<script type="text/javascript" src="/adp-map/static/jquery-validation/1.11.1/i18n/lang_zh_CN.js" ></script>
<script type="text/javascript" src="/adp-map/static/jquery-validation/1.11.1/i18n/additional-methods_zh_CN.js" ></script>
<script type="text/javascript" src="/adp-map/static/jquery/js/jquery.form.min.js"></script>
 
 
<link type="text/css" rel="stylesheet" href="/adp-map/static/zTree/3.5.24/css/metroStyle.css" /> 

<script type="text/javascript" src="/adp-map/static/zTree/3.5.24/js/jquery.ztree.all.min.js"></script>
<script type="text/javascript" src="/adp-map/static/zTree/3.5.24/js/jquery.ztree.exhide.min.js"></script>
 

<script type="text/javascript" src="/adp-map/static/adp/js/core/adp_utils.js"></script>
<script type="text/javascript" src="/adp-map/static/adp/js/core/adp_utils_ext.js"></script>

<script type="text/javascript" src="/adp-map/static/adp/js/jquery/plugins.bootstrap.js"></script>
<script type="text/javascript" src="/adp-map/static/adp/js/jquery/plugins.autocomplete.js"></script>
<script type="text/javascript" src="/adp-map/static/adp/js/jquery/plugins.validate.js"></script>

<script type="text/javascript" src="/adp-map/static/adp/js/jquery/plugins.fn.inputs.js"></script>
<script type="text/javascript" src="/adp-map/static/adp/js/jquery/plugins.fn.extends.js"></script>
<script type="text/javascript" src="/adp-map/static/adp/js/jquery/plugins.plg.cmn.js"></script>
 
<script type="text/javascript" src="/adp-map/static/adp/js/business/gt_gfmt.js"></script>
<script type="text/javascript" src="/adp-map/static/adp/js/business/gt_mfmt.js"></script>
<script type="text/javascript" src="/adp-map/static/adp/js/business/gt_mntn.js"></script>

<style type="text/css">
.red {
	color: red;
	margin-left: 10px;
}
.ipc-graphic-sheet{
border:5px solid #eee;
}
img {
	width:100%;
	width:100%/9;
	height:auto;
	padding:5px;
	
}
#easy_zoom{
	width:73%;
	height:480px;	
	border:5px solid #eee;
	background:#fff;
	color:#333;
	position:absolute;
	top:60px;
	left:10px;
	overflow:hidden;
	-moz-box-shadow:0 0 10px #777;
	-webkit-box-shadow:0 0 10px #777;
	box-shadow:0 0 10px #777;
	/* vertical and horizontal alignment used for preloader text */
	line-height:400px;
	text-align:center;
	}
	
.ipc-part-table  {
/*//font-family: OCRB10N;*/
}



.ztree.ztree-mobile li {
	line-height: 40px;
	border:1px solid gray;
    height:auto;
    white-space: normal;
    margin-top:4px;
    margin-bottom:4px;
    padding-top:4px;
    padding-bottom:4px;
}
.ztree.ztree-mobile li a {
	clear:both;
	height:auto;
	display:inline;
}
.ztree.ztree-mobile * {
    font-size: 30px;
}
.ztree.ztree-mobile li span.button.switch {
    height: 23px;
}
.ztree.ztree-mobile li a.curSelectedNode {
    background-color: #ffe6b0;
    border: 1px solid #ffb951;
    color: black;
    height: auto;
    opacity: 0.8;
    padding-top: 0;
}
.ztree.ztree-mobile li span.button.ico_open {
  margin-top: 0.5em;
}
.ztree.ztree-mobile li span.button.ico_close {
    margin-top:0.5em;
}
.ztree.ztree-mobile li span.button.ico_loading{margin-top: 13px;}
.ztree.ztree-mobile li span.button.ico_docu{margin-top: 13px;}
	
</style>


<script type="text/javascript" src="/adp-map/static/adp/js/xmlToJSON.js"></script>
<script type="text/javascript" src="/adp-map/static/easyzoom/easyzoom2.js"></script>
<script type="text/javascript" src="/adp-map/static/adp/js/business/ipc-parse.js"></script>
<script type="text/javascript">
var browser={ 
	 versions:function(){
	 var u = navigator.userAgent, app = navigator.appVersion; 
	 return {//移动终端浏览器版本信息 
	 trident: u.indexOf('Trident') > -1, //IE内核 
	 presto: u.indexOf('Presto') > -1, //opera内核 
	 webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核 
	 gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核 
	 mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端 
	 android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器 
	 iPhone: u.indexOf('iPhone') > -1 , //是否为iPhone或者QQHD浏览器 
	 iPad: u.indexOf('iPad') > -1, //是否iPad 
	 webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部 
	};
	}(),
	language:(navigator.browserLanguage || navigator.language).toLowerCase() 
}

if(browser.versions.mobile || browser.versions.android || 
	browser.versions.iPhone || browser.versions.iPad){ 
	$(function(){
		$('.ztree').addClass('ztree-mobile');
	});
}
/***************将已选择的件号数据发送给objectC********/

	//WebViewJavascriptBridge
	;(function() {
		if (window.WebViewJavascriptBridge) { return }
		var messagingIframe
		var sendMessageQueue = []
		var receiveMessageQueue = []
		var messageHandlers = {}
		
		var CUSTOM_PROTOCOL_SCHEME = 'wvjbscheme'
		var QUEUE_HAS_MESSAGE = '__WVJB_QUEUE_MESSAGE__'
		
		var responseCallbacks = {}
		var uniqueId = 1
		
		function _createQueueReadyIframe(doc) {
			messagingIframe = doc.createElement('iframe')
			messagingIframe.style.display = 'none'
			messagingIframe.src = CUSTOM_PROTOCOL_SCHEME + '://' + QUEUE_HAS_MESSAGE
			doc.documentElement.appendChild(messagingIframe)
		}

		function init(messageHandler) {
			if (WebViewJavascriptBridge._messageHandler) { throw new Error('WebViewJavascriptBridge.init called twice') }
			WebViewJavascriptBridge._messageHandler = messageHandler
			var receivedMessages = receiveMessageQueue
			receiveMessageQueue = null
			for (var i=0; i<receivedMessages.length; i++) {
				_dispatchMessageFromObjC(receivedMessages[i])
			}
		}

		function send(data, responseCallback) {
			_doSend({ data:data }, responseCallback)
		}
		
		function registerHandler(handlerName, handler) {
			messageHandlers[handlerName] = handler
		}
		
		function callHandler(handlerName, data, responseCallback) {
			_doSend({ handlerName:handlerName, data:data }, responseCallback)
		}
		
		function _doSend(message, responseCallback) {
			if (responseCallback) {
				var callbackId = 'cb_'+(uniqueId++)+'_'+new Date().getTime()
				responseCallbacks[callbackId] = responseCallback
				message['callbackId'] = callbackId
			}
			sendMessageQueue.push(message)
			messagingIframe.src = CUSTOM_PROTOCOL_SCHEME + '://' + QUEUE_HAS_MESSAGE
		}

		function _fetchQueue() {
			var messageQueueString = JSON.stringify(sendMessageQueue)
			sendMessageQueue = []
			return messageQueueString
		}

		function _dispatchMessageFromObjC(messageJSON) {
			setTimeout(function _timeoutDispatchMessageFromObjC() {
				var message = JSON.parse(messageJSON)
				var messageHandler
				var responseCallback

				if (message.responseId) {
					responseCallback = responseCallbacks[message.responseId]
					if (!responseCallback) { return; }
					responseCallback(message.responseData)
					delete responseCallbacks[message.responseId]
				} else {
					if (message.callbackId) {
						var callbackResponseId = message.callbackId
						responseCallback = function(responseData) {
							_doSend({ responseId:callbackResponseId, responseData:responseData })
						}
					}
					
					var handler = WebViewJavascriptBridge._messageHandler
					if (message.handlerName) {
						handler = messageHandlers[message.handlerName]
					}
					
					try {
						handler(message.data, responseCallback)
					} catch(exception) {
						if (typeof console != 'undefined') {
							GT.console.log("WebViewJavascriptBridge: WARNING: javascript handler threw.", message, exception)
						}
					}
				}
			})
		}
		
		function _handleMessageFromObjC(messageJSON) {
			if (receiveMessageQueue) {
				receiveMessageQueue.push(messageJSON)
			} else {
				_dispatchMessageFromObjC(messageJSON)
			}
		}

		window.WebViewJavascriptBridge = {
			init: init,
			send: send,
			registerHandler: registerHandler,
			callHandler: callHandler,
			_fetchQueue: _fetchQueue,
			_handleMessageFromObjC: _handleMessageFromObjC
		}

		var doc = document
		_createQueueReadyIframe(doc)
		var readyEvent = doc.createEvent('Events')
		readyEvent.initEvent('WebViewJavascriptBridgeReady')
		readyEvent.bridge = WebViewJavascriptBridge
		doc.dispatchEvent(readyEvent)
	})();
	//WebViewJavascriptBridge--END
	
	
	$(function(){
		function connectWebViewJavascriptBridge(callback) {
			if (window.WebViewJavascriptBridge) {
				callback(WebViewJavascriptBridge)
			} else {
				document.addEventListener('WebViewJavascriptBridgeReady', function() {
					callback(WebViewJavascriptBridge)
				}, false)
			}
		}
		connectWebViewJavascriptBridge(function(bridge) {
			var uniqueId = 1
			function log(message, data) {
				/* var log = document.getElementById('log')
				var el = document.createElement('div')
				el.className = 'logLine'
				el.innerHTML = uniqueId++ + '. ' + message + ':<br/>' + JSON.stringify(data)
				if (log.children.length) { log.insertBefore(el, log.children[0]) }
				else { log.appendChild(el) } */
			}
			
			bridge.init(function(message, responseCallback) {
				//message 是objectc发来的
				log('JS got a message', message)
				
				var data = { 'Javascript Responds':'Wee!' }
				log('JS responding with', data)
				//这里的responseCallback就是 registerHandler的函数
				responseCallback(data)
			})
			//OBJTC发送信息给js
			bridge.registerHandler('testJavascriptHandler', function(data, responseCallback) {
				log('ObjC called testJavascriptHandler with', data)
				var responseData = { 'Javascript Says':'Right back atcha!' }
				log('JS responding with', responseData)
				responseCallback(responseData)
			})
			
			/* var button = document.getElementById('buttons').appendChild(document.createElement('button'))
			button.innerHTML = 'Send message to ObjC'
			button.onclick = function(e) {
				e.preventDefault()
				var data = 'Hello from JS button'
				log('JS sending message', data)
				bridge.send(data, function(responseData) {
					log('JS got response', responseData)
				})
			} */

			/* document.body.appendChild(document.createElement('br'))

			var callbackButton = document.getElementById('buttons').appendChild(document.createElement('button'))
			callbackButton.innerHTML = 'Fire testObjcCallback'
			callbackButton.onclick = function(e) {
				e.preventDefault()
				log('JS calling handler "testObjcCallback"')
				bridge.callHandler('testObjcCallback', {'foo': 'bar'}, function(response) {
					log('JS got response', response)
				})
			} */
		})
	});

/***************将已选择的件号数据发送给objectC---END********/
</script>
</head>
<body style="margin-left:15px;margin-right:15px;" >
<ul class="breadcrumb">
			<li class="active">健康监控</li>
			<li class="active" >维修管理</li>
			<li class="active" >选择零件</li>
			</ul>
<div role="tabpanel">
<div class="col-sm-12" style="margin-bottom:7px;">
	<label class="col-sm-2" for=""
	 style="text-align:right;">B-5398有效性代码：</label>
	<div class="col-sm-1">
		<label id="effect_tail" class="control-label col-sm-6"  >
			019
		</label>
	</div>
	<label class="col-sm-2" for=""
	 style="text-align:right;">已选零件：</label>
	<div class="col-sm-2">
		<button class="btn btn-default btn-sm" 
		onclick="viewChoosed();" type="button">
			查看 <span id='part-choosed-count' class="badge">0</span>
		</button>
	</div>
	<div class="col-sm-2">
		<button class="btn btn-default btn-sm" onclick="window.close();" type="button">
			 关闭
		</button>
		&nbsp;&nbsp;&nbsp;
		<button class="btn btn-primary btn-sm btn-submit-choose" type="button">
			 提交 
		</button>
		
	</div>
</div>
  <!-- Nav tabs -->
  <ul id="ipc-tab-ul" class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a id="tab-ipc-catalog-controll" href="#tab-ipc-catalog" aria-controls="tab-ipc-catalog" role="tab" data-toggle="tab">目录</a></li>
    
  </ul>

  <!-- Tab panes -->
  <div id="ipc-tab-div" class="tab-content"  style="overflow:auto;">
    <div role="tabpanel" class="tab-pane active" id="tab-ipc-catalog" >

		
		<div id="ipcTree" class="ztree clearfix col-xs-12"  ></div>
	</div>
	
  </div>
</div>	

<!-- Modal -->
<div class="modal fade" id="choose-part-modal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg" style="width: 85%;" >
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">已选零件列表</h4>
      </div>
      <div class="modal-body">
        <table id="ipc-part-choosed-table" class="table table-striped table-bordered" >
			
				
				
				<tr>
					<th>FIGURE</th>
					<th>ITEM</th><th>PART NUMBER</th><th>1234567 &nbsp;&nbsp;&nbsp;NOMENCLATURE</th>
					<th>EFFECT<BR>FROM TO</th><th>UNITS<BR>PER<BR>ASSY</th>
					<th>拆下件号</th>
					<th></th>
				</tr>
				
			

        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">继续选择</button>
        <button type="button" class="btn btn-primary btn-submit-choose">提交</button>
      </div>
    </div>
  </div>
</div>			

<script type="text/javascript">

function createTab(key){
	if($("#tab-controll-"+key).length){
		$("#tab-controll-"+key).tab('show');
		return 1;
	}else{
		var height = $("#ipc-tab-div").height();
		var text = key2text(key);
		var li = $('<li role="presentation"><a id="tab-controll-'+key+'" href="#tab-ipc-content-'+key+'" role="tab" data-toggle="tab">'+text
				+' &nbsp;<button type="button" onclick="destroyTab(\''+key+'\')"  class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button></a></li>')
		$(li).appendTo("#ipc-tab-ul");
		var div = 
			"<div role=\"tabpanel\" class=\"tab-pane\" id=\"tab-ipc-content-"+key+"\">" +
			"      <div class=\"ipc-part-container\"  style=\"width:75%;float:left;overflow:auto;max-height:"+height+"px;min-height:"+height+"px;\" >" + 
			"    <table class=\"ipc-part-table table table-striped table-bordered\"   >" + 
			"    </table>" + 
			"    </div>" + 
			"    <div class=\"ipc-graphic-container\" style=\"width:25%;float:left;overflow:auto;max-height:"+height+"px;min-height:"+height+"px;\">" + 
			"    </div>" + 
			"  </div>";
		$(div).appendTo("#ipc-tab-div");
		$("#tab-controll-"+key).tab('show');
		return 0;
	}
	
	
}

function destroyTab(key){
	
	var controllLi = $("#tab-controll-"+key).parent();
	var tobeShow = controllLi.prev();
	tobeShow.find('a').tab('show');
	controllLi.add("#tab-ipc-content-"+key).remove();
}

$(function(){
	var _tab_content_h = $(window).height()-$('body').height();
	$("#ipc-tab-div").each(function(){
		$(this).css('max-height',$(this).height()+_tab_content_h+'px');
		$(this).css('min-height',$(this).height()+_tab_content_h+'px');
	});
	$(window).resize(function (){
		var _tab_content_h = $("#ipc-tab-div").height()+$(window).height()-$('body').height();
		$("#ipc-tab-div,.ipc-part-container,.ipc-graphic-container").each(function(){
			$(this).css('max-height',_tab_content_h+'px');
			$(this).css('min-height',_tab_content_h+'px');
		});
	});

	//提交已选择的件号
	$('body').on('click','button.btn-submit-choose',function(){
		var $m = $("#choose-part-modal");
		var pd = $m.data('part-data');
		var choosedPart = [];
		for(var itemKey in pd){
			var part = pd[itemKey];
			choosedPart.push({
				itemKey:itemKey,
				pnr:part._part.pnr,
				pnrOff:part._part.pnrOff?part._part.pnrOff:part._part.pnr,
				itemEffect:part._part.part_effrg,
				upa:part._part.upa ,
				//ipcAta:part._part. ,
				adt:part._part.adt ,
				figureKey:part._part.figurekey,
				name:part._part.name,
				lbl:part._part.lbl
			});
		}
		//slog(choosedPart);
		var customPnrs = $("#customPnrContainer div.custom-pnr");
		if(customPnrs.length) {
			customPnrs.each(function () {
				choosedPart[choosedPart.length] = {
					pnr: $(this).data('pnr')
				}
			});
		}
		if(!choosedPart.length){
			BS.showMessage(MSG.TIP.chooseOneItemNumber,false);
		}else{
			submitChoosedPart(choosedPart);
		}
				
	});//提交已选择的件号--END
	


	 
	 //自己添加件号
	 $("#addCustomPnr").click(function(){
		 var val = $("#search_pnr").val();
		 if(!val)
			 return;
		 if($("#customPnrContainer div[data-pnr='"+val+"']").length)
			 return;
		 var _html =
				'<div class="custom-pnr" data-pnr="'+val+'" style="display:inline;width:20%;margin-left:5px;">'+
				'<a href="javascript:void(0);" onclick="$(this).parent().remove();"><span class="badge ">×</span></a>'+
				'<span class="badge">'+val+'</span>'+
			'</div>';
		$("#customPnrContainer").append(_html);
	 });
	 
	 ipcCatalog();

	$("#search_pnr").keyup(keyupFunc);

	$("#ipc-tab-div").on('click','.redirect-ipc>a',function(e){
	 var figureKey = $(e.target).data('figure-key');
	 if(createTab(figureKey)){
		 return ;
	 }
	showIpcByFigure(figureKey);
	})
	.on('click','.choose-part-on',function(e){
		 var btn =$(e.target);
		 var _partData = btn.parents('tr.part').data("part-data");

		 var partData = {};
		 $.extend(true,partData,_partData)
		 addChoosePart(partData);
		 BS.showMessage({
		 	message:MSG.TIP.added,
		 	isSuccess:true,
		 	isAnimation:false
		 })

	})
	.on('click','.choose-part-off-show',function(e){
		var $btn =$(e.target);
		var pnrOff = $btn.data('pnr-off');

		var $m = $("#choose-part-modal");
		var pd = $m.data('part-data');
		var _html = '<li role="separator" class="divider"></li><li>N/A</li>';
		if(!$.isEmptyObject(pd)){
			_html = '';
			for(var itemKey in pd){
				var part = pd[itemKey];
				if(!part._part.pnrOff){//没有拆下件号的装上件号
					_html += '<li role="separator" class="divider"></li><li><a href="javascript:void(0);" data-item-key="'+part._part.itemkey+'" data-pnr-off="'+pnrOff+'" class="choose-part-off">'+part._part.pnr+'</a></li>';
				}
			}
			if(!_html){
				_html = '<li role="separator" class="divider"></li><li>N/A</li>';
			}
		}
		_html +=	'<li role="separator" class="divider"></li>';
		$btn.next('ul').html(_html);
	}).on('click','.choose-part-off',function(e){
		var btn =$(e.target);
		var itemkey = btn.data('item-key');
		var pnrOff = btn.data('pnr-off');
		var $m = $("#choose-part-modal");
		var pd = $m.data('part-data');
		if(pd&&pd[itemkey]){
			pd[itemkey]._part.pnrOff = pnrOff;
			//update table dom cmn_delete
			var _html = pnrOff;
			_html +='<br><input onclick="removePnrOff(\''+itemkey+'\')" class="btn btn-sm btn-info" type="button" value="-" />';
			$("#ipc-part-choosed-table").find('tr[item-key="'+itemkey+'"] .pnr-off').html(_html);
		}
	});

	/*****************空客*****************************/
	
	/*****************空客--END*****************************/
});//$()END





var _deffered = null;

function keyupFunc(event){
	var $input = $('#search_pnr');
	$("body").off('keyup','#search_pnr',keyupFunc);
	$("body").on('keyup','#search_pnr',keyupFunc);
	var KEY = {
			38:"UP",
			40:"DOWN",
			//DEL: 46,
			9:"TAB",
			13:"RETURN",
			27:"ESC",
			188:"COMMA",
			33:"PAGEUP",
			34:"PAGEDOWN"
			//BACKSPACE: 8
	};

	if(event&&KEY[event.keyCode]){
		return;
	}


	$("div.ac_results").remove();
	$input.unautocomplete();

	$("body").off('keyup','#search_pnr',keyupFunc);
	$("body").on('keyup','#search_pnr',keyupFunc);

	if($input.val()){
		//终止没有结束的请求
		if(_deffered&&_deffered.state()!='resolved'){
			_deffered.abort();
		}

		//添加等待效果
		$("#search_pnr").addClass('waiting');

		_deffered = $.ajax({
			url:'/adp-map/manual/doc_rest;jsessionid=683221B751FA4E5ED9248BFF36ACA581/findSubPnr?aircraftType=737&pnr='+$input.val()+'&aircraftNo=B-5398',
			type:'get',
			cache:true,
			timeout:30*1000,
			dataType:'json',
		    success: findSubPnrCallBack

		}).always(function(xhr,sts){
			//删除等待效果
			if(sts=='timeout'){
				BS.errorMsg('请求超时,请重试。');
			}
			$("#search_pnr").removeClass('waiting');
		});
	}

}

function findSubPnrCallBack (data){
	var $input = $("#search_pnr");

	if(data&&data.length>0){
		$input.autocomplete(data, {
		    max:1000,     //列表里的条目数
		    minChars: 1,    //自动完成激活之前填入的最小字符
		    width: $("#search_pnr").outerWidth(),     //提示的宽度，溢出隐藏
		    scrollHeight: 300,   //提示的高度，溢出显示滚动条
		    matchContains: false,    //包含匹配，就是data参数里的数据，是否只要包含文本框里的数据就显示
		    autoFill: false,    //自动填充
		    clickFire:true,
		    formatItem: function(row, i, max) {//显示div里面的格式
		        return row.pnr+'('+row.count+')';
		    },
		    //输入框中输入文字后，下拉div是否显示：是将输入的内容与formatMatch返回的结果进行比较
		    formatMatch: function(row, i, max) {
				return row.pnr;
				},
			formatResult: function(row) {//最后在在输入框显示的值
		      return row.pnr;
		   }
		}).result(function(event, row, formatted){

			keyupFunc();
		}).trigger("showMatch");
	}

}

var setting = {
		view: {
			dblClickExpand: false,
			showLine: false,
			nameIsHTML : true
		},
		async: {
			enable: true,
			dataFilter:function(treeId, parentNode, responseData){
				//给name赋值，并对name和title添加efftext
				if($.isArray(responseData)&&responseData.length){
					for(var i in responseData){
						var one = responseData[i];
						one.name = one.title;
						if(one&&one.isParent===false){
							var _efftext = one.efftext?one.efftext:'** ON A/C ALL';
							one.name = one.name+"<span class=\"red\">"+_efftext+"</span>";
							one.title = one.title+"   "+_efftext;
						}
					}
				}

				// 空客IPC有前言，去除
				if(/^A/.test('737')){
					if(!parentNode){
						if(responseData&&responseData.length){
							var data = [];
							for(var i in responseData){
								var one = responseData[i];
								if(one&&one.key!="EN03"&&one.key!="EN04"){
									data.push(one);
								}
							}
							return data;
						}
					}
				}



				return responseData;
			},
			type:"post",
			url:"/adp-map/rest/ipc/list;jsessionid=683221B751FA4E5ED9248BFF36ACA581?aircraftNo=B-5398",
		    autoParam:["id"],
		    otherParam:{"zone":'',aircraftType:'737'},
			type:'post',
            dataType:'json'
		},
		data: {
			simpleData: {
				enable: true,
				idKey: "id",
				pIdKey: "parentId"
			},
			key:{
				name:"name",
				title:'title'
			}
		} ,
		callback: {
			onClick: zTreeOnClick,
			onAsyncSuccess : function(event, treeId, treeNode, msg){
				if(treeNode==null){//根节点
					BS.hideModalWaiting();
				}
			},
			onAsyncError : function(event, treeId, treeNode, XMLHttpRequest, textStatus, errorThrown){
				if(treeNode==null){//根节点
					BS.hideModalWaiting();
					BS.errorMsg('数据请求异常。');
				}
			},
			beforeAsync : function(treeId, treeNode){
				if(treeNode==null){//根节点
					BS.showModalWaiting();
				}
			}
		}
	};


	
	
	
	function zTreeOnClick(event, treeId, treeNode) {
		
	  	if(!treeNode.isParent){
	  		if(treeNode.key){
	  			$("#tab-ipc-content-controll").tab('show');
	  			var key = treeNode.key;
	  			if(createTab(key)){
	  				 return ;
	  			 }
	  			showIpcByFigure(key);
	  		}
	  	}
	  	//单击展开
	  	else{
	  		var zTree = $.fn.zTree.getZTreeObj("ipcTree");
	  		zTree.expandNode(treeNode);
	  	}
	  	
	}
	
	/*********************根据figureKey获得手册xml，并展示***********************/
	function showIpcByFigure(key){
		BS.showModalWaiting();
		var aircraftType = "737";
		/**********************AIRBUS********************/
		if(/^A/.test(aircraftType)){

			var mydata = {key:key,aircraftNo:'B-5398'};
			var getFigureUrl = '/adp-map/rest/ipc/airbusFigure;jsessionid=683221B751FA4E5ED9248BFF36ACA581?key='+key+'&aircraftNo=B-5398&isMobile=1';
			$.ajax({
				url:getFigureUrl,
				type:'get',
				dataType:'html'
			}).done(function(figure, textStatus, jqXHR ){
				$("#tab-ipc-content-"+key+" .ipc-part-container").html(figure);
			}).fail(function( jqXHR, textStatus, errorThrown){
				BS.errorMsg('根据figure获取手册内容时出现网络异常。');
			}).complete(function(){
				BS.hideModalWaiting();
			});

		}
		/**********************AIRBUS--END********************/

		/**********************BOEING********************/
		else{
			var getFigureUrl = '/adp-map/rest/ipc/getFigureXml;jsessionid=683221B751FA4E5ED9248BFF36ACA581?key='+key+'&aircraftNo=B-5398';
			$.ajax({
				url:getFigureUrl,
				type:'get',
				dataType:'xml'
			}).done(function(figureXml, textStatus, jqXHR ){
				//var figure = $.xml2json(figureXml);
				//从xml转换到json

				var figure = xmlToJSON.parseXML(figureXml,{
					normalize: false, // collapse multiple spaces to single space
					xmlns: false, // include namespaces as attribute in output
					childrenAsArray: false // force children into arrays
				});
				if(figure){
					figure = figure['figure'];
					if(figure){
						var ff = formatFigureJson(figure);
						figure2Html(ff);
					}
				}
			}).fail(function( jqXHR, textStatus, errorThrown){
				var xmlString = jqXHR.responseText;
				//IE8 ajax parsererror,所以拿到xml字符串，自己转化成DOC
				if(!/<\?xml/.test(xmlString)){
					BS.errorMsg('根据figure获取手册内容时出现网络异常。');
					return ;
				}
				xmlString = $('<div>'+xmlString+'</div>').html();
				var figureXml = xmlToJSON.stringToXML(xmlString);
				var figure = xmlToJSON.parseXML(figureXml,{
					normalize: false, // collapse multiple spaces to single space
					xmlns: false, // include namespaces as attribute in output
					childrenAsArray: false // force children into arrays
				});
				if(figure){
					figure = figure['figure'];
					if(figure){
						var ff = formatFigureJson(figure);
						figure2Html(ff);
					}
				}

			}).complete(function(){
				BS.hideModalWaiting();
			});
		}
		/**********************BOEING--END********************/
	}
	
	function figure2Html(figureJson){
		var $trs = $();
		var figure_key = figureJson.figurekey;
		var partArr = figureJson.part;
		var graphicArr = figureJson.graphic;
		var partt = $("#tab-ipc-content-"+figure_key+" .ipc-part-table");
		partt.data('figure-key',figure_key);
		$trs = $trs.add('<tr><th>FIG<BR>ITEM</th><th>PART NUMBER</th><th>1234567 &nbsp;&nbsp;&nbsp;NOMENCLATURE</th>'
			+'<th>EFFECT<BR>FROM TO</th><th>UNITS<BR>PER<BR>ASSY</th>');
		$trs = $trs.add(
				'<tr><td class="fignbr">'+figureJson.fignbr+'</td><td class="partnbr"></td><td class="nomenclature">'
				+figureJson.title+'</td>'
				+'<td class="effrg">'+formatEff(figureJson.effect)+'</td><td class="units"></td>');
		/////遍历prtlist///////
		for(var i =0;i<partArr.length;i++){
			var part = partArr[i];
			var $tr = formatPart(part);
			$trs = $trs.add($tr);
			
		}
		
		$trs.appendTo(partt);
		
		//遍历graphic
		var $graphicCon = $("#tab-ipc-content-"+figure_key+" .ipc-graphic-container");
		$graphicCon.html("");
		if(graphicArr){
			var graphic_html = "";
			
			for(var sheetIndex =0;sheetIndex<graphicArr.length;sheetIndex++){
				var sheet = graphicArr[sheetIndex];
				var image_name = sheet.name;
				var g_title = sheet.title;
				
				graphic_html+='<div class="ipc-graphic-sheet"><a class="zoom"  href="http://ngx.imsp.cn/doc/CCA/B737/AIPC/PNG//'+image_name+'.png" >'
				+'<img alt="'+g_title+'" src="http://ngx.imsp.cn/doc/CCA/B737/AIPC/PNG//'+image_name+'.png" >'
						+'</a></div>'
						;
			}
			//slog(graphic_html);
			$graphicCon.html(graphic_html);
			$('.zoom').each(function(){
				$(this).easyZoom();
			});		
		}
		
	}
	
	function formatEff(effect){
		var res = '';
		var len = effect.length;
		if(effect&&len%6==0){
			for(var i=0;i<len/6;i++){
				var eff = effect.substring(i*6,i*6+6);
				//eff = eff.substring(0,3)+'&nbsp;-&nbsp;'+eff.substring(3,6);
				res += eff+'<br>';
			}
			return res;
		}else{
			return effect?effect:'';
		}
		
		
	}
	function formatPart(part,isRead){
		//FIGITEM 一列的内容
		var figitemCol=part.fignbr;
		//PART NUMBER
		var partNbrCol='';
		var itemkey = part._part.itemkey;
		var indent = part._part.indent;
		var isattach = part._part.isattach;
		var partNbrCol = part.partnbr;
		if(partNbrCol){
			if(isattach==1){
				partNbrCol+="<br>(ATTACHING PART)";
			}

			//没拆解过的零件也可以选择
			/*if(new Number(indent)>1){*/
				if(!isRead){
					partNbrCol += '<br><div class="col-16-8" ><button class="btn btn-success btn-sm choose-part-on" data-item-key="'+itemkey
							+'" type="button" >装上</button></div>';

					partNbrCol += '<div class="col-16-8" ><div class="btn-group">'
							+'<button class="btn btn-default btn-sm choose-part-off-show" dropdown-toggle" '
							+'data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-pnr-off="'+part._part.pnr+'" data-item-key="'+itemkey
							+'" type="button" >拆下<span class="caret"></span></button>'
							+'<ul class="dropdown-menu"></ul>'
							+'</div></div>';
				}
			/*}*/
		}
		//NOMENCLATURE
		var nomenclatureCol = part.nomenclature;
		//EFFECT
		var effectCol = formatEff(part.effrg);
		//UNITS PER ASSY
		var upaCol = part.units;
		var $tr =$(
			'<tr item-key="'+itemkey+'" class="part" ><td class="fignbr">'+figitemCol+'</td>'
			   +'<td class="partnbr" style="min-width:120px;">'+partNbrCol+'</td>'
			   +'<td class="nomenclature">'+nomenclatureCol+'</td>'
			   +'<td class="effrg">'+effectCol+'</td>'
			   +'<td class="units">'+upaCol+'</td>');
		$tr.data('part-data',part);
		if(!isRead){
			$tr.find('span.redirect-ipc').each(function(){
				var redct = $(this);
				var ref_figure_key = redct.data("figure-key");
				var ref_figure_text = redct.text();
				redct.html('<a  data-figure-key="'+ref_figure_key+'" class="btn btn-link" href="javascript:{};">'
						+ref_figure_text+'</a>');
			});
			
		}
		return $tr;
	}
	/*********************根据figureKey获得手册xml，并展示--END***********************/

	function ipcCatalog(){
		  var aircraftType = '737';
		  var aircraftSection = $("#choose_aircraftSection").val();
		  var subZone = $("#subZone").val();
		  var specZone = $("#specZone").val(); 	 		 
		  var pnr = $("#search_pnr").val();
		  
		  var otherParam = setting.async.otherParam;
		  /**特殊处理**/
		  if(aircraftSection=='400'&&!subZone){
			subZone=400;
			specZone=400;
		  }
		  /**特殊处理END**/
		  if(pnr||subZone){
			if(subZone){
		   		otherParam.zone=specZone?specZone:subZone;
		   		
			}else{
				delete otherParam.zone;
			}
			
			if(pnr){
				$.ajax({
                  url:'/adp-map/manual/doc_rest;jsessionid=683221B751FA4E5ED9248BFF36ACA581/findfigureKeysByPnr?pnr='+pnr+'&aircraftNo=B-5398',
                  type:'get',
                  dataType:'json',
                  success:function(response){
                      var figureKeys = '';
                      if($.isArray(response)){
                      	 $.each(response, function(i, n){
                               figureKeys += ','+n.figureKey;
                          });
                      }
                      if(figureKeys){
                      	
	                        otherParam.figureKeys = figureKeys.substring(1);
	                        $.fn.zTree.init($("#ipcTree"), setting);
                      }else{
                      	BS.errorMsg("根据件号没有查询到任何数据！");
                      }
                  }
               });
				return;
			}else{
				delete otherParam.figureKeys;
			}
			
	  		$.fn.zTree.init($("#ipcTree"), setting);
		  }else{
			setting.async.otherParam={'aircraftType':aircraftType};
			$.fn.zTree.init($("#ipcTree"), setting);
		  }
			
	}
	
	
	function viewChoosed(){
		
		
		var $m = $("#choose-part-modal");
		
		$m.modal('show');
	}

	function addChoosePart(partData){
		
		var $m = $("#choose-part-modal");
		var pd = $m.data('part-data');
		if(!pd){
			pd={};
		}
		var figureKey = partData._part.figurekey;
		var itemKey = partData._part.itemkey;
		if(!pd[itemKey]){
			pd[itemKey]=partData;
			//添加到DOM
			var table = $("#ipc-part-choosed-table");
			var $tr = $('#tab-ipc-content-'+figureKey+' [item-key="'+itemKey+'"].part').clone(true,true);
			$tr.find('.choose-part-on,.btn-group').remove();
			$tr.prepend('<td>'+key2text(figureKey)+'</td>');
			
			$tr.append('<td class="pnr-off"></td>'
					+'<td><input onclick="removeChoosePart(\''+itemKey+'\')" class="btn btn-sm btn-info" type="button" value="-"></td>');
			$tr.appendTo(table);
			
			var cnt = $("#part-choosed-count").text();
			cnt = new Number(cnt);
			$("#part-choosed-count").text(cnt+1);
		}
		$m.data('part-data',pd);
	}
	
	function removeChoosePart(itemkey){
		
		
		var modal = $("#choose-part-modal");
		var pd = modal.data('part-data');
		if(pd){
			delete pd[itemkey];
			
			var cnt = $("#part-choosed-count").text();
			cnt = new Number(cnt);
			$("#part-choosed-count").text(cnt-1);
		}
		$("#ipc-part-choosed-table tr[item-key='"+itemkey+"']").remove();
		
	}

	function removePnrOff(itemkey){


		var modal = $("#choose-part-modal");
		var pd = modal.data('part-data');
		if(pd){
			delete pd[itemkey]._part.pnrOff;
		}
		$("#ipc-part-choosed-table tr[item-key='"+itemkey+"'] .pnr-off").html('');

	}
	
	function submitChoosedPart(parts){
		if('1'=='1'){
			WebViewJavascriptBridge.send(parts, function(responseData) {
				
			});	
		}else{
			PLG.smartOpenCallback(parts);
		}
	}
</script>
</body>
</html>
