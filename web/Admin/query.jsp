<%@ page import="java.sql.Connection" %>
<%@ page import="main.java.Utils" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: Gunee
  Date: 23-09-2018
  Time: 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    final String VCAND = "select * from candidate;";
    final String VEMP = "select * from employer;";
    final String VJOB = "select * from jobs;";
    final String VINT = "select * from interview;";
    final String PLCMNT = "select * from placement;";
    final String OPLCMT = "select * from other_placement;";
%>

            <%
            String query = request.getParameter("value");
            try(Connection connection = Utils.getConnection();
                Statement statement = connection.createStatement();){
            switch (query){
                case "vcand": {
                    out.print("<h1>Candidate table</h1>");
                    ResultSet set = statement.executeQuery(VCAND);
                    Utils.displayTable(set,out);
                    break;
                }
                case "vemp": {
                    out.print("<h1>Employer table</h1>");
                    ResultSet set = statement.executeQuery(VEMP);
                    Utils.displayTable(set,out);
                    break;
                 }
                 case "vint":{
                     out.print("<h1>Interview table</h1>");
                    ResultSet set = statement.executeQuery(VINT);
                    Utils.displayTable(set,out);
                    set.close();
                    break;
                 }
                 case "vjob":{
                     out.print("<h1>Job table</h1>");
                    ResultSet set = statement.executeQuery(VJOB);
                    Utils.displayTable(set,out);
                    break;
                 }
                 case "vplcmnt":{
                     out.print("<h1>Placement table</h1>");
                    ResultSet set = statement.executeQuery(PLCMNT);
                    Utils.displayTable(set,out);
                    break;
                 }
                 case "othr_plcmnt":{
                     out.print("<h1>Other placements</h1>");
                    ResultSet set = statement.executeQuery(OPLCMT);
                    Utils.displayTable(set,out);
                    break;
                 }
                 case "acand":{
                     ResultSet set = connection.getMetaData().getColumns(null,null,
                    "candidate",null);
                     request.getSession().setAttribute("update","acand");
                     Utils.getSchema(set,out);
                     break;
                 }
                 case "ajob":{
                     ResultSet set = connection.getMetaData().getColumns(null,null,
                    "jobs",null);
                     request.getSession().setAttribute("update","ajob");
                     Utils.getSchema(set,out);
                     break;
                 }
                 case "aint":{
                     ResultSet set = connection.getMetaData().getColumns(null,null,
                    "interview",null);
                     request.getSession().setAttribute("update","aint");
                     Utils.getSchema(set,out);
                     break;
                 }
                 case "aemp":{
                     ResultSet set = connection.getMetaData().getColumns(null,null,
                    "employer",null);
                     request.getSession().setAttribute("update","aemp");
                     Utils.getSchema(set,out);
                     break;
                 }
            }
            }catch (SQLException e){
                e.printStackTrace();
            }
%>