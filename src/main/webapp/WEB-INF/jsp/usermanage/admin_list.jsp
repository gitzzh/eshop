<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="商品管理" />
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
									商品管理
								</small>
							</h1>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<button class="btn btn-sm btn-primary" type="button" onclick="location.href='../adminproduct/productinput'">
						          <span class="glyphicon glyphicon-plus"></span> 添加商品
						        </button>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-xs-12">
							
								<table class="table table-hover">
									<thead>
										<tr align="center">
											<td>编号</td>
											<td>创建时间</td>
											<td>名称</td>
											<td>成本</td>
											<td>售价</td>
											<td>状态</td>
											<td>操作</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${listInfo.currentList }" var="var">
											<tr>
												<td>${var.id }</td>
												<td><fmt:formatDate value="${var.createTime }" pattern="yyyy-MM-dd" /></td>
												<td>${var.name }</td>
												<td><fmt:formatNumber value="${var.cost }" pattern="#.##" /></td>
												<td><fmt:formatNumber value="${var.price }" pattern="#.##" /></td>
												<td>
													<c:choose>
														<c:when test="${var.status == 1 }">
															<span class="label label-success">上架</span>
														</c:when>
														<c:otherwise>
															<span class="label label-warning">下架</span>
														</c:otherwise>
													</c:choose>
												</td>
												<td>
													<a href="../adminproduct/productinput?id=${var.id }" title="编辑">编辑</a>
													<%-- <a href="../adminproduct/productdelete?id=${var.id }" title="删除">删除</a> --%>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div class="pagination">
                                	<jsp:include page="/common/pagebar.jsp"></jsp:include>
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
		seajs.use("seajs/amain");
	</script>
</html>