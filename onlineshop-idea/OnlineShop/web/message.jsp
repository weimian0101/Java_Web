<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Online Shop</title>
</head>
<body>

	<!-- 网页头部 -->
	<jsp:include page="/jspfragments/header.jsp" />

	<!-- 网页正文 -->
	<h1>Message页面</h1>
	<h2>${requestScope.message}</h2>

</body>
</html>