<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>register</title>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

	<link rel="stylesheet" type="text/css"
		  href="${pageContext.request.contextPath}/css/CAPTCHA.css">
	<script src="${pageContext.request.contextPath}/js/verify-register-user.js"></script>
	<script src="${pageContext.request.contextPath}/js/idcode.js"></script>

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

		.form-group.has-feedback .form-control-feedback {
			top: 32px;
		}

		.row {
			margin-bottom: 15px;
		}

		.text-right {
			margin-top: 15px;
		}

		.text-danger {
			display: block;
			margin-bottom: 10px;
		}

		.btn-primary, .btn-warning, .btn-danger {
			border-radius: 20px; /* 圆角 */
			box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3); /* 阴影 */
		}

		.btn-primary:hover, .btn-warning:hover, .btn-danger:hover {
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

			.row {
				flex-direction: column;
			}

			.col-xs-7, .col-xs-5 {
				width: 100%;
				padding: 0;
			}

			.col-xs-5 {
				padding-top: 10px;
			}
		}
	</style>

	<!-- 用户注册 -->
</head>
<body>
<div id="register" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-body">
				<button class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
			</div>

			<div class="modal-title">
				<h1 class="text-center">注册</h1>
			</div>

			<!-- 注册表单 -->
			<div class="modal-body">
				<form
						action="${pageContext.request.contextPath}/servlet/registerServlet?forwardUrl=${forwardUrl}"
						onSubmit="return checkRegister()" method="post">

					<div class="form-group has-feedback" id="register-account-div">
						<label for="register-account">用户名</label>
						<div class="input-group">
								<span class="input-group-addon"><span
										class="glyphicon glyphicon-user"></span></span> <input
								id="register-account" name="account" class="form-control"
								placeholder="请输入用户名" maxlength="20" type="text">
						</div>

						<span style="color: red; display: none;" class="tips"></span> <span
							style="display: none;"
							class="glyphicon glyphicon-remove form-control-feedback"></span>
						<span style="display: none;"
							  class="glyphicon glyphicon-ok form-control-feedback"></span>
					</div>

					<div class="form-group has-feedback" id="register-password-div">
						<label for="register-password">密码</label>
						<div class="input-group">
								<span class="input-group-addon"><span
										class="glyphicon glyphicon-lock"></span></span> <input
								id="register-password" name="password" class="form-control"
								placeholder="请输入密码，明文存储，请勿输入常用密码" maxlength="20"
								type="password">
						</div>

						<span style="color: red; display: none;" class="tips"></span> <span
							style="display: none;"
							class="glyphicon glyphicon-remove form-control-feedback"></span>
						<span style="display: none;"
							  class="glyphicon glyphicon-ok form-control-feedback"></span>
					</div>

					<div class="form-group has-feedback"
						 id="register-passwordConfirm-div">
						<label for="register-passwordConfirm">确认密码</label>
						<div class="input-group">
								<span class="input-group-addon"><span
										class="glyphicon glyphicon-lock"></span></span> <input
								id="register-passwordConfirm" name="passwordConfirm"
								class="form-control" placeholder="请再次输入密码" maxlength="20"
								type="password">
						</div>
						<span style="color: red; display: none;" class="tips"></span> <span
							style="display: none;"
							class="glyphicon glyphicon-remove form-control-feedback"></span>
						<span style="display: none;"
							  class="glyphicon glyphicon-ok form-control-feedback"></span>
					</div>

					<div class="form-group has-feedback" id="register-tel-div">
						<label for="register-tel">手机号码</label>
						<div class="input-group">
								<span class="input-group-addon"><span
										class="glyphicon glyphicon-phone"></span></span> <input
								id="register-tel" name="tel" class="form-control"
								placeholder="请输入手机号码" maxlength="11" type="text"
								value="${sessionScope.user.tel}">
						</div>
						<span style="color: red; display: none;" class="tips"></span> <span
							style="display: none;"
							class="glyphicon glyphicon-remove form-control-feedback"></span>
						<span style="display: none;"
							  class="glyphicon glyphicon-ok form-control-feedback"></span>
					</div>

					<div class="form-group has-feedback" id="register-email-div">
						<label for="register-email">邮箱</label>
						<div class="input-group">
								<span class="input-group-addon"><span
										class="glyphicon glyphicon-envelope"></span></span> <input
								id="register-email" name="email" class="form-control"
								type="email" placeholder="例如:123@123.com"
								value="${sessionScope.user.email}">
						</div>
						<span style="color: red; display: none;" class="tips"></span> <span
							style="display: none;"
							class="glyphicon glyphicon-remove form-control-feedback"></span>
						<span style="display: none;"
							  class="glyphicon glyphicon-ok form-control-feedback"></span>
					</div>

					<div class="row">
						<div class="col-xs-7">
							<div class="form-group has-feedback" id="idcode-btn-div">
								<label for="idcode-btn">验证码</label>
								<div class="input-group">
										<span class="input-group-addon"><span
												class="glyphicon glyphicon-qrcode"></span></span> <input
										id="idcode-btn" class="form-control" placeholder="请输入验证码"
										maxlength="4" type="text">
								</div>
								<span style="color: red; display: none;" class="tips"></span> <span
									style="display: none;"
									class="glyphicon glyphicon-remove form-control-feedback"></span>
								<span style="display: none;"
									  class="glyphicon glyphicon-ok form-control-feedback"></span>
							</div>
						</div>
						<!-- 验证码背景 -->
						<div class="col-xs-5" style="padding-top: 30px">
							<div id="idcode" style="background: transparent;"></div>
						</div>
					</div>

					<div class="text-right">
						<span class="text-danger">${requestScope.registerError}</span>
						<button class="btn btn-primary" type="submit">提&nbsp;&nbsp;交</button>
						<button class="btn btn-warning" type="reset">重&nbsp;&nbsp;置</button>
						<button class="btn btn-danger" data-dismiss="modal">取&nbsp;&nbsp;消</button>
					</div>
					<input type="hidden" name="orgUrl"
						   value="${pageContext.request.requestURL}" /> <a href=""
																		   data-toggle="modal" data-dismiss="modal" data-target="#login">已有账号？点我登录</a>

				</form>
			</div>
		</div>
	</div>
</div>

<!-- 注册失败之后返回，重新打开模态框 -->
<c:if test="${not empty registerError}">
	<script>
		$('#register').modal("show");
	</script>
</c:if>

<!-- 注册成功弹框 -->
<div id="register-success" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-title">
				<h1 class="text-center">注册成功</h1>
			</div>

			<!-- 主体 -->
			<div class="modal-body">
				<center>
					<div class="">
						<button class="btn btn-primary" type="submit"
								onclick="window.location.href='${pageContext.request.contextPath}${forwardUrl}'"
								data-dismiss="modal">确&nbsp;&nbsp;定</button>
					</div>
				</center>
			</div>
		</div>
	</div>
</div>

<!-- 注册成功后提示 -->
<c:if test="${not empty requestScope.registerSuccess}">
	<script>
		$('#register-success').modal("show");
	</script>
</c:if>

</body>
</html>
