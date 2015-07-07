<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<jsp:include page="/common/admin-main.jsp" />
<link href="${assets}/css/admin-signin.css" rel="stylesheet">
<script>
	canVerify =${canVerify};
	seajs.use("js/admin/login");
</script>
</head>
<body style="background-color: #fff !important;" >
<div class="container">
		<form class="form-signin" id="myForm" onsubmit="return false;">
			<h3 class="form-signin-heading">登录您的账号</h3>
			<div class="alert alert-danger form-error none">
				<!-- <a href="#" class="close" data-dismiss="alert" aria-hidden="true">
			      &times;
			   	</a> -->
			   	<span class="message"></span>
			</div>
			<label for="account" class="sr-only">Email address</label> <input type="text" name="account" class="form-control" placeholder="登录名" autofocus>
			<label for="password" class="sr-only">Password</label> <input type="password" name="password" class="form-control" placeholder="密码" >
			<div class="none verify">
				<input type="text" name="code" class="form-control" placeholder="验证码" ><img src="#" id="verifyImage"><a id="changeVerifyImage">换一张</a>
			</div>
			<div class="checkbox">
				<label> <input type="checkbox" name ="remember" value="1">
					记住登录
				</label>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit">立即登录</button>
		</form>
	</div> <!-- /container -->
</body>
</html>