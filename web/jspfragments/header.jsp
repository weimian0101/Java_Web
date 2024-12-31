<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html> <head> <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

	<style>
		body {
			background-image: url('${pageContext.request.contextPath}/images/background.jpg'); /* 添加背景图片 */
			background-size: cover;
			background-attachment: fixed;
			color: #333; /* 设置文本颜色 */
			padding-top: 48px;
			background-blend-mode: multiply; /* 使用混合模式 */
			background-color: rgba(255, 255, 255, 0.8); /* 添加背景颜色 */
		}

		.navbar {
			background-color: rgba(255, 255, 255, 0.8); /* 半透明背景 */
			border: none;
			border-radius: 0;
			box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
			transition: background-color 0.3s; /* 添加过渡效果 */
		}

		.navbar:hover {
			background-color: rgba(255, 255, 255, 1); /* 悬停时背景颜色变化 */
		}

		.navbar-brand img {
			max-width: 150px; /* 调整logo大小 */
			margin-top: -15px;
			transition: max-width 0.3s; /* 添加过渡效果 */
		}

		.navbar-nav > li > a {
			color: #333; /* 设置导航链接颜色 */
			transition: color 0.3s; /* 添加过渡效果 */
		}

		.navbar-nav > li > a:hover {
			color: #007bff; /* 悬停时颜色变化 */
		}

		.navbar-nav > li.active > a, .navbar-nav > li.active > a:focus, .navbar-nav > li.active > a:hover {
			background-color: #007bff; /* 设置激活状态背景颜色 */
			color: #fff; /* 设置激活状态文字颜色 */
		}

		.navbar-form .form-control {
			background-color: rgba(255, 255, 255, 0.9); /* 半透明背景 */
			border: 1px solid #ddd;
			transition: background-color 0.3s; /* 添加过渡效果 */
		}

		.navbar-form .form-control:focus {
			background-color: rgba(255, 255, 255, 1); /* 聚焦时背景颜色变化 */
		}

		.navbar-form .btn {
			background-color: #007bff;
			border-color: #007bff;
			color: #fff;
			transition: background-color 0.3s, border-color 0.3s; /* 添加过渡效果 */
		}

		.navbar-form .btn:hover {
			background-color: #0056b3;
			border-color: #0056b3;
		}

		.navbar-btn {
			background-color: #007bff;
			border-color: #007bff;
			color: #fff;
			transition: background-color 0.3s, border-color 0.3s; /* 添加过渡效果 */
		}

		.navbar-btn:hover {
			background-color: #0056b3;
			border-color: #0056b3;
		}

		.dropdown-menu {
			background-color: rgba(255, 255, 255, 0.9); /* 半透明背景 */
			border: 1px solid #ddd;
			box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
			transition: background-color 0.3s; /* 添加过渡效果 */
		}

		.dropdown-menu > li > a {
			color: #333; /* 设置下拉菜单链接颜色 */
			transition: color 0.3s; /* 添加过渡效果 */
		}

		.dropdown-menu > li > a:hover {
			background-color: #007bff; /* 设置下拉菜单激活状态背景颜色 */
			color: #fff; /* 设置下拉菜单激活状态文字颜色 */
		}

		@media (max-width: 767px) {
			.navbar-brand img {
				max-width: 100px; /* 调整小屏幕下的logo大小 */
			}
		}
	</style>

	<title>header</title>
</head> <body> <!-- 未登录则引入登录/注册所需的模态框 --> <c:if test="${empty sessionScope.user and empty sessionScope.admin}"> <jsp:include page="/jspfragments/login.jsp" /> <jsp:include page="/jspfragments/register-user.jsp" /> </c:if> <!-- 页头 --> <!--响应式导航栏--> <nav class="navbar navbar-default navbar-fixed-top" role="navigation"> <div class="container"> <div class="navbar-header"> <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#example-navbar-collapse"> <span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
	<a href="${pageContext.request.contextPath}/index.jsp"
	   class="navbar-brand"><img alt="Brand"
								 style="max-width: 200px; margin-top: -40px;"
								 src="${pageContext.request.contextPath}/images/header/logo.png"></a>
</div>

	<div class="collapse navbar-collapse navbar-left"
		 id="example-navbar-collapse">
		<ul class="nav navbar-nav">
			<li class="active"><a
					href="${pageContext.request.contextPath}/index.jsp"><span
					class="glyphicon glyphicon-home"></span>主页</a></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown"><span
					class="glyphicon glyphicon-th-list"></span> 菜单 <b class="caret"></b>
			</a>
				<ul class="dropdown-menu">
					<li><a
							href="${pageContext.request.contextPath}/servlet/searchItemPageServlet?">全部</a></li>
					<li class="divider"></li>
					<li><a
							href="${pageContext.request.contextPath}/servlet/searchItemPageServlet?type=匕首">匕首</a></li>
					<li class="divider"></li>
					<li><a
							href="${pageContext.request.contextPath}/servlet/searchItemPageServlet?type=探员">探员</a></li>
					<li class="divider"></li>
					<li><a
							href="${pageContext.request.contextPath}/servlet/searchItemPageServlet?type=枪皮">枪皮</a></li>
				</ul></li>
		</ul>
	</div>

	<!--搜索栏-->
	<form class="navbar-form navbar-left"
		  action="${pageContext.request.contextPath}/servlet/searchItemPageServlet?"
		  role="search" method="get">
		<div class="form-group">
			<input name="nameKeyword" type="text" class="form-control"
				   placeholder="Search" size="11">
		</div>
		<button type="submit" class="btn btn-primary">搜索</button>
	</form>

	<!--登录注册/用户中心、退出-->
	<c:if test="${empty sessionScope.user and empty sessionScope.admin}">
		<ul class="nav navbar-nav navbar-right">
			<li><button type="submit" class="btn btn-info navbar-btn"
						data-toggle="modal" data-target="#login" href="">
				<span class="glyphicon glyphicon-log-in"></span>&nbsp;登录
			</button></li>
			<!-- 形成简单间隔 -->
			<li>&nbsp;&nbsp;&nbsp;</li>
			<li><button type="submit" class="btn btn-success navbar-btn"
						data-toggle="modal" data-target="#register" href="">
				<span class="glyphicon glyphicon-user"></span>&nbsp;注册
			</button></li>
		</ul>
	</c:if>
	<c:if
			test="${not empty sessionScope.user or not empty sessionScope.admin}">
		<ul class="nav navbar-nav navbar-right">

			<li><a href="#"><span class="text-primary">欢迎回来，${sessionScope.user.account}${sessionScope.admin.account}</span></a></li>
			<c:if test="${not empty sessionScope.user}">
				<li><a
						href="${pageContext.request.contextPath}/servlet/getShoppingcartServlet"><span
						class="glyphicon glyphicon-shopping-cart"></span> 购物车</a></li>
				<li><a
						href="${pageContext.request.contextPath}/pages/user/modify-info.jsp"><span
						class="glyphicon glyphicon-user"></span> 个人中心</a></li>
			</c:if>
			<c:if test="${not empty sessionScope.admin}">
				<li><a
						href="${pageContext.request.contextPath}/pages/admin/manage-users.jsp"><span
						class="glyphicon glyphicon-user"></span> 管理中心</a></li>
			</c:if>

			<li><button type="submit" class="btn btn-danger navbar-btn"
						onclick="window.location.href='${pageContext.request.contextPath}/servlet/logoutServlet'">
				<span class="glyphicon glyphicon-log-out"></span> 退出
			</button></li>
		</ul>
	</c:if>
</div>
</nav> </body>
</html>