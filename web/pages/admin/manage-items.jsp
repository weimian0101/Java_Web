<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>☆☆在线购物系统☆☆</title>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

		.btn-warning {
			background-color: #ffc107;
			border-color: #ffc107;
			color: #fff;
		}

		.btn-warning:hover {
			background-color: #d39e00;
			border-color: #d39e00;
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
			.panel-heading {
				font-size: 18px; /* 减少字体大小 */
			}
			.panel-body {
				padding: 10px; /* 减少内边距 */
			}
			.table {
				font-size: 14px; /* 减少字体大小 */
			}
		}
	</style>
</head>
<body>
<!-- 无itemsPage且没有操作失败,进入时，重新请求getUsersPagesServlet -->
<c:if
		test="${empty itemsPage and empty operateSuccess and empty operateError}">
	<script>
		window.location.href = '${pageContext.request.contextPath}/servlet/getItemsPageServlet';
	</script>
</c:if>

<!-- 网页头部 -->
<jsp:include page="/jspfragments/header.jsp" />

<!-- 增删改弹框引入 -->
<jsp:include page="/jspfragments/item/add-item.jsp" />
<jsp:include page="/jspfragments/item/add-image.jsp" />
<jsp:include page="/jspfragments/item/modify.jsp" />
<jsp:include page="/jspfragments/item/delete.jsp" />

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
						<li class="active"><a
								href="${pageContext.request.contextPath}/pages/admin/manage-items.jsp"><span
								class="glyphicon glyphicon glyphicon-leaf"></span> 管理商品</a></li>
						<li class="nav-divider"></li>
						<li><a
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
					<font size="3"><span
							class="glyphicon glyphicon glyphicon-leaf"></span> 管理商品 </font>
				</div>
			</div>
			<!-- 下半部分 -->
			<div class="panel panel-default">
				<!-- 头部 -->
				<div class="panel-heading" style="height: 55px">
					<div class="pull-left">
						<font size="4" style="line-height: 35px">管理商品</font>
					</div>
					<div class="pull-right">
						<button class="btn btn-primary" data-toggle="modal"
								data-target="#add-item">
							<span class="glyphicon glyphicon-plus"></span>新&nbsp;增
						</button>
						<button class="btn btn-success"
								onclick="window.location.href='${itemsPage.url }&currentPage=${itemsPage.currentPage}'">
							<span class="glyphicon glyphicon-refresh"></span>刷&nbsp;新
						</button>
					</div>
				</div>
				<!-- 主列表 -->
				<div class="panel-body">
					<table class="table table-striped" style="text-align: center">
						<thead>
						<tr>
							<th>ID</th>
							<th>名称</th>
							<th>类型</th>
							<th>库存量</th>
							<th>单价</th>
							<th>删除</th>
							<th>编辑</th>
							<th>上传图片</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="item" items="${requestScope.itemsPage.list}">
							<tr>
								<td>${item.itemId}</td>
								<td>${item.name}</td>
								<td>${item.type}</td>
								<td>${item.stock}</td>
								<td>${item.price}</td>
								<!-- 提交到本页面，激活修改 -->
								<td>
									<form method="post">
										<input type="hidden" name="delete" value="1" />
										<input type="hidden" name="itemId" value="${item.itemId}" />
										<input type="hidden" name="name" value="${item.name}" />
										<button class="btn btn-danger" type="submit">
											<span class="glyphicon glyphicon-remove"></span>
										</button>
									</form>
								</td>
								<td>
									<form method="post">
										<input type="hidden" name="modify" value="1" />
										<input type="hidden" name="itemId" value="${item.itemId}" />
										<input type="hidden" name="name" value="${item.name}" />
										<input type="hidden" name="type" value="${item.type}" />
										<input type="hidden" name="stock" value="${item.stock}" />
										<input type="hidden" name="price" value="${item.price}" />
										<input type="hidden" name="description" value="${item.description}" />
										<button class="btn btn-warning" type="submit">
											<span class="glyphicon glyphicon-pencil"></span>
										</button>
									</form>
								</td>
								<td>
									<form method="post">
										<input type="hidden" name="addImage" value="1" />
										<input type="hidden" name="itemId" value="${item.itemId}" />
										<input type="hidden" name="name" value="${item.name}" />
										<button class="btn btn-info" type="submit">
											<span class="glyphicon glyphicon-upload"></span>
										</button>
									</form>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<center>第${itemsPage.currentPage}页/共${itemsPage.totalPage}页</center>
					<nav>
						<ul class="pager">
							<c:if test="${itemsPage.currentPage>1 }">
								<li class="previous"><a
										href="${itemsPage.url}&currentPage=1">首页</a></li>
								<li class="previous"><a
										href="${itemsPage.url}&currentPage=${itemsPage.currentPage-1}">上一页</a></li>
							</c:if>
							<c:if test="${itemsPage.currentPage<itemsPage.totalPage}">
								<li class="next"><a
										href="${itemsPage.url }&currentPage=${itemsPage.totalPage}">尾页</a></li>
								<li class="next"><a
										href="${itemsPage.url }&currentPage=${itemsPage.currentPage+1}">下一页</a></li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 操作成功弹框 -->
<div id="operate-success" class="modal fade" aria-hidden="true"
	 data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
				<h1 class="modal-title text-center">操作成功</h1>
			</div>

			<!-- 主体 -->
			<div class="modal-body">
				<center>
					${operateSuccess} <br />
					<button class="btn btn-primary"
							onclick="window.location.href='${pageContext.request.contextPath}/servlet/getItemsPageServlet?currentPage=${requestScope.itemsPage.currentPage}'"
							type="submit" data-dismiss="modal">确&nbsp;&nbsp;定</button>
				</center>
			</div>
		</div>
	</div>
</div>

<!-- 操作成功后提示 -->
<c:if test="${not empty operateSuccess}">
	<script>
		$('#operate-success').modal("show");
	</script>
</c:if>

<!-- 操作失败弹框 -->
<div id="operate-error" class="modal fade" aria-hidden="true"
	 data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
				<h1 class="modal-title text-center">操作失败</h1>
			</div>

			<!-- 主体 -->
			<div class="modal-body">
				<center>
					<h3>${operateError}</h3>
					<button class="btn btn-primary"
							onclick="window.location.href='${pageContext.request.contextPath}/servlet/getItemsPageServlet?currentPage=${requestScope.itemsPage.currentPage}'"
							type="submit" data-dismiss="modal">确&nbsp;&nbsp;定</button>
				</center>
			</div>
		</div>
	</div>
</div>

<!-- 操作失败后提示 -->
<c:if test="${not empty operateError}">
	<script>
		$('#operate-error').modal("show");
	</script>
</c:if>

</body>
</html>