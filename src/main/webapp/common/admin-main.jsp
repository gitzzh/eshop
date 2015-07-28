<%@page import="com.eshop.utils.DomainUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setAttribute("versionCode", DomainUtils.getVersionCode());
request.setAttribute("localDomain", DomainUtils.getLocalDomain());
request.setAttribute("assets", DomainUtils.getAssets());
%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link href="${assets}/public/css/bootstrap.min.css" rel="stylesheet">
<link href="${assets}/public/css/ace.min.css" rel="stylesheet" class="ace-main-stylesheet" id="main-ace-style">
<link href="${assets}/public/css/font-awesome.min.css" rel="stylesheet">
<link href="${assets}/plugins/kkpager/css/kkpager.css" rel="stylesheet">
<link href="${assets}/css/admin-default.css" rel="stylesheet">
<script src="${assets}/seajs/2.2.1/sea.js?v=${versionCode}"></script>
<script src="${assets}/seajs/2.2.1/config.js?v=${versionCode}"></script>
<script type="text/javascript">
     localDomain = "${localDomain }";
</script>
