<%@ page import="java.util.Enumeration" %>
<%@ page import="main.java.Utils" %>
<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: Gunee
  Date: 24-09-2018
  Time: 00:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%
        final String ACAND = "INSERT INTO [master_stock].[dbo].[candidate] " +
                "([candID], [loginID], [password], [username], " +
                "[uname], [dob], [sex], [mstatus], [address], [city], [state], [country], " +
                "[contact], [pcity], [exp], [funA], [cIND], [dLevel], [edu_qual], [tech_qual]) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?\n" +
                ",?, ?, ?, ?, ?, ?,?,?,?,?,?,?)";
        final String AEMP = "INSERT INTO [master_stock].[dbo].[employer] " +
                "([emp_code], [loginID], [password], [e_mail], [comp_name], [detail], " +
                "[address], [city], [state], [country], [count_no], [count_per], " +
                "[reg_date]) VALUES (?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?, ?, ?)";
        final String AJOB = "INSERT INTO [master_stock].[dbo].[jobs] " +
                "([job_code], [job_title], [emp_code], [profile], [expe], " +
                "[edu_qual], [tech_qual], [CInd], [salary], [city], [mail], " +
                "[vacancy], [job_date]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        final String AINT = "INSERT INTO [master_stock].[dbo].[interview] " +
                "([icode], [job_code], [address], [city], [date], [time], [cont_no], " +
                "[cont_per], [updateOn]) VALUES (?,?,?, ?, ?, ?, ? , ?, ?)";
        String value=(String)request.getSession().getAttribute("update");
        Connection connection=null;
        ResultSet set=null;
        PreparedStatement stat=null;

        if(value!=null) {
            try {
                switch (value) {
                    case "acand": {
                        connection = Utils.getConnection();
                        set = connection.getMetaData().getColumns(null, null,
                                "candidate", null);
                        stat = connection.prepareStatement(ACAND);
                        Utils.updateTable(set, stat, request);
                        break;
                    }
                    case "aemp": {
                        connection = Utils.getConnection();
                        set = connection.getMetaData().getColumns(null, null,
                                "employer", null);
                        stat = connection.prepareStatement(AEMP);
                        Utils.updateTable(set, stat, request);
                        break;
                    }
                    case "aint": {
                        connection = Utils.getConnection();
                        set = connection.getMetaData().getColumns(null, null,
                                "interview", null);
                        stat = connection.prepareStatement(AINT);
                        Utils.updateTable(set, stat, request);
                        break;
                    }
                    case "ajob": {
                        connection = Utils.getConnection();
                        set = connection.getMetaData().getColumns(null, null,
                                "jobs", null);
                        stat = connection.prepareStatement(AJOB);
                        Utils.updateTable(set, stat, request);
                        break;
                    }
                }
                out.print("<script>alert('Insert Successful');" +
                        "window.location.replace(\"./panel.jsp\");</script>");


            } catch (SQLException e) {
                System.out.print("Error while Updating\n" + e);
                out.print("<script>alert('Error while updating');" +
                        "window.location.replace(\"./panel.jsp\");</script>");

            }finally {
                try {
                    stat.close();
                    set.close();
                    connection.close();
                }catch (SQLException e){

                }
            }
        }
    %>
</head>
<body>
</body>
</html>
