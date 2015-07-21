define(function(require, exports, module) {
	require('seajs/amain');
	require('fuelux.tree');
	$(function(event){
		$("#select_but").click(function(e){
			$('#tree1').tree("getSelectedByIndex",0,function(treeData,el){
				treeData && alert(treeData.id);
			});
		});
		
		$("#add_but").click(function(e){
			$('#tree1').tree("getSelectedByIndex",0,function(treeData,el){
				this.add(el == null ? null : $(el) ,{text: 'Cats', type: 'item'});
			});
		});
		
		$("#remove_but").click(function(e){
			$('#tree1').tree("getSelectedByIndex",0,function(treeData,el){
				el && this.remove($(el));
			});
		});
		

		$('#tree1').ace_tree({
			dataSource: remoteDataSource,
			multiSelect: false,
			cacheItems: true,
			folderSelect:true,
			'open-icon' : 'ace-icon tree-minus',
			'close-icon' : 'ace-icon tree-plus',
			'selectable' : true,
			'selected-icon' : 'ace-icon fa fa-check',
			'unselected-icon' : 'ace-icon fa fa-times',
			loadingHTML : '<div class="tree-loading"><i class="ace-icon fa fa-refresh fa-spin blue"></i></div>'
		});
	});
	
	

	var remoteDataSource = function(options, callback) {
		var parent_id = null
		if (!('text' in options || 'type' in options)) {
			parent_id = null; //load first level data  
		} else if ('type' in options && options['type'] == 'folder') { //it has children  
			if ('id' in options)  
			     parent_id = options['id' ]  
		}

		$.ajax({
			url : "../adminproduct/loadtype",
			data : {
				parentId : parent_id
			},
			type : 'POST',
			dataType : 'json',
			success : function(response) {
				if (response.status == 1)
					callback({
						data : $.map(response.data,function(object){
							object["type"] = object["hasChildren"] ? "folder" : "item";
							object["additionalParameters"] = {};
							return object;
						})
					})
			},
			error : function(response) {
				// console.log(response);
			}
		})

	}
})