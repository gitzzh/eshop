<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Enumeration" %>
<%
	String query = "";
	Enumeration<String> e = request.getParameterNames();
	while (e.hasMoreElements()) {
		String paramName = e.nextElement();
		if (!"currentPageNO".equals(paramName)) {
			query = paramName + "=" + request.getParameter(paramName) + "&"
					+ query;
		}
	}
%>
<input type="hidden" value="${listInfo.maxPageNO }" id="totalPage"/>
<input type="hidden" value="${listInfo.sizeOfTotalList }" id="totalRecords"/>
<input type="hidden" value="${listInfo.currentPageNO }" id="pageNo"/>
<input type="hidden" value="${request['javax.servlet.forward.request_uri'] }" id="hrefLatterss"/>
<input type="hidden" value="<%=query%>" id="queryss"/>
    <div id="kkpager"></div>