<%@ page import="java.sql.*" %>
<%@ page import="main.java.Utils" %><%--
  Created by IntelliJ IDEA.
  User: Gunee
  Date: 23-09-2018
  Time: 00:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String id=request.getParameter("id");
    String pw=request.getParameter("pw");
    if(id!=null&&pw!=null) {
        try(Connection connection = Utils.getConnection();
            Statement statement = connection.createStatement();
            ResultSet set=statement.executeQuery("SELECT * FROM " +
                    "admin WHERE id ='"+id+"' AND pw ='"+pw+"'");) {
            System.out.println("success");
            if(set.next()){
                response.sendRedirect("panel.jsp");
                request.getSession().setAttribute("login","true");
            }else{
                response.sendRedirect("index.jsp");
                request.getSession().setAttribute("login","false");
            }
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
    }
%>
</body>
</html>
