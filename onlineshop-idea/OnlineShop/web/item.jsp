<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>☆☆diff饰品交易平台☆☆</title>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/item.js"></script>
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

		#item img {
			width: 550px;
			border-radius: 10px; /* 圆角 */
			box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 阴影效果 */
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
		}

		.panel-body {
			padding: 20px; /* 内边距 */
		}

		.btn {
			margin-top: 10px; /* 按钮间距 */
		}

		.modal-content {
			background-color: #fff; /* 白色背景 */
			border-radius: 10px; /* 圆角 */
			box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 阴影效果 */
		}

		.modal-title {
			padding: 15px; /* 内边距 */
			background-color: #f8f8f8; /* 浅灰色背景 */
			border-bottom: 1px solid #ddd; /* 分隔线 */
		}

		.modal-body {
			padding: 20px; /* 内边距 */
		}

		.close {
			margin-top: -10px; /* 关闭按钮位置调整 */
		}
	</style>
</head>
<body>
<!-- 利用forwardUrl来确定(注册之后)返回的url -->
<%
	request.setAttribute("forwardUrl", "/index.jsp"); //map
%>

<!-- 网页头部 -->
<jsp:include page="/jspfragments/header.jsp" />

<!-- 网页正文 -->
<br />

<div class="container">
	<div class="row">
		<!-- 左侧菜单栏 -->
		<div class="col-md-6" id="item">
			<img src="${pageContext.request.contextPath}${item.imageUrl}">
		</div>
		<!-- 右侧主体 -->
		<div class="col-md-6">
			<br /> <br /> <br /> <br /> <br /> <br /> <br />
			<div class="panel panel-default">
				<div class="panel-heading">
					<font size="3"><span class="glyphicon glyphicon-leaf"></span> 商品详情</font>
				</div>
				<div class="panel-body">
					<font size="8"><strong>${item.name}</strong></font>&nbsp;&nbsp;&nbsp;&nbsp;<font size="5"><strong>${item.type}</strong></font>&nbsp;&nbsp;&nbsp;&nbsp;<font size="4"><strong><span class="glyphicon glyphicon-usd">${item.price}</span></strong></font><br /> <br />
					<br /> <font size="4">${item.description}</font> <br /> <br />
					<!--用于接受饰品-->

					<!-- 未登录则显示登录/注册按钮 -->
					<c:if test="${empty sessionScope.user}">
						<c:if test="${empty sessionScope.admin}">
							<center>
								<font size="5" style="width: 50%"><strong>如需购买，请先登录</strong></font><br />
								<button type="submit" class="btn btn-info navbar-btn" data-toggle="modal" data-target="#login" style="width: 50%">
									<span class="glyphicon glyphicon-log-in"></span>&nbsp;登&nbsp;&nbsp;录
								</button>
							</center>
						</c:if>
					</c:if>

					<c:if test="${not empty sessionScope.user}">
						<form action="${pageContext.request.contextPath}/servlet/addShoppingcartItemServlet" method="post">
							<div class="form-group has-feedback">
								<label for="item-number"><font size="4">购买数量(库存量：${item.stock})</font></label>
								<div class="input-group">
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" onclick="decreaseItemNum()" type="button">-</button>
                                        </span>
									<input id="item-number" name="number" type="text" class="form-control" value="1" style="text-align: center;">
									<span class="input-group-btn">
                                            <button class="btn btn-default" onclick="increaseItemNum(${item.stock})" type="button">+</button>
                                        </span>
								</div>
								<br />
								<input type="hidden" name="itemId" value="${item.itemId}">
								<input type="hidden" name="userId" value="${user.userId}">
								<button type="submit" class="btn btn-danger" style="width: 100%">加入购物车</button>
							</div>
						</form>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 操作成功弹框 -->
<div id="operate-success" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">操作成功</h4>
			</div>
			<div class="modal-body">
				<center>
					${operateSuccess} <br />
					<button class="btn btn-primary" type="button" data-dismiss="modal">确&nbsp;&nbsp;定</button>
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
<div id="operate-error" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">操作失败</h4>
			</div>
			<div class="modal-body">
				<center>
					<h3>${operateError}</h3>
					<button class="btn btn-primary" type="button" data-dismiss="modal">确&nbsp;&nbsp;定</button>
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