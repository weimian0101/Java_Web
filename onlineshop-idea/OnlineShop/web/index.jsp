<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>☆☆diff饰品交易平台☆☆</title>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<style type="text/css">
		/* 设置背景图片 */
		body {
			background-image: url('${pageContext.request.contextPath}/images/index/background2.png'); /* 更新背景图片路径 */
			background-size: cover; /* 保持图片比例并裁剪 */
			background-position: center; /* 居中显示 */
			background-repeat: no-repeat; /* 防止图片重复 */
			background-attachment: fixed; /* 背景固定，内容滚动时背景保持不动 */
			margin: 0; /* 去除默认的body边距 */
			font-family: Arial, sans-serif; /* 设置默认字体 */
			color: #333; /* 设置默认文字颜色 */
			padding-top: 50px; /* 增加顶部间距以适应固定导航栏 */
		}

		/* 产品展示区域 */
		.container.items {
			text-align: center;
			background-color: rgba(255, 255, 255, 0.8); /* 半透明背景 */
			border-radius: 20px;
			width: 100%;
			max-width: 1200px;
			margin: auto;
			padding: 20px; /* 添加内边距 */
			margin-top: 50px; /* 增加顶部间距 */
			box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 阴影效果 */
		}

		.items img {
			width: 300px; /* 统一图片宽度 */
			height: 300px; /* 统一图片高度 */
			object-fit: cover; /* 保持图片比例并裁剪 */
			border-radius: 10px; /* 圆角 */
			border: 2px solid #ddd; /* 边框 */
			transition: transform 0.2s; /* 添加过渡效果 */
			margin-bottom: 20px; /* 增加图片底部间距 */
		}

		.items img:hover {
			transform: scale(1.05); /* 鼠标悬停时放大图片 */
		}

		/* 对齐caption内容 */
		.caption {
			text-align: center;
			margin-top: 10px; /* 增加一些顶部间距 */
		}

		.caption .text-muted {
			font-size: 14px; /* 统一文字大小 */
			color: #555; /* 设置文字颜色 */
		}

		/* 响应式设计 */
		@media (max-width: 768px) {
			.container.items {
				width: 90%;
				padding: 10px; /* 减少内边距 */
			}

			.items img {
				width: 100%;
				height: auto;
				margin-bottom: 15px; /* 减少图片底部间距 */
			}

			.caption {
				margin-top: 5px; /* 减少顶部间距 */
			}
		}

		@media (min-width: 769px) and (max-width: 992px) {
			.container.items {
				width: 95%;
				padding: 15px; /* 减少内边距 */
			}

			.items img {
				width: 250px;
				height: 250px;
				margin-bottom: 15px; /* 减少图片底部间距 */
			}
		}

		/* 页脚样式优化 */
		footer {
			background-color: #333; /* 深色背景 */
			color: #fff; /* 白色文字 */
			text-align: center;
			padding: 10px 0; /* 内边距 */
			position: fixed; /* 固定页脚 */
			bottom: 0;
			width: 100%;
			box-shadow: 0 -4px 8px rgba(0, 0, 0, 0.1); /* 阴影效果 */
		}

		/* 去除轮播两边阴影 */
		#cl #cr {
			background-image: none;
		}

		/* 标题样式 */
		.title-section {
			text-align: center;
			margin-top: 50px;
		}

		.title-section h1 {
			font-size: 40px;
			margin-bottom: 20px;
			color: #fff; /* 白色文字 */
			text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); /* 文字阴影 */
		}

		.title-section p {
			font-size: 20px;
			margin-bottom: 40px;
			color: #fff; /* 白色文字 */
			text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.5); /* 文字阴影 */
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

<!-- 产品展示 -->
<div class="container items">
	<div class="row">
		<div class="col-md-4 col-sm-6 col-xs-12">
			<a href="${pageContext.request.contextPath}/servlet/getItemServlet?itemId=1">
				<img src="${pageContext.request.contextPath}/images/index/1-1.jpg" class="img-thumbnail">
				<div class="caption">
					<div class="text-muted">
						<br />蝴蝶刀（★） | 多普勒 (崭新出厂)
					</div>
				</div>
			</a>
		</div>
		<!--展示一个特定的产品（饰品），并当用户点击该产品时，
		//跳转到一个Servlet，该Servlet将获取并展示点击产品的详细信息。通过使用Bootstrap的栅格系统和样式类-->
		<div class="col-md-4 col-sm-6 col-xs-12">
			<a href="${pageContext.request.contextPath}/servlet/getItemServlet?itemId=2">
				<img src="${pageContext.request.contextPath}/images/index/1-2.jpg" class="img-thumbnail">
				<div class="caption">
					<div class="text-muted">
						<br />爪子刀（★） | 伽玛多普勒 (崭新出厂)
					</div>
				</div>
			</a>
		</div>
		<div class="col-md-4 col-sm-6 col-xs-12">
			<a href="${pageContext.request.contextPath}/servlet/getItemServlet?itemId=3">
				<img src="${pageContext.request.contextPath}/images/index/1-3.jpg" class="img-thumbnail">
				<div class="caption">
					<div class="text-muted">
						<br />AK-47 | 野荷 (崭新出厂)
					</div>
				</div>
			</a>
		</div>

		<div class="col-md-4 col-sm-6 col-xs-12">
			<a href="${pageContext.request.contextPath}/servlet/getItemServlet?itemId=4">
				<img src="${pageContext.request.contextPath}/images/index/1-4.jpg" class="img-thumbnail">
				<div class="caption">
					<div class="text-muted">
						<br />爱娃特工 | 联邦调查局（FBI）
					</div>
				</div>
			</a>
		</div>

		<div class="col-md-4 col-sm-6 col-xs-12">
			<a href="${pageContext.request.contextPath}/servlet/getItemServlet?itemId=5">
				<img src="${pageContext.request.contextPath}/images/index/1-5.jpg" class="img-thumbnail">
				<div class="caption">
					<div class="text-muted">
						<br />AWP | 巨龙传说 (崭新出厂)
					</div>
				</div>
			</a>
		</div>

		<div class="col-md-4 col-sm-6 col-xs-12">
			<a href="${pageContext.request.contextPath}/servlet/getItemServlet?itemId=6">
				<img src="${pageContext.request.contextPath}/images/index/1-6.jpg" class="img-thumbnail">
				<div class="caption">
					<div class="text-muted">
						<br />M4A4|喧嚣杀戮（略有磨损）
					</div>
				</div>
			</a>
		</div>
	</div>
</div>

<!-- 标题部分 -->
<div class="title-section">
	<h1>☆☆diff饰品交易平台☆☆</h1>
	<p>随时随地 快人一步</p>
</div>

<!-- 页脚 -->
<jsp:include page="/jspfragments/footer.jsp" />
</body>
</html>