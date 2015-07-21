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
		<script>
			seajs.use("js/product/typemanage");
		</script>
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
							<button id="select_but">show selected Item</button>
							<button id="add_but">add Item</button>
							<button id="remove_but">remove Item</button>
							<div class="widget-box widget-color-blue2">
								<div class="widget-header">
									<h4 class="widget-title lighter smaller">Choose Categories</h4>
								</div>
								<div class="widget-body">
									<div class="widget-main padding-8">
										<ul id="tree1"></ul>
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
</html>