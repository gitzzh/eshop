define(function(require, exports, module) {
	require('seajs/amain');
	require('jquery.validate');
	require('jquery.validate_zh');
	
	$(function(e){
		$("#myForm").validate({
			errorElement: 'div',
			errorClass: 'help-block',
			focusInvalid: false,
			rules: {
				"product.name": {
					required: true
				},
				"product.cost": {
					required: true,
					number:true,
					min:0
				},
				"product.price": {
					required: true,
					number:true,
					min:0
				}
			},
			highlight: function (e) {
				$(e).closest('.form-group').removeClass('has-info').addClass('has-error');
			},
	
			success: function (e) {
				$(e).closest('.form-group').removeClass('has-error');
				$(e).remove();
			},
			submitHandler: function (form) {
				form.submit();
			}
		});
		
		
	});
});