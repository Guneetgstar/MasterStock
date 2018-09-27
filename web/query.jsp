<%@ page import="java.sql.Connection" %>
<%@ page import="main.java.Utils" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: Gunee
  Date: 27-09-2018
  Time: 01:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%
        final String VCAND = "select uname,dob, sex,mstatus,address,city,state,country," +
                "contact,pcity,exp,cIND,dLevel,edu_qual,tech_qual from candidate;";
        final String VEMP = "select e_mail,comp_name,detail,reg_date,address,city,state," +
                "country,count_per,count_no from employer;";
        final String VJOB = "select * from jobs;";//Apply->
        final String PJOB="insert into jobs";
    %>
<%
        String query = request.getParameter("value");
        try(Connection connection = Utils.getConnection();
            Statement statement = connection.createStatement();) {
            switch (query) {
                case "candJobs": {
                    out.print("<h1>We are Hiring</h1>");
                    ResultSet set = statement.executeQuery(VJOB);
                    Utils.displayTable(set, out);
                    out.print("<br><input type='button' class='button' value='Apply'");
                    break;
                }
                case "candEmp": {
                    out.print("<h1>Registered employers</h1>");
                    ResultSet set = statement.executeQuery(VEMP);
                    Utils.displayTable(set, out);
                    break;
                }
                case "empPost": {
                    out.print("<h1>Create a job to post</h1>");
                    %>
                    <form action="PostJob" method="post">
                        <table class='table-bordered' style='width:90%'>
                            <tr>
                                <td>Job Title</td>
                                <td><input type="text" name="title"></td>
                            </tr>
                            <tr>
                                <td>Profile</td>
                                <td><input type="text" name="profile"></td>
                            </tr>
                            <tr>
                                <td>Experience req.</td>
                                <td><input type="text" name="exp"></td>
                            </tr>
                            <tr>
                                <td>Qualification</td>
                                <td><input type="text" name="qual"></td>
                            </tr>
                            <tr>
                                <td>Pay Scale</td>
                                <td><input type="text" name="pay"></td>
                            </tr>
                            <tr>
                                <td>Email ID</td>
                                <td><input type="text" name="mail"></td>
                            </tr>
                            <tr>
                                <td>City</td>
                                <td><input type="text" name="city"></td>
                            </tr>
                            <tr><td>No.of posts</td><td><input type="text" name="posts"></td>
                            </tr>
                            <tr><td colspan="2"><input type="submit"></td> </tr>
                        </table>
                    </form>
                    <%
                    break;
                }
                case "empView": {
                    out.print("<h1>Candidate table</h1>");
                    ResultSet set = statement.executeQuery(VCAND);
                    Utils.displayTable(set, out);
                    break;
                }

            }


        }catch (SQLException e){
            e.printStackTrace();
        }

%>

</head>
<body>

</body>
</html>
