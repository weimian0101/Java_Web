<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>☆☆在线购物系统☆☆</title>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<link
			href="${pageContext.request.contextPath}/css/bootstrap.min.css"
			rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

	<style>
		body {
			background-image: url('${pageContext.request.contextPath}/images/background.jpg'); /* 添加背景图片 */
			background-size: cover;
			background-attachment: fixed;
			color: #333; /* 设置文本颜色 */
		}

		.container {
			background-color: rgba(255, 255, 255, 0.8); /* 半透明背景 */
			padding: 20px;
			border-radius: 10px;
			margin-top: 20px;
		}

		.panel {
			background-color: rgba(255, 255, 255, 0.9); /* 半透明背景 */
			margin-bottom: 20px;
		}

		.panel-heading {
			background-color: rgba(255, 255, 255, 0.9); /* 半透明背景 */
			padding: 10px;
			border-bottom: 1px solid #ddd;
		}

		.panel-body {
			padding: 15px;
		}

		.nav-pills > li > a {
			color: #333; /* 设置导航链接颜色 */
		}

		.nav-pills > li.active > a, .nav-pills > li.active > a:focus, .nav-pills > li.active > a:hover {
			background-color: #007bff; /* 设置激活状态背景颜色 */
			color: #fff; /* 设置激活状态文字颜色 */
		}

		.btn-primary {
			background-color: #007bff;
			border-color: #007bff;
		}

		.btn-success {
			background-color: #28a745;
			border-color: #28a745;
		}

		.btn-danger {
			background-color: #dc3545;
			border-color: #dc3545;
		}

		.btn-warning {
			background-color: #ffc107;
			border-color: #ffc107;
		}

		.btn-info {
			background-color: #17a2b8;
			border-color: #17a2b8;
		}

		.btn-primary:hover {
			background-color: #0056b3;
			border-color: #0056b3;
		}

		.btn-success:hover {
			background-color: #218838;
			border-color: #218838;
		}

		.btn-danger:hover {
			background-color: #c82333;
			border-color: #c82333;
		}

		.btn-warning:hover {
			background-color: #d39e00;
			border-color: #d39e00;
		}

		.btn-info:hover {
			background-color: #117a8b;
			border-color: #117a8b;
		}
	</style>
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
								class="glyphicon glyphicon-th-large"></span>管理中心</font></a></li>
					</ul>
				</div>
				<div class="panel-body">
					<ul class="nav nav-pills nav-stacked">
						<li><a
								href="${pageContext.request.contextPath}/pages/admin/manage-users.jsp">
							<span class="glyphicon glyphicon-user"></span> 管理用户
						</a></li>
						<li><a
								href="${pageContext.request.contextPath}/pages/admin/manage-items.jsp"><span
								class="glyphicon glyphicon glyphicon-leaf"></span> 管理商品</a></li>
						<li class="nav-divider"></li>
						<li class="active"><a
								href="${pageContext.request.contextPath}/pages/admin/order-history.jsp">
							<span class="glyphicon glyphicon-list-alt"></span> 历史订单
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
					<p>正文内容</p>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>