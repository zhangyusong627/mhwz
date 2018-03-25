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
			<img src="img/4.gif" alt="">
		</div>
		<!--//banner-->
		<!--核心竞争力-->
		<div class="container">
			<div>
				<div class="location1">
					<span>当前位置：<a
						href="#">核心竞争优势</a>
					</span>
					<div class="brief width_170">
						核心竞争优势
					</div>
				</div>
				<div class="content_main">
					
					<p>
						1999/12 公司创立，将为编程者提供有价值内容和产品（编程词典）作为公司发展重点之一。
					</p>
					<br>
					
					<p>
						2003/01 明日团队第一本编程图书问世，获得了广大读者的支持和鼓励，在同类图书中长期排名第一。
					</p>
					<br>
					
					<p>
						2005/08 论坛和支持网站（www.mingribook.com），目前成为国内图书领域的旗舰品牌。
					</p>
					<br>
					
					<p>
						2007/09 第一本图书版权输出到台湾，目前已经有近20本图书版权输出到台湾。
					</p>
					<br>
					
					<p>
						2009/11 图书已形成软件工程师入门和典藏两大类，共200多本图书，销售码洋超过1.3亿。
					</p>
					<br>
					
					<p>
						2010/01 《编程词典》正式发布编程词典系列产品在北京图书订货会上正式发布，同期编程词典全程服务社区正式发布。网址：www.mrbccd.com。
					</p>
					<br>
					
					<p>
						2011/08 明日科技在北京国际会展中心率先推出了国内第一套拥有完全自主知识产权的数字化学习软件《编程词典（个人版）》软件，开创了数字化学习的新方式，极大影响教育软件行业和大家的未来发展模式。
					</p>
					<br>
					
					<p>
						2011/09 明日科技官方正品图书正式登陆淘宝，为喜爱IT行业的读者提供了专业的第一手正品资料，http://mrbccd.taobao.com；同步上架了最新推出的《编程词典（个人版）》软件，受到了广大读者的好评。
					</p>
					<br>
					
					<p>
						2012/08 《程序开发资源库》和《WEB开发资源库》将隆重上市，将填补我国程序开发类	数字资源库的空白。（C/S结构）
					</p>
					<br>
					
					<p>
						2012/11 编程词典云端版即将上线，用户无需安装，即可轻松享用编程词典系列软件。（B/S结构）
					</p>
					<br>
					

				</div>
			</div>
		</div>
		<!--//核心竞争力-->
		<!--底部-->
		<%@ include file="common_footer.jsp"%>
		
	</body>

	<!--//底部-->
	<script>
tabs("#tab", "active", "#tab_con");
</script>


	
</script>

</html>
