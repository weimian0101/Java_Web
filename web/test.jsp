<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>test</title>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<script src="https://cdn.bootcss.com/Chart.js/2.7.2/Chart.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/utils.js"></script>

	<style>
		/* 添加一些基本样式 */
		.container {
			margin-top: 20px;
		}
		.panel-heading {
			font-size: 16px;
			font-weight: bold;
		}
		.btn-success {
			margin-top: 10px;
		}
	</style>

</head>
<body>

<!-- 网页头部 -->
<jsp:include page="/jspfragments/header.jsp" />

<div class="container">
	<div class="row">
		<!-- 左侧菜单栏 -->
		<div class="col-md-2">
			<div class="panel panel-default">
				<div class="panel-heading">
					菜单栏
				</div>
				<div class="panel-body">
					<!-- 菜单项 -->
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
						<button class="btn btn-success" onclick="refreshOrders()">
							<span class="glyphicon glyphicon-refresh"></span> 刷&nbsp;新
						</button>
					</div>
				</div>
				<!-- 饼图 -->
				<div class="panel-body">
					<div id="canvas-holder" style="width: 100%">
						<canvas id="chart-area"></canvas>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	function refreshOrders() {
		var refreshButton = document.querySelector('.btn-success');
		refreshButton.innerHTML = '<span class="glyphicon glyphicon-refresh"></span> 加载中...';
		window.location.href='${ordersPage.url }&currentPage=${ordersPage.currentPage}';
	}

	window.onload = function() {
		fetch('${pageContext.request.contextPath}/api/chartData')
				.then(response => response.json())
				.then(data => {
					var ctx = document.getElementById('chart-area').getContext('2d');
					var config = {
						type: 'pie',
						data: {
							datasets: [{
								data: data.values,
								backgroundColor: [
									window.chartColors.red,
									window.chartColors.orange,
									window.chartColors.yellow,
									window.chartColors.green,
									window.chartColors.blue,
								],
								label: 'Dataset 1'
							}],
							labels: data.labels
						},
						options: {
							responsive: true
						}
					};
					window.myPie = new Chart(ctx, config);
				})
				.catch(error => {
					console.error('Error fetching chart data:', error);
					var refreshButton = document.querySelector('.btn-success');
					refreshButton.innerHTML = '<span class="glyphicon glyphicon-refresh"></span> 刷&nbsp;新';
				});
	};
</script>
</body>
</html>