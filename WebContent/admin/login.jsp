<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="javax.imageio.*"%>
<%@ page import="com.mingrisoft.*"%>

<!DOCTYPE html>
<html>
	<head lang="en">
		<meta charset="UTF-8">
		<title>明日科技有限公司</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport"
			content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="format-detection" content="telephone=no">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<link rel="stylesheet"
			href="css/amazeui.min.css" />
		<style>
		
.header {
	text-align: center;
}

.header h1 {
	font-size: 200%;
	color: #333;
	margin-top: 30px;
}

.header p {
	font-size: 14px;
}
</style>
	</head>
	<%
	response.setHeader("Pragma","No-cache");
	response.setHeader("Cache-Control","no-cache");
	response.setDateHeader("Expires", 0);
	request.setCharacterEncoding("utf-8");						     //设置编码方式为utf-8
	//处理表单，并进行异常处理
	String Action = request.getParameter("Action");
	
	if(Action!=null && Action.equals("Login"))
	{
		String Page1  = (String)request.getHeader("Referer");		//得到页面地址来源
		String Page2  = request.getRequestURL().toString();			//得到当前页面地址
		
		String methon = request.getMethod();
		
		if (methon.equals("POST") && Page2.equals(Page1))
		{
			try{
				Function Fun = new Function();
				Login login = new Login();
				String IP = request.getRemoteAddr();						//得到客户端Ip地址
				String User = request.getParameter("User");     	        //得到登录用户名
				String Pwd = request.getParameter("Pwd");                   //得到登录密码
				
				
				if (login.LoginCheck(User,Pwd))
				{
					session.setAttribute("Login","Yes");
					//session.setAttribute("AdminID",Integer.toString(login.AdminID));
					//session.setAttribute("AdminType",Integer.toString(login.AdminType));
					session.setAttribute("AdminName",User);
					out.println("<SCRIPT LANGUAGE='JavaScript'>alert('登录成功！');location.href='news.jsp';</SCRIPT>");
					return;
				}
				else 
				{
					out.println("<SCRIPT LANGUAGE='JavaScript'>alert('用户名或密码不正确！');location.href='login.jsp';</SCRIPT>");
					
					return;
				}
			}catch(Exception e){
				out.println("<SCRIPT LANGUAGE='JavaScript'>alert('服务器异常！!');location.href='login.jsp';</SCRIPT>");
					return;
					}
		}
		else
		{
			response.sendError(403,"禁止访问");
			return;
		}
	}
%>

	<body>
		
		<div class="header">
			<div class="am-g">
				<h1>
					明日科技有限公司
				</h1>
			</div>
			<hr />
		</div>
		
		<div class="am-g">
			<div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
				<form action="login.jsp" method="post" class="am-form login-form" onSubmit="return LoginCheck()">
					<label for="name">
						用户名:
					</label>
					<!-- 文本输入框  用于输入用户名 -->
					<input type="text" name="User" id="User"  value="">
					<br>
					<label for="ps">
						密码:
					</label>
					<!-- 文本输入框  用于输入用户密码-->
					<input type="password" name="Pwd"  id="Pwd"  value="">
					<br>

					<br />
					<div class="am-cf">
					<!-- 文本输入框  隐藏属性-->
					<input name="Action" type="hidden" value="Login">
					
					<!-- 用于登录提交按钮 -->
					<input type="submit" value="登 录" id="save"	class="am-btn am-btn-primary am-btn-sm am-fl">

					</div>
				</form>
				
			</div>
		</div>
		
	</body>

	<script src="js/jquery.min.js"></script>
	<script src="js/amazeui.min.js"></script>
<script>
function LoginCheck() 
{   

    var LoginCheck = false;
    if($("#User").val()==="" || $("#Pwd").val()===""){
		alert("用户名或密码不能为空!");
        return false;
	}
    
    return true;
}
</script>
	<!--<![endif]-->
</html>