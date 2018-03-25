<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.mingrisoft.*"%>

<%
	request.setCharacterEncoding("UTF-8");//设置编码方式为utf-8	 			
	News News1 = new News();//引入新闻方法类
	Function Fun = new Function();//引入功能方法类
	
	String AdminName = (String)session.getAttribute("AdminName");//从页面缓存中提取当前用户 
	String Action = request.getParameter("Action");//从页面请求中获取命令
	
	if (Action!=null && Action.equals("Add"))//判断是否存在
	{
		String IP = request.getRemoteAddr();//得到客户端Ip地址
		String [] s = new String[2];//定义数组
		s[0] = request.getParameter("NewsTitle");//填写数组第一位
		s[1] = request.getParameter("NewsContent");//填写数组第二位
		String sNews = News1.AddNews(s,AdminName,IP);//获取方法返回值
		if (sNews.equals("Yes"))//判断返回值
		{
			out.print("<script>alert('添加新闻成功!');location.href='news.jsp';</script>");//页面输出
			return;//结束
		}
		else //或者
		{
			out.print("<script>alert('添加新闻失败!');location.href='news.jsp';</script>");//页面输出
			return;//结束
		}
	}
%>