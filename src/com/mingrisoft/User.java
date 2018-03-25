package com.mingrisoft;			

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class User
{

    DBConnection DBConn = new DBConnection();
    Function Fun = new Function(); 
   
	public String AdminName,AdminPwd,UserName,UserSex,UserTel;
	public String UserQQ,UserEmail,UserAddress,UserZip,UserInfo;
	public String AddTime,LastLoginTime,LastLoginIP;
	public String sAdminType,UserBirthday;
	public int AdminType,BirthYear,BirthMonth,BirthDay;
	public int NewsNum,LoginNum;
	public String [] sType = new String[4];
	
    
    
    public User()
    {
    	sType[1] = "";
    	sType[2] = "";
    	sType[3] = "";  
    }
    
    
     public String ListUser(String sPage,String strPage)
     {			
 		try
     	{
 			
     		Connection Conn = DBConn.getConn();
 	    	Statement stmt = Conn.createStatement();
 	    	ResultSet rs = null;
     		StringBuffer sb = new StringBuffer();
     		
 			int i;
 			int intPage = 1; 			
 			int intPageSize = 5;
 			
 	    	String sSql = "select * from Admin order by AdminID desc";
 	    	rs = stmt.executeQuery(sSql);
 	    	
     		
 	    	
 			if (!rs.next())
 			{ 
 				sb.append("<tr height=\"25\" bgcolor=\"#d6dff7\"  class=\"info1\"><td colspan=\"4\">\r\n");
 				sb.append("<div align=\"center\"><b>û���û�!</b></div></td></tr>\r\n");
 			}
 			else 
 			{
 				
 				intPage = Fun.StrToInt(strPage);
 				sPage = Fun.CheckReplace(sPage);
 				if (intPage==0) intPage=1;	
 	
 				rs.absolute((intPage-1) * intPageSize+1);
 				i = 0; 
 				while(i < intPageSize && !rs.isAfterLast())
 				{		
 				    int AdminID = rs.getInt("AdminID");	
 					String AdminName = rs.getString("AdminName");
 					String AdminPwd = rs.getString("AdminPwd");
 					String AdminType = rs.getString("AdminType");
 					String LastLoginTime = rs.getString("LastLoginTime");
 					
 					
 					sb.append("<tr>");
 					sb.append("<td class=\"table-id\">"+AdminID+"</td>");
 					
 					sb.append("<td>"+AdminName+"</td>");
 					sb.append("<td class=\"table-title\">"+AdminPwd+"</td>");
 					sb.append("<td class=\"table-title\">"+LastLoginTime+"</td>");		
 					sb.append("</tr>");		
 							
 					rs.next(); 
 					i++;
 				}
 				sb.append(Fun.Page(sPage,rs,intPage,intPageSize));
 			}
 			rs.close();
     		stmt.close();
     		Conn.close();
     		return sb.toString();	
     	}catch(Exception e)
         {
             return "No";
         }
     }
    
}