package com.mingrisoft;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

public class News {

	DBConnection DBConn = new DBConnection();// 引入连接数据库方法类
	Function Fun = new Function();// 引入数据处理方法类

	//新闻列表查询方法
	public String ListNewsFront(String sPage, String strPage) {
		try {// 用于获取系统运行异常信息

			Connection Conn = DBConn.getConn();// 建立数据库连接
			Statement stmt = Conn.createStatement();// 创建数据查询
			ResultSet rs = null;// 定义结果集
			
			// 定义本方法返回字符串数据
			StringBuffer sb = new StringBuffer();

			int i;// 定义数字型变量
			int intPage = 1;// 定义数字型变量并赋值1
			int intPageSize = 5;// 定义数字型变量并赋值5

			// 创建sql语句查询News表全部信息
			String sSql = "select * from News order by NewsID desc";
			// 通过执行sql语句得到查询结果
			rs = stmt.executeQuery(sSql);
			
			if (!rs.next()) {// 判定当查询结果为空
				// 返回属性添加字符串数据用于页面显示
				sb.append("<tr height=\"25\" bgcolor=\"#d6dff7\"  class=\"info1\"><td colspan=\"5\">\r\n");
				// 返回属性添加字符串数据用于页面显示
				sb.append("<div align=\"center\"><b>没有记录!</b></div></td></tr>\r\n");
			} else {// 判定当查询结果为不为空
				// 将传入参数strPage进行数据格式转换
				intPage = Fun.StrToInt(strPage);
				// 将传入参数sPage进行数据处理
				sPage = Fun.CheckReplace(sPage);
				if (intPage == 0) {// 判定intPage为0
					intPage = 1;// 参数intPage赋值为1
				}
				// 计算当前页面显示新闻条数
				rs.absolute((intPage - 1) * intPageSize + 1);
				i = 0;// 参数i赋值为0
				// i属性小于页面显示条数并且查询结果集不为空，进行循环方法
				while (i < intPageSize && !rs.isAfterLast()) {
					// 定义数字型变量并赋值News表里的NewsID属性
					int NewsID = rs.getInt("NewsID");
					// 定义数字型变量并赋值News表里的NewsTitle属性
					String NewsTitle = rs.getString("NewsTitle");
					// 定义数字型变量并赋值News表里的NewsTime属性
					String NewsTime = rs.getString("NewsTime");
					// 定义数字型变量并赋值News表里的AdminName属性
					String AdminName = rs.getString("AdminName");
					// 返回属性添加字符串数据用于页面显示<tr>表示换行
					sb.append("<tr>");
					// 返回属性添加字符串数据用于页面显示新闻标题
					sb.append("<td>" + NewsTitle + "</td>");
					// 返回属性添加字符串数据用于页面显示用户名
					sb.append("<td >" + AdminName + "</td>");
					// 返回属性添加字符串数据用于页面显示新闻时间
					sb.append("<td >" + NewsTime + "</td>");
					// 返回属性添加字符串数据用于页面显示详情按钮
					sb.append("<td ><a style=\"color:#3F862E\" target=\"_blank\" href=\"newsFrontDetail.jsp?newsId="
							+ NewsID + "\">详情</a></td></tr>");

					rs.next();// 判定是否存在下一条信息
					i++;// i属性数值自增1
				}
				// 拼写字符串数据用于列表最下方的分页方法
				sb.append(Fun.PageFront(sPage, rs, intPage, intPageSize));
			}
			rs.close();// 关闭结果集
			stmt.close();// 关闭查询
			Conn.close();// 关闭数据连接
			return sb.toString();// 返回字符串数据
		} catch (Exception e) {// 得到系统运行异常
			return "No";// 如果系统异常方法返回字符“No”
		}
	}
	
	// 新闻内容查询方法
	public String FrontNewsDetail(String s0) {
		try {// 捕获系统异常
			Connection Conn = DBConn.getConn();// 建立数据库连接
			Statement stmt = Conn.createStatement();// 创建数据查询
			ResultSet rs = null;// 定义结果集
			int NewsID = Fun.StrToInt(s0);// 将参数s0进行转换
			if (NewsID == 0) {// s0判定等于0
				return "No";// 返回字符“No”
			} else {// s0判定不等于0
				try {
					// 创建sql语句查询News表全部信息
					String sql = "select * from News where NewsID=" + NewsID;
					rs = stmt.executeQuery(sql);// 得到执行sql结果
					// 定义本方法返回字符串数据
					StringBuffer sb = new StringBuffer();

					int i = 0;// 定义起始数据
					// i属性小于页面显示条数并且查询结果集不为空，进行循环方法
					while (i < 1 && !rs.isAfterLast()) {
						rs.next();// 判定是否存在
						// 定义数字型变量并赋值News表里的NewsTitle属性
						String NewsTitle = rs.getString("NewsTitle");
						// 定义数字型变量并赋值News表里的NewsContent属性
						String NewsContent = rs.getString("NewsContent");

						String[] content = NewsContent.split("#");// 以#号进行分割
						// 返回属性添加字符串数据用于页面显示新闻标题
						sb.append("<br><h2 style=\"font-size:28px;margin-left:30%\">" + NewsTitle + "</h2>");

						for (int j = 0; j < content.length; j++) {// 循环
							// 返回属性添加字符串数据用于页面显示内容信息
							sb.append("<p>" + content[j] + "</p>");
						}
						rs.next();// 判定是否存在
						i++;// 自增
					}

					rs.close();// 关闭结果集
					stmt.close();// 关闭查询
					Conn.close();// 关闭数据连接
					return sb.toString();// 返回字符串数据
				} catch (Exception e) {// 得到系统运行异常
					Conn.rollback(); // JDBC回滚机制
					Conn.close();// 关闭数据库连接
					return "No";// 返回字符串“No”
				}
			}
		} catch (Exception e) {// 得到系统运行异常

			return "No";// 系统异常后返回字符“No”
		}

	}

	public String ListNews(String sPage, String strPage) {
		try {

			Connection Conn = DBConn.getConn();
			Statement stmt = Conn.createStatement();
			ResultSet rs = null;
			StringBuffer sb = new StringBuffer();

			int i;
			int intPage = 1;
			int intPageSize = 5;

			String sSql = "select * from News order by NewsID desc";
			rs = stmt.executeQuery(sSql);

			if (!rs.next()) {
				sb.append("<tr height=\"25\" bgcolor=\"#d6dff7\"  class=\"info1\"><td colspan=\"4\">\r\n");
				sb.append("<div align=\"center\"><b>没有记录!</b></div></td></tr>\r\n");
			} else {

				intPage = Fun.StrToInt(strPage);
				sPage = Fun.CheckReplace(sPage);
				if (intPage == 0)
					intPage = 1;

				rs.absolute((intPage - 1) * intPageSize + 1);
				i = 0;
				while (i < intPageSize && !rs.isAfterLast()) {
					int NewsID = rs.getInt("NewsID");
					String NewsTitle = rs.getString("NewsTitle");
					String NewsContent = rs.getString("NewsContent");
					String NewsTime = rs.getString("NewsTime");
					String AdminName = rs.getString("AdminName");

					sb.append("<tr>");
					sb.append("<td class=\"table-id\">" + NewsID + "</td>");

					sb.append("<td>" + NewsTitle + "</td>");
					sb.append("<td class=\"table-title\">" + AdminName + "</td>");
					sb.append("<td class=\"table-title\">" + NewsTime + "</td>");
					sb.append("<td><div class=\"am-btn-toolbar\">");
					sb.append("<div class=\"am-btn-group am-btn-group-xs\">");
					sb.append("<input type=\"hidden\" value=\"" + NewsID + "\">");
					sb.append("<input type=\"hidden\" value=\"" + NewsContent + "\">");
					sb.append("<input type=\"hidden\" value=\"" + NewsTitle + "\">");
					sb.append("<a onclick=\"edit(this);\"");
					sb.append("class=\"am-btn am-btn-primary am-btn-xs \"");
					sb.append("href=\"javascript:void(0);\"> <span></span> 修改 <a> ");
					sb.append("<a rel=\"" + NewsID
							+ "\" onclick=\"del(this);\" class=\"am-btn am-btn-danger am-btn-xs \" href=\"javascript:void(0);\"> "
							+ "<span></span>删除<a>");
					sb.append("</div></div></td></tr>");

					rs.next();
					i++;
				}
				sb.append(Fun.Page(sPage, rs, intPage, intPageSize));
			}
			rs.close();
			stmt.close();
			Conn.close();
			return sb.toString();
		} catch (Exception e) {
			return "No";
		}
	}

	public String AddNews(String[] s, String s1, String s2) {
		try {
			Connection Conn = DBConn.getConn();
			Statement stmt = Conn.createStatement();

			ResultSet rs = null;
			String sSql = "select * from News order by NewsID desc";
			rs = stmt.executeQuery(sSql);
			int z = 0;
			int newNum = 0;
			if (!rs.next()) {
				newNum = 1;
			} else {
				while (z < 1 && !rs.isAfterLast()) {
					int NewsID = rs.getInt("NewsID");
					newNum = NewsID + 1;
					break;
				}
			}

			for (int i = 0; i < s.length; i++) {
				if (i != 1)
					s[i] = Fun.getStrCN(Fun.CheckReplace(s[i]));
				else
					s[i] = Fun.getStrCN(s[i]);
			}

			SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String newsTime = format1.format(new Date());

			StringBuffer sql = new StringBuffer();
			sql.append("insert into News (NewsID,NewsTitle,NewsContent,NewsTime,AdminName) values (" + " '" + newNum
					+ "'," + " '" + s[0] + "'," + " '" + s[1] + "'," + " '" + newsTime + "'," + " '" + s1 + "')");

			System.out.println(sql);

			try {

				Conn.setAutoCommit(false);
				stmt.execute(sql.toString());
				Conn.commit();
				Conn.setAutoCommit(true);
				stmt.close();
				Conn.close();

				return "Yes";
			} catch (Exception e) {
				Conn.rollback();
				e.printStackTrace();
				Conn.close();
				return "添加成功!";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "添加失败";
		}
	}

	public String EditNews(String[] s, String s0, String s1, String s2) {
		try {

			Connection Conn = DBConn.getConn();
			Statement stmt = Conn.createStatement();

			for (int i = 0; i < s.length; i++) {
				s[i] = Fun.getStrCN(Fun.CheckReplace(s[i]));
			}

			int NewsID = Fun.StrToInt(s0);

			StringBuffer sql = new StringBuffer();
			sql.append("update News set NewsTitle='" + s[0] + "'" + " ,NewsContent='" + s[1] + "'" + " where NewsID='"
					+ NewsID + "'");

			stmt.executeUpdate(sql.toString());
			stmt.close();
			Conn.close();

			return "Yes";

		} catch (Exception e) {
			e.printStackTrace();
			System.out.print(e.getMessage());
			return "编辑错误!";
		}
	}

	public boolean DelNews(String s0, String s1, String s2) {

		try {
			Connection Conn = DBConn.getConn();
			Statement stmt = Conn.createStatement();
			int NewsID = Fun.StrToInt(s0);
			if (NewsID == 0)
				return false;
			else {
				try {
					String sql = "delete from News where NewsID=" + NewsID;

					Conn.setAutoCommit(false);
					stmt.executeUpdate(sql);

					Conn.commit();
					Conn.setAutoCommit(true);

					stmt.close();
					Conn.close();
					return true;
				} catch (Exception e) {
					Conn.rollback();
					// e.printStackTrace();
					Conn.close();
					return false;
				}
			}
		} catch (Exception e) {
			// e.printStackTrace();
			// System.out.print(e.getMessage());

			return false;
		}

	}

}
