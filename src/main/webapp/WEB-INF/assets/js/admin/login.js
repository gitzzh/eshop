define(function(require, exports, module) {
	require('seajs/amain');
	$(function(){
		if(canVerify){
			$(".verify").show();
			recode();
		}
		
		$("#myForm [type=submit]").click(function(){
			signIn($("#myForm").serialize() , function(item,status){
				if(status == 1){
					$(".form-error .message").html("");
					$(".form-error").addClass("none");
					location.href = item.redirectURL;
				}else if(status == -1){
					$(".form-error .message").html("用户不存在！");
					$(".form-error").removeClass("none");
				}else if(status == -2){
					$(".form-error .message").html("密码错误！");
					$(".form-error").removeClass("none");
				}else if(status == -3){
					$(".form-error .message").html("验证码错误！");
					$(".form-error").removeClass("none");
				}
				
				if(status < 0){
					if(item.errorNum != null && item.errorNum >= 3){
						$(".verify").show();
						recode();
					}
				}
			});
		});
		
		$("#changeVerifyImage").click(recode);
	});
	
	function recode(){
		$("#verifyImage").attr("src","../verifyImage?a="+Math.random());
	}
	
	function signIn(formData,callback){
		$.ajax({
			url : "../admin/signin",
			type : "post",
			data : formData,
			error : function() {
				callback({},0);
			},
			success : function(data) {
				callback(data,data.status);
			}
		});
	}
})