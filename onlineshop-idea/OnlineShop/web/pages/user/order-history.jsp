<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>☆☆diff饰品交易平台☆☆</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link
	href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>


</head>
<body>
	<!-- 网页头部 -->
	<jsp:include page="/jspfragments/header.jsp" />

	<!-- 网页正文 -->
	<br />

	<div class="container">
		<div class="row">
			<!-- 左侧菜单栏 -->
			<div class="col-md-2">
				<div class="panel panel-default">
					<div class="panel-heading">
						<ul class="nav nav-pills nav-stacked">
							<li class="disabled"><a href="#"><font size="3"
									style="font-weight: bold;"><span
										class="glyphicon glyphicon-th-large"></span>用户中心</font></a></li>
						</ul>
					</div>
					<div class="panel-body">
						<ul class="nav nav-pills nav-stacked">
							<li><a href="${pageContext.request.contextPath}/pages/user/modify-info.jsp"> <span
									class="glyphicon glyphicon-user"></span> 修改信息
							</a></li>
							<li><a href="${pageContext.request.contextPath}/pages/user/modify-password.jsp"><span
									class="glyphicon glyphicon-lock"></span> 修改密码</a></li>
							<li class="nav-divider"></li>
							<li class="active"><a href="${pageContext.request.contextPath}/pages/user/order-history.jsp"> <span
									class="glyphicon glyphicon-list-alt"></span> 历史订单
							</a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- 右侧主体 -->
			<div class="col-md-10">
				<!-- 上半部分 -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<font size="3"> <span class="glyphicon glyphicon-list-alt"></span>
							历史订单
						</font>
					</div>
				</div>
				<!-- 下半部分 -->
				<div class="panel panel-default">
					<div class="panel-heading">历史订单</div>
					<div class="panel-body">
					<p>正文
					</div>
				</div>
			</div>

		</div>
	</div>

</body>
</html>