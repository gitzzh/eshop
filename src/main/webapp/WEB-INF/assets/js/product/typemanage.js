define(function(require, exports, module) {
	require('seajs/amain');
	require('fuelux.tree');
	$(function(event){
		/*$("#select_but").click(function(e){
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
		});*/
		
		$("#plus").click(function(e){
			var $form = $("#input_modal").find("form");
			$form.find("input").val("");
			$('#tree1').tree("getSelectedByIndex",0,function(treeData,el){
				treeData && $form.find(".parentType").find("[name=parentId]").val(treeData.id).end().find("p").text(treeData.name).end().filter(".hide").removeClass("hide")
				treeData || $form.find(".parentType:not(.hide)").addClass("hide");
			});
			$("#input_modal").modal("show").find(".modal-title").text("添加产品类型");
		});
		
		$("#myFormSubmit").click(function(e){
			var $target = $(e.target);
			var $form = $("#myForm");
			$.ajax({
				   type: "POST",
				   url: "../adminproduct/producttypesave",
				   cache:false,
				   data: $form.serialize(),
				   success: function(data){
					   if(data.status == 1){
						   if(data.parentId == null){
							   $('#tree1').tree("add",null,{id:data.entity.id,name:data.entity.name,type:"item",attr:{"data-id":data.entity.id}});
						   }else{
							   $('#tree1').tree("getFirstByAttr","data-id",data.parentId,function(treeData,el){
								   this.add($(el),{id:data.entity.id,name:data.entity.name,type:"item",attr:{"data-id":data.entity.id}});
							   });
						   }
						   $target.closest(".modal").modal("hide");
					   }else{
						   alert("保存失败！")
					   }
				   },
				   error:function(){
					   alert("保存失败！");
				   }
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
							object["attr"] = {"data-id":object["id"]};
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