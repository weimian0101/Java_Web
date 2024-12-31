<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>☆☆diff饰品交易平台☆☆</title>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<style>
		body {
			background-image: url('${pageContext.request.contextPath}/images/background.jpg'); /* 设置背景图片 */
			background-size: cover; /* 保持图片比例并裁剪 */
			background-position: center; /* 居中显示 */
			background-repeat: no-repeat; /* 防止图片重复 */
			background-attachment: fixed; /* 背景固定，内容滚动时背景保持不动 */
			margin: 0; /* 去除默认的body边距 */
			font-family: Arial, sans-serif; /* 设置默认字体 */
			color: #333; /* 设置默认文字颜色 */
		}

		.container {
			padding-top: 50px; /* 增加顶部间距 */
		}

		.panel {
			background-color: rgba(255, 255, 255, 0.8); /* 半透明背景 */
			border-radius: 10px; /* 圆角 */
			box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 阴影效果 */
		}

		.panel-heading {
			background-color: #f8f8f8; /* 浅灰色背景 */
			border-bottom: 1px solid #ddd; /* 分隔线 */
			padding: 10px 15px; /* 内边距 */
		}

		.panel-body {
			padding: 20px; /* 内边距 */
		}

		.items {
			text-align: center;
			margin-left: auto;
			margin-right: auto;
		}

		.items img {
			width: 150px;
			border-radius: 50%; /* 圆形图片 */
			box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 阴影效果 */
		}

		.thumbnail {
			border: none; /* 去除默认边框 */
			background-color: transparent; /* 透明背景 */
		}

		.caption {
			text-align: center;
			margin-top: 10px; /* 增加顶部间距 */
		}

		.caption .text-muted {
			font-size: 14px; /* 统一文字大小 */
			color: #555; /* 设置文字颜色 */
		}

		.pager {
			margin-top: 20px; /* 增加顶部间距 */
		}

		.pager li {
			display: inline; /* 水平排列 */
			margin: 0 5px; /* 按钮间距 */
		}

		.pager a {
			background-color: #007bff; /* 蓝色背景 */
			color: #fff; /* 白色文字 */
			padding: 5px 10px; /* 内边距 */
			border-radius: 5px; /* 圆角 */
			text-decoration: none; /* 去除下划线 */
		}

		.pager a:hover {
			background-color: #0056b3; /* 悬停时的背景颜色 */
		}

		.btn {
			margin-top: 10px; /* 按钮间距 */
		}

		.btn-success {
			background-color: #28a745; /* 绿色背景 */
			border-color: #28a745; /* 绿色边框 */
		}

		.btn-success:hover {
			background-color: #218838; /* 悬停时的背景颜色 */
			border-color: #1e7e34; /* 悬停时的边框颜色 */
		}
	</style>
</head>
<body>
<!-- 利用forwardUrl来确定(注册之后)返回的url -->
<%
	request.setAttribute("forwardUrl", "/index.jsp"); //map
%>

<!-- 无itemsPage进入时，重新请求getUsersPagesServlet -->
<c:if test="${empty itemsPage}">
	<script>
		window.location.href = '${pageContext.request.contextPath}/servlet/searchItemPageServlet';
	</script>
</c:if>

<!-- 网页头部 -->
<jsp:include page="/jspfragments/header.jsp" />

<!-- 网页正文 -->
<br />

<div class="container">
	<div class="panel panel-default">
		<!-- 头部 -->
		<div class="panel-heading" style="height: 55px">
			<div class="pull-left">
				<font size="4" style="line-height: 35px">搜索结果</font>
			</div>
			<div class="pull-right">
				<button class="btn btn-success"
						onclick="window.location.href='${itemsPage.url}&currentPage=${itemsPage.currentPage}'">
					<span class="glyphicon glyphicon-refresh"></span> 刷&nbsp;新
				</button>
			</div>
		</div>
		<!-- 主列表 -->
		<div class="panel-body items">
			<c:forEach var="item" items="${requestScope.itemsPage.list}">
				<div class="col-xs-4">
					<a href="${pageContext.request.contextPath}/servlet/getItemServlet?itemId=${item.itemId}" class="thumbnail">
						<img src="${pageContext.request.contextPath}${item.imageUrl}" class="img-circle">
						<div class="caption">
							<div class="text-muted">
								<br />${item.name}
							</div>
						</div>
					</a>
				</div>
			</c:forEach>

			<div class="row"></div>

			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<nav>
				<center>第${itemsPage.currentPage}页/共${itemsPage.totalPage}页</center>
				<ul class="pager">
					<c:if test="${itemsPage.currentPage > 1}">
						<li class="previous"><a href="${itemsPage.url}&currentPage=1">首页</a></li>
						<li class="previous"><a href="${itemsPage.url}&currentPage=${itemsPage.currentPage - 1}">上一页</a></li>
					</c:if>
					<c:if test="${itemsPage.currentPage < itemsPage.totalPage}">
						<li class="next"><a href="${itemsPage.url}&currentPage=${itemsPage.totalPage}">尾页</a></li>
						<li class="next"><a href="${itemsPage.url}&currentPage=${itemsPage.currentPage + 1}">下一页</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>
</div>
</body>
</html>