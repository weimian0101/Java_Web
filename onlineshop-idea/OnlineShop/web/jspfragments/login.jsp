<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Login</title>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

	<style>
		body {
			background-image: url('${pageContext.request.contextPath}/images/background.jpg'); /* 替换为你的背景图片路径 */
			background-size: cover;
			background-attachment: fixed;
			font-family: Arial, sans-serif;
			color: #333;
		}

		.modal-content {
			background-color: rgba(255, 255, 255, 0.9); /* 半透明白色背景 */
			border-radius: 10px;
			box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
		}

		.modal-title {
			padding: 15px;
			background-color: #f8f8f8;
			border-bottom: 1px solid #ddd;
			border-radius: 10px 10px 0 0;
		}

		.modal-body {
			padding: 20px;
		}

		.form-group label {
			font-weight: bold;
		}

		.input-group-addon {
			background-color: #f8f8f8;
			border: 1px solid #ccc;
			border-right: none;
		}

		.input-group input {
			border-left: none;
			border-radius: 0 4px 4px 0;
		}

		.btn-group {
			margin-bottom: 15px;
		}

		.text-right {
			margin-top: 15px;
		}

		.text-danger {
			display: block;
			margin-bottom: 10px;
		}

		.btn-primary, .btn-danger {
			border-radius: 20px; /* 圆角 */
			box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3); /* 阴影 */
		}

		.btn-primary:hover, .btn-danger:hover {
			box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5); /* 鼠标悬停时的阴影 */
		}

		@media (max-width: 768px) {
			.modal-dialog {
				width: 90%;
			}

			.modal-content {
				border-radius: 5px;
			}

			.modal-title {
				border-radius: 5px 5px 0 0;
			}

			.btn-group label {
				font-size: 14px;
			}
		}
	</style>

	<!-- 用户/管理员登录 -->
</head>
<body>

<!-- 登录窗口 -->
<div id="login" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<button class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
			</div>
			<div class="modal-title">
				<h1 class="text-center">登录</h1>
			</div>

			<!-- 登录表单 -->
			<div class="modal-body">
				<form class="form-group"
					  action="${pageContext.request.contextPath}/servlet/loginServlet"
					  method="post">
					<div class="form-group has-feedback">
						<label for="login-account">用户名</label>
						<div class="input-group">
								<span class="input-group-addon"><span
										class="glyphicon glyphicon-user"></span></span> <input
								id="login-account" name="account" class="form-control"
								placeholder="请输入用户名" maxlength="20" type="text">
						</div>
					</div>

					<div class="form-group has-feedback">
						<label for="login-password">密码</label>
						<div class="input-group">
								<span class="input-group-addon"><span
										class="glyphicon glyphicon-lock"></span></span> <input
								id="login-password" name="password" class="form-control"
								placeholder="请输入密码" maxlength="20" type="password">
						</div>
					</div>

					<div class="btn-group pull-left" data-toggle="buttons">
						<label class="btn btn-default active"> <input
								name="status" value="user" type="radio" checked>用户(默认)
						</label> <label class="btn btn-default"> <input name="status"
																		value="admin" type="radio"> 管理员
					</label>
					</div>

					<div class="text-right">
						<span class="text-danger">${requestScope.loginError}</span>
						<!-- 2*24*60*60= 172800-->
						<input type="checkbox" name="logintime" value="172800">记住密码&nbsp;&nbsp;
						<button class="btn btn-primary" type="submit">登录</button>
						<button class="btn btn-danger" data-dismiss="modal">取消</button>
					</div>

					<br /> <a href="" data-toggle="modal" data-dismiss="modal"
							  data-target="#register">还没有账号？点我注册</a>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- 登录失败之后返回，重新打开模态框 -->
<c:if test="${not empty loginError}">
	<script>
		$('#login').modal("show");
	</script>
</c:if>

</body>
</html>