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
		
		 <%@ include file="common_header.jsp" %>  
		 
		<!--banner-->
		<div class="second_banner">
			<img src="img/1.gif" alt="">
		</div>
		<!--//banner-->
		<!--企业简介-->
		<div class="container">

			<div class="left">
				<div class="menu">
					<div class="menu_title">
						企业简介
						<br>
						<span>Company profiles</span>
					</div>
					<ul id="tab">
						<li class="active" onclick="changeValue(this)">
							<a href="javascript:void(0)">企业概况</a>
						</li>
						<li onclick="changeValue(this)">
							<a href="javascript:void(0)">企业认证</a>
						</li>
						
					</ul>
				</div>
			</div>

			<div class="right">
				<div class="location">
					<span>当前位置：<a
						href="#">企业简介</a>
					</span>
					<div class="brief" id="b">
						企业概况
					</div>
				</div>
				<div style="font-size: 14px; margin-top: 53px; line-height: 36px;">
					<div id="tab_con">
						<div id="tab_con_1" class="active">
							<br>
							<p>
								公司全称
							</p>
							<br>
							<p>
								吉林省明日科技有限公司
							</p>
							<br>
							<p>
								创立时间
							</p>
							<br>
							<p>
								吉林省明日科技有限公司（工商注册）创建成立于 1999 年 12 月
							</p>
							
							
							<br>
							<p>
								吉林省明日科技有限公司是一家以计算机软件和数字出版为核心的高科技企业，多年来始终致力于行业管理软件、数字化出版物等领域的实践，目前已和多家国内上市企业形成产品合作关系，公司的多款软件产品应用于国内的多家企业集团。明日科技拥有软件开发和项目实施方面的资深专家和学习型技术团队，利用积累的专业知识和经验，已开发数百种专业技术图书和数十种数字化学习产品，成为国内IT信息服务领域的知名品牌。
							</p>
							<br>
							<p>
								明日科技秉承坚韧、创新、博学、笃行的企业精神，一直致力于为用户提供功能完善、实用而又具有创新特性的专业产品。2010年1月，历经六年，近百人的专家团队的艰苦研发，明日科技在北京国际会展中心率先推出了国内第一套拥有完全自主知识产权的数字化学习软件—编程全能词典系列软件，创立了教育软件行业未来发展的崭新模式，使编程学习更轻松，更高效。
							</p>
							<br>
							<p>
								明日科技的产品和服务深得用户的信赖与赞誉。公司的多个图书品种被中国书刊协会评为优秀畅销书，多个图书产品版权输出到港台地区，获得热销，在行业内创立了良好的信誉，与人民邮电、电子工业出版社、清华大学等多家大型出版社形成了战略伙伴关系。
							</p>
							<br>
							<p>
								经过不断创新，明日科技成功开发出独具特色的创新型产品和行业知名品牌，形成企业四大系列支柱产品：
							</p>
							<br>
							<p>
								1、编程词典系列软件。近百位专家历时六年研发成功的全国首款数字化学习编程的教育软件。
							</p>
							<br>
							<p>
								2、IT词典系列软件。包含电脑知识入门、硬件维护、办公软件操作和图形图像在内的系列词典软件。
							</p>
							<br>
							<p>
								3、行业管理软件。专注于开发煤矿专业领域的信息化系统，开发了煤矿电话智能综合管理系统、瓦斯通风管理系统、基于图形拨测系统等10多种专业软件，应用于多家企业。
							</p>
							<br>
							<p>
								4、专业开发类编程图书。目前已出版专业开发类编程图书近300本，已成为国内最畅销的编程图书品牌。
							</p>
							<br>
							<p>
								目前，明日科技的用户人群已经超过1000万，伴随着国家数字化产业的飞速发展，依托庞大的用户资源，明日科技坚持 “一切以用户需求为核心，发展全方位的数字化学习服务支持平台”的发展战略，在发展原有的行业软件开发服务和IT教育出版基础上，正在全力开发数字化学习软件产品，打造全能互动数字平台。
							</p>
							<br>
							<p>
								明日科技将永葆创新激情，不断追求卓越，全力打造国内软件开发教育服务第一品牌，国内IT教育服务第一品牌，国内数字教育软件第一品牌和国内软件开发资源的最佳供应商，用实际行动迎接中国数字化产业的腾飞。
							</p>
							
							
							
							
						</div>
						<div id="tab_con_2" class="dis-n" style="text-align: center;">
							<img src="img/architecture.png" alt="" style="margin: 2% 0;">
						</div>

					</div>
				</div>
			</div>
		</div>
		<!--//企业简介-->
		<!--底部-->
		<div class="bottom">
			<div class="footer">
				<div class="gulid">
					<p>
						Copyright 2016 明日科技有限公司 All Rights.
					</p>
					<p>
						<a href="http://www.mingrisoft.com">明日科技</a> 技术支持
					</p>
					<p>
						吉ICP备  10002740号-2  吉公网安备22010202000132号
					</p>
				</div>
			</div>
		</div>

	</body>

	
	
	<!--//底部-->
	<script>
tabs("#tab", "active", "#tab_con");
</script>
	
</script>

</html>
