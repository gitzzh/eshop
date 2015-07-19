<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="sidebar" class="sidebar                  responsive">
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
				</script>
				<ul class="nav nav-list">
					<!-- <li class="active">
						<a href="../admin/home">
							<i class="menu-icon fa fa-tachometer"></i>
							<span class="menu-text"> home </span>
						</a>
						<b class="arrow"></b>
						
					</li> -->
					
					<li <c:if test='${requestScope["javax.servlet.forward.request_uri"].indexOf("/adminproduct/typemanage")>0}'>class="active open"</c:if>>
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-list"></i>
							<span class="menu-text"> 产品管理 </span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
							<li <c:if test='${requestScope["javax.servlet.forward.request_uri"].indexOf("/adminproduct/typemanage")>0}'>class="active"</c:if>>
								<a href="../adminproduct/typemanage">
									<i class="menu-icon fa fa-caret-right"></i>
									产品类目
								</a>

								<b class="arrow"></b>
							</li>
							
							<!-- <li class="">
								<a href="tables.html">
									<i class="menu-icon fa fa-caret-right"></i>
									产品列表
								</a>

								<b class="arrow"></b>
							</li>

							<li class="">
								<a href="jqgrid.html">
									<i class="menu-icon fa fa-caret-right"></i>
									添加产品
								</a>

								<b class="arrow"></b>
							</li> -->
						</ul>
					</li>
					
				</ul><!-- /.nav-list -->

				<!-- #section:basics/sidebar.layout.minimize -->
				<!-- <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div> -->

				<!-- /section:basics/sidebar.layout.minimize -->
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
				</script>
			</div>