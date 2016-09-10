/***
	validatebox 数据验证通用规则定义
*/
// 手机号
var MOBILE_REG = /^1[34578]\d{9}$/;
// 整数
var INTGER_REGEX = /^0$|^\-?[1-9]+[0-9]*$/;
// 身份证号
var CARD_NO = /^(\d{6}[12][09]\d{2}(0[1-9]|1[012])[0-3]\d{4}[\dXx])|(\d{6}\d{2}(0[1-9]|1[012])[0-3]\d{4})$/;
// 用户名，字母、下划线、数字组成，或EMAIL
var USER_NAME = /^[a-zA-Z]+[0-9a-zA-Z_]*$/;
// IP地址，可以略过最后一位
var IP = /^\d{2,3}\.\d{1,3}\.\d{1,3}(\.\d{1,3})?$/;
// 英文分号分隔的多个ip
var IPS = /^(\d{2,3}\.\d{1,3}\.\d{1,3}(\.\d{1,3})?\;*)+$/;
// 文件名
var FILE_NAME = /^[0-9a-zA-Z_]{1,50}(\.[0-9a-zA-Z]{1,4})?$/; 

$(function() {
	
	jQuery.validator.addMethod("mobile", function(value,element) {   
	    return this.optional(element) || MOBILE_REG.test(value);   
	}, "请输入有效的手机号码");   
		
	jQuery.validator.addMethod("cardNo", function(value,element) {   
	    return this.optional(element) || CARD_NO.test(value);   
	 
	}, "请输入有效的身份证号码");   
	
	jQuery.validator.addMethod("username", function(value,element) {   
	    return this.optional(element) || USER_NAME.test(value);   
	 
	}, "请输入有效的名称");   
	
	jQuery.validator.addMethod("ip", function(value,element) {   
	    return this.optional(element) || IP.test(value);   
	 
	}, "请输入正确的IP地址格式");   
	
	jQuery.validator.addMethod("filename", function(value,element) {   
	    return this.optional(element) || FILE_NAME.test(value);   
	 
	}, "请输入正确的文件名称");   
	
	jQuery.validator.addMethod("ips", function(value,element) {   
	    return this.optional(element) || IPS.test(value);   
	 
	}, "请输入正确的IP地址格式,多个以英文分号分隔");
	
	jQuery.validator.addMethod("integer", function(value,element) {   
	    return this.optional(element) || INTGER_REGEX.test(value);   
	 
	}, "请输入有效的整数");
});

CLOUD.Validate = function(formid, submtfun, rules, ignore) {
	$("#" + formid).validate({
		errorElement: 'span', //default input error message container
        errorClass: 'help-block help-block-error', // default input error message class
        focusInvalid: false, // do not focus the last invalid input
		ignore: ignore==null || ignore == undefined ? ':hidden' : ignore , // 开启hidden验证
		// 验证规则
		rules : rules
		,invalidHandler : function() {
			CLOUD.messager.alertError('数据验证不正确，请检查输入数据');
		}
		,errorPlacement : function(error, element) {
			//CLOUD.messager.alert('['+$(element).attr('name')+']' + $(error).html());
			var icon = $(element);
            icon.attr("data-original-title", error.text()).tooltip({'container': 'body', 'tooltipClass': 'trig-tooltipcls'});
		},
		highlight: function(element, errorClass) {
			$(element).addClass('trig-input-error');	// 不符合规则input加红框
		  },
		 unhighlight: function(element, errorClass) {
			  $(element).removeClass('trig-input-error'); // 去掉红框
		 },
		 success: function (label, element) {
             //$(element).closest('.form-group').removeClass('has-error'); // set success class to the control group
         },
		 submitHandler : submtfun
	});
};

CLOUD.ClearError = function() {
	$(".trig-input-error").removeClass('trig-input-error');
};