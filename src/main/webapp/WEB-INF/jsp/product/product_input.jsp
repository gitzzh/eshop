<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>${empty product ? '添加' : '编辑' }商品</title>
		<meta name="description" content="${empty product ? '添加' : '编辑' }商品" />
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
									${empty product ? '添加' : '编辑' }商品
								</small>
							</h1>
						</div>
						<div class="row">
							<div class="col-sm-6">

							<div class="widget-box">
								<div class="widget-header widget-header-blue widget-header-flat">
									<h4 class="widget-title lighter">请填写下面表单</h4>
								</div>

								<div class="widget-body">
									<div class="widget-main">
										<form class="form-horizontal" id="myForm" role="form" action="../adminproduct/productsave">
											<input type="hidden" name="product.id" value="${product.id }">
											<div class="form-group">
												<label for="name"
													class="col-sm-2 control-label no-padding-right">名称：</label>
												<div class="col-sm-10">
													<input type="text" name="product.name"
														value="${product.name }" placeholder="请输入名称">
												</div>
											</div>
											<div class="form-group">
												<label for="name"
													class="col-sm-2 control-label no-padding-right">成本：</label>
												<div class="col-sm-10">
													<input type="text" name="product.cost"
														value="${product.cost }" placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="name"
													class="col-sm-2 control-label no-padding-right">售价：</label>
												<div class="col-sm-10">
													<input type="text" name="product.price"
														value="${product.price }" placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="name"
													class="col-sm-2 control-label no-padding-right">状态：</label>
												<div class="col-sm-10">
													<label class="checkbox-inline"> <input type="radio"
														name="product.status" <c:if test="${empty product.status || product.status == 1 }">checked="checked"</c:if> value="1">
														上架
													</label> <label class="checkbox-inline"> <input
														type="radio" name="product.status" <c:if test="${product.status == 0 }">checked="checked"</c:if> value="0"> 下架
													</label>
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-offset-2 col-sm-10">
													<button type="submit" class="btn btn-sm btn-primary">保存</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->
			<jsp:include page="/common/admin-footer.jsp" />
		</div><!-- /.main-container -->
	</body>
	<script>
		seajs.use("js/product/product_input");
	</script>
</html>