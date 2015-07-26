define(function(require, exports, module) {
	require('seajs/amain');
	require('fuelux.tree');
	$(function(event){
		$("#edit").click(function(e){
			$('#tree1').tree("getSelectedByIndex",0,function(treeData,el){
				var self = this;
				if(el){
					$("#input_modal").find("form").find("[name=id]").val(treeData.id)
					.end().find("[name=name]").val(treeData.name);
					$("#input_modal").modal("show").find(".modal-title").text("编辑产品类型");
				}else{
					alert("请选中产品类型！");
				}
			});
		});
		
		$("#delete").click(function(e){
			$('#tree1').tree("getSelectedByIndex",0,function(treeData,el){
				var self = this;
				if(el){
					var ok = confirm('是否确认删除！')
					if(ok){
						$.ajax({
							   type: "POST",
							   url: "../adminproduct/deletetype",
							   cache:false,
							   data: {id:treeData.id},
							   success: function(data){
								   if(data.status == 1){
									   self.remove($(el));
									   alert("删除成功！");
								   }else{
									   alert("删除失败！");
								   }
							   },
							   error:function(){
								   alert("操作失败！");
							   }
							 })
					}
				}else{
					alert("请选中产品类型！");
				}
			});
		});
		
		$("#plus").click(function(e){
			var $form = $("#input_modal").find("form");
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
						   if(data.id == null){
							   if(data.parentId == null){
								   $('#tree1').tree("add",null,{id:data.returnEntity.id,name:data.returnEntity.name,type:"item",attr:{"data-id":data.returnEntity.id}});
							   }else{
								   $('#tree1').tree("getFirstByAttr","data-id",data.parentId,function(treeData,el){
									   this.add($(el),{id:data.returnEntity.id,name:data.returnEntity.name,type:"item",attr:{"data-id":data.returnEntity.id}});
								   });
							   }
						   }else{
							   $('#tree1').tree("getFirstByAttr","data-id",data.id,function(treeData,el){
								   this.update($(el),{id:data.returnEntity.id,name:data.returnEntity.name,type:treeData["type"],attr:{"data-id":data.returnEntity.id}});
							   });
						   }
						   $target.closest(".modal").modal("hide");
					   }else{
						   alert("保存失败！")
					   }
				   },
				   error:function(){
					   alert("异常！");
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
		
		$("#input_modal").on('hide.bs.modal', function (e) {
			// 执行一些动作...
			var $this = $(this);
			$this.find(".modal-title").text("添加产品类型")
			.end().find("form").find("input").val("")
			.end().find(".parentType:not(.hide)").addClass("hide")
			.end().find(".parentType p").text("");
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