<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport"
			content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>明日科技有限公司</title>
		<link href="css/main.css" rel="stylesheet" type="text/css">
		<link href="css/container.css" rel="stylesheet" type="text/css">
		<link href="css/reset.css" rel="stylesheet" type="text/css">
		<link href="css/screen.css" rel="stylesheet" type="text/css">
		<script src="js/jquery.min.js">
</script>
		<script src="js/tab.js">
</script>
	</head>

	<body>

		<%@ include file="common_header.jsp"%>

		<!--banner-->
		<div class="second_banner">
			<img src="img/5.gif" alt="">
		</div>
		<!--//banner-->
		<!--联系我们-->
		<div class="container">
			<div class="left">
				<div class="menu_plan">
					<div class="menu_title">
						联系我们
						<br>
						<span>Associate program</span>
					</div>
					<ul id="tab">
						
						<li onclick="changeValue(this)" class="active">
							<a href="#">联系我们</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="right">
				<div class="location">
					<span>当前位置：<a
						href="#">联系我们</a>
					</a>
					</span>
					<div class="brief" id="b">
						<a href="#">联系我们</a>
					</div>
				</div>
				<div style="font-size: 14px; margin-top: 53px; line-height: 36px;">
					<div id="tab_con">
												
						<div id="tab_con_4" class="dis-n" style="display: block;">
							<table class="contact">
								<tbody>
									<tr>
										<td width="18%" class="ct_bg">
											公司名称
										</td>
										<td>
											明日科技有限公司
										</td>
									</tr>
									<tr>
										<td class="ct_bg">
											联系人
										</td>
										<td>
											张女士、王先生
										</td>
									</tr>
									<tr>
										<td class="ct_bg">
											电话
										</td>
										<td>
											0431-xxxxxxxx
										</td>
									</tr>
									<tr>
										<td class="ct_bg">
											手机
										</td>
										<td>
											151xxxxxxx
										</td>
									</tr>
									<tr>
										<td class="ct_bg">
											邮箱
										</td>
										<td>
											xxxxxxx@163.net
										</td>
									</tr>
									<tr>
										<td class="ct_bg">
											地址
										</td>
										<td>
											长春市卫星广场财富大厦1023室
										</td>
									</tr>
									<tr>
										<td class="ct_bg">
											邮编
										</td>
										<td>
											130000
										</td>
									</tr>
									<tr>
										<td class="ct_bg">
											公司主页
										</td>
										<td>
											www.mingrisoft.com
										</td>
									</tr>
								</tbody>
							</table>
							<div style="text-align: center">
								<img src="img/map.jpg" alt="">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--//联系我们-->
		<!--底部-->
		<%@ include file="common_footer.jsp"%>

		

	</body>

	<!--//底部-->
	<script>
tabs("#tab", "active", "#tab_con");
</script>

	
</script>

</html>
