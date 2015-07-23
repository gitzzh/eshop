<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>产品管理-产品类目</title>
		<meta name="description" content="overview &amp; stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		<jsp:include page="/common/admin-main.jsp" />
	</head> 

	<body class="no-skin">
		<!-- #section:basics/navbar.layout -->
		<jsp:include page="/common/admin-navbar.jsp" />
		<!-- /section:basics/navbar.layout -->
		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>
			<!-- #section:basics/sidebar -->
			<jsp:include page="/common/admin-sidebar.jsp" />
			<!-- /section:basics/sidebar -->
			<div class="main-content">
				<div class="main-content-inner">
					<!-- /section:basics/content.breadcrumbs -->
					<div class="page-content">
						<div class="page-header">
							<h1>
								产品管理
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									产品类目
								</small>
							</h1>
						</div><!-- /.page-header -->

						<div class="row">
							<div class="col-sm-6">
							<!-- <button id="select_but">show selected Item</button>
							<button id="add_but">add Item</button>
							<button id="remove_but">remove Item</button> -->
							<div class="widget-box widget-color-blue2">
								<div class="widget-header">
									<h4 class="widget-title lighter smaller">Choose Categories</h4>
								</div>
								<div class="widget-body">
									<div class="widget-main padding-8">
										<button type="button" class="btn btn-sm btn-primary" id="plus">
								          <span class="glyphicon glyphicon-plus"></span> 添加
								        </button>
										<button type="button" class="btn btn-sm btn-warning" id="edit">
								          <span class="glyphicon glyphicon-edit"></span> 编辑
								        </button>
										<button type="button" class="btn btn-sm btn-danger" id="delete">
								          <span class="glyphicon glyphicon-remove"></span> 删除
								        </button>
										<ul id="tree1"></ul>
									</div>
								</div>
							</div>
							</div><!-- /.col -->
					</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->
			<!-- 模态框（Modal） -->
			<div class="modal fade" data-keyboard="true" id="input_modal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title"><!-- 模态框（Modal）标题 --></h4>
						</div>
						<div class="modal-body">
							<!-- <table class="table">
								<tr>
									<td align="right">名称</td>
									<td><input type="text" name="name" /></td>
								</tr>
								<tr class="hide">
									<td align="right">所属类型</td>
									<td>所属类型</td>
								</tr>
							</table> -->
							<form id="myForm" role="form" class="form-horizontal">
								<div class="form-group">
							 		<label for="name" class="col-sm-2 control-label">名称</label>
							 		<div class="col-sm-10">
							 			<input type="text" name="name" placeholder="请输入名称">
							 		</div>
							 	</div>
								<div class="form-group parentType hide">
							 		<label class="col-sm-2 control-label">所属类型</label>
							 		<div class="col-sm-10">
							 			<input type="hidden" name="parentId" value="">
							 			<p class="form-control-static"><!-- 所属类型 --></p>
							 		</div>
							 	</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary btn-sm" id="myFormSubmit">保存</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
			</div>
			<!-- /.modal -->
			<jsp:include page="/common/admin-footer.jsp" />
		</div>
		<!-- /.main-container -->
	</body>
	<script>
		seajs.use("js/product/typemanage");
	</script>
</html>