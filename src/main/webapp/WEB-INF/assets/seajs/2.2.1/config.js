
seajs.config({
	
    alias: {
		 "jquery":"public/js/jquery-1.11.2.min.js",
		 "bootstrap.min":"public/js/bootstrap.min.js",
		 "bootstrap-datepicker.min":"public/js/bootstrap-datepicker.min.js",
		 "bootstrap-datepicker.zh-CN":"public/js/bootstrap-datepicker.zh-CN.js",
		 "ace-extra.min" : "public/js/ace-extra.min.js",
		 "ace.min":"public/js/ace.min.js",
		 "ace-elements.min":"public/js/ace-elements.min.js",
		 "fuelux.tree":"plugins/fuelux/fuelux.tree.js",
		 "kkpager":"plugins/kkpager/js/kkpager.min.js",
		 "paging":"public/js/paging.js",
		 "jquery.validate":"plugins/jquery-validation-1.14.0/jquery.validate.min.js",
		 "jquery.validate_zh":"plugins/jquery-validation-1.14.0/messages_zh.min.js"
    },  
    preload: ["jquery"],
    map: [
    	[ /^(.*\.(?:css|js))/i, '$1?v=20150401' ]
    ]
  });
