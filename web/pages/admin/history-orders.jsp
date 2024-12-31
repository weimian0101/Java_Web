<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>☆☆在线购物系统☆☆</title>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<style>
		body {
			background-image: url('${pageContext.request.contextPath}/images/background.jpg'); /* 添加背景图片 */
			background-size: cover;
			background-attachment: fixed;
			color: #333; /* 设置文本颜色 */
			font-family: 'Arial', sans-serif; /* 添加字体 */
		}

		.container {
			background-color: rgba(255, 255, 255, 0.8); /* 半透明背景 */
			padding: 20px;
			border-radius: 10px;
			margin-top: 20px;
			box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 添加阴影效果 */
		}

		.panel {
			background-color: rgba(255, 255, 255, 0.9); /* 半透明背景 */
			margin-bottom: 20px;
			border-radius: 10px;
			box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 添加阴影效果 */
		}

		.panel-heading {
			background-color: rgba(255, 255, 255, 0.9); /* 半透明背景 */
			padding: 10px;
			border-bottom: 1px solid #ddd;
			border-radius: 10px 10px 0 0;
		}

		.panel-body {
			padding: 15px;
		}

		#item img {
			width: 30px;
		}

		.nav-pills > li > a {
			color: #333; /* 设置导航链接颜色 */
			transition: background-color 0.3s, color 0.3s; /* 添加过渡效果 */
		}

		.nav-pills > li > a:hover {
			background-color: #007bff; /* 设置悬停状态背景颜色 */
			color: #fff; /* 设置悬停状态文字颜色 */
		}

		.nav-pills > li.active > a, .nav-pills > li.active > a:focus, .nav-pills > li.active > a:hover {
			background-color: #007bff; /* 设置激活状态背景颜色 */
			color: #fff; /* 设置激活状态文字颜色 */
		}

		.table {
			background-color: rgba(255, 255, 255, 0.9); /* 半透明背景 */
			margin-bottom: 20px;
			border-radius: 10px;
			box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 添加阴影效果 */
		}

		.table th, .table td {
			vertical-align: middle;
		}

		.table tr:hover {
			background-color: rgba(255, 255, 255, 1); /* 悬停时背景颜色变化 */
		}

		.modal-content {
			background-color: rgba(255, 255, 255, 0.9); /* 半透明背景 */
			border-radius: 10px;
			box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 添加阴影效果 */
		}

		.modal-title {
			background-color: rgba(255, 255, 255, 0.9); /* 半透明背景 */
			padding: 10px;
			border-bottom: 1px solid #ddd;
			border-radius: 10px 10px 0 0;
			font-size: 24px; /* 增加字体大小 */
			font-weight: bold; /* 加粗字体 */
		}

		.modal-body {
			padding: 20px;
		}

		.pager {
			background-color: rgba(255, 255, 255, 0.9); /* 半透明背景 */
			padding: 10px;
			border-radius: 10px;
			margin-top: 20px;
			box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 添加阴影效果 */
		}

		.btn {
			border-radius: 5px; /* 圆角边框 */
			transition: background-color 0.3s, border-color 0.3s; /* 添加过渡效果 */
		}

		.btn-primary {
			background-color: #007bff;
			border-color: #007bff;
			color: #fff;
		}

		.btn-primary:hover {
			background-color: #0056b3;
			border-color: #0056b3;
		}

		.btn-success {
			background-color: #28a745;
			border-color: #28a745;
			color: #fff;
		}

		.btn-success:hover {
			background-color: #218838;
			border-color: #1e7e34;
		}

		.btn-danger {
			background-color: #dc3545;
			border-color: #dc3545;
			color: #fff;
		}

		.btn-danger:hover {
			background-color: #c82333;
			border-color: #bd2130;
		}

		.btn-info {
			background-color: #17a2b8;
			border-color: #17a2b8;
			color: #fff;
		}

		.btn-info:hover {
			background-color: #138496;
			border-color: #117a8b;
		}

		.btn-default {
			background-color: #fff;
			border-color: #ddd;
			color: #333;
		}

		.btn-default:hover {
			background-color: #e2e6ea;
			border-color: #adb5bd;
		}

		.form-control {
			border-radius: 5px; /* 圆角边框 */
			transition: border-color 0.3s; /* 添加过渡效果 */
		}

		.form-control:focus {
			border-color: #007bff; /* 聚焦时边框颜色变化 */
		}

		@media (max-width: 767px) {
			.container {
				margin-top: 10px; /* 减少顶部间距 */
			}
			.modal-title {
				font-size: 20px; /* 减少字体大小 */
			}
			.pager {
				margin-top: 10px; /* 减少顶部间距 */
			}
		}
	</style>
</head>
<body>
<!-- 无itemsPage且没有操作失败,进入时，重新请求getUsersPagesServlet -->
<c:if test="${empty ordersPage}">
	<script>
		window.location.href = '${pageContext.request.contextPath}/servlet/getHistoryOrdersPageServlet';
	</script>
</c:if>

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
								href="${pageContext.request.contextPath}/pages/admin/history-orders.jsp">
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
				<div class="panel-heading" style="height: 55px">
					<div class="pull-left">
						<font size="4" style="line-height: 35px"><strong>历史订单</strong></font>
					</div>
					<div class="pull-right">
						<!-- 刷新按钮 -->
						<button class="btn btn-success"
								onclick="window.location.href='${ordersPage.url }&currentPage=${ordersPage.currentPage}'">
							<span class="glyphicon glyphicon-refresh"></span>刷&nbsp;新
						</button>
					</div>
				</div>
				<div class="panel-body">
					<!--搜索栏-->
					<center>
						<form class="navbar-form "
							  action="${pageContext.request.contextPath}/servlet/getHistoryOrdersPageServlet"
							  role="search" method="get">
							<div class="form-group">
								<div class="btn-group  pull-left" data-toggle="buttons">
									<label class="btn btn-default active"> <input
											name="status" value="account" type="radio" checked>用户名
									</label> <label class="btn btn-default"> <input name="status"
																					value="orderId" type="radio"> 订单号
								</label>
								</div>
								<input name="keyword" type="text" class="form-control"
									   placeholder="Search">
							</div>
							<button type="submit" class="btn btn-primary">搜索</button>
						</form>
					</center>
					<br />
					<!-- 表格 -->
					<table class="table table-striped" style="text-align: center">
						<thead>
						<tr>
							<th>订单编号</th>
							<th>用户</th>
							<th>总计</th>
							<th>创建时间</th>
							<th>查看详情</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="order" items="${requestScope.ordersPage.list}">
							<tr>
								<td>${order.orderId}</td>
								<td>${order.account}</td>
								<td>${order.orderTotal}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${order.createdTime}"/></td>
								<!-- 查看详情 -->
								<td>
									<form action="${pageContext.request.contextPath}/servlet/getOrderDetailServlet" method="post">
										<input type="hidden" name="orderId" value="${order.orderId}" />
										<button class="btn btn-info" type="submit">
											<span class="glyphicon glyphicon-zoom-in"></span>
										</button>
									</form>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<center>第${ordersPage.currentPage}页/共${ordersPage.totalPage}页</center>
					<nav>
						<ul class="pager">
							<c:if test="${ordersPage.currentPage>1 }">
								<li class="previous"><a
										href="${ordersPage.url}&currentPage=1">首页</a></li>
								<li class="previous"><a
										href="${ordersPage.url}&currentPage=${ordersPage.currentPage-1}">上一页</a></li>
							</c:if>
							<c:if test="${ordersPage.currentPage<ordersPage.totalPage}">
								<li class="next"><a
										href="${ordersPage.url }&currentPage=${ordersPage.totalPage}">尾页</a></li>
								<li class="next"><a
										href="${ordersPage.url }&currentPage=${ordersPage.currentPage+1}">下一页</a></li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 订单详情弹框 -->
<div id="order-detail" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
				<h1 class="modal-title text-center">订单详情</h1>
			</div>
			<!-- 主体 -->
			<div class="modal-body" id="item">
				<table class="table table-striped" style="text-align: center">
					<thead>
					<tr>
						<th>商品</th>
						<th>商品名</th>
						<th>类型</th>
						<th>数量</th>
						<th>单价</th>
						<th>小计</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="item" items="${requestScope.list}">
						<tr>
							<td><img
									src="${pageContext.request.contextPath}${item.imageUrl}"></td>
							<td>${item.name}</td>
							<td>${item.type}</td>
							<td>${item.number}</td>
							<td>${item.price}</td>
							<td>${item.number*item.price}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>

				<center><font size="4"><strong>总价：${total}&nbsp;&nbsp;&nbsp;&nbsp;</strong></font><br/><br/>
					<button class="btn btn-primary" data-dismiss="modal">关&nbsp;&nbsp;闭</button>
				</center>
			</div>
		</div>
	</div>
</div>

<!-- 获取订单详情后提示 -->
<c:if test="${not empty list}">
	<script>
		$('#order-detail').modal("show");
	</script>
</c:if>

</body>
</html>