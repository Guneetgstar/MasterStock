<%--
  Created by IntelliJ IDEA.
  User: Gunee
  Date: 26-09-2018
  Time: 23:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" ></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Home</title>
    <link type="text/css" rel="stylesheet" href="index.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" ></script>
    <style>
        a{
            text-decoration: none;
        }
        #logout{
            display: block;
            width:200px;
            height: 50px;
            outline:none;
            border: 0px;
            text-align: center;
            background-color: aliceblue;
            color: cornflowerblue;
            margin-left: auto;
            margin-right: auto;
            -webkit-border-radius: 20px;
            -moz-border-radius: 20px;
            border-radius: 20px;
            margin-top: 100px;

        }
    </style>
    <%
        if(request.getSession().getAttribute("cliLogin")!=null){
            if(!request.getSession().getAttribute("cliLogin").equals("true")) {
            }
        }else {
            response.sendRedirect("index.jsp");
            request.getSession().setAttribute("login","");
        }
    %>

</head>
<body style="margin: 0; padding: 0; font-size: large">
<div style="background-color: cornflowerblue;
                color: aliceblue;width: 20%;height: 100%;
                background-size: cover; float: left">
    <div style="padding-top: 200px">
        <a href="candJobs"> <input class="button" value="View Jobs" type="button"></a>
        <br>
        <label style="text-align: center;color: aliceblue">Or</label>
        <br>
        <a href="candEmp"><input class="button" value="View Employers" style="width: 200px" type="button">
        </a>
        <input id="logout" type="button" name="log" value="Logout">
    </div>
</div>
<div id="div2" style="float: right;height: 100%; width: 80%;">
</div>
</body>
<script>
    $('a').click(function() {
        $.post('query.jsp', {value: $(this).attr('href')}, function (e) {
            $('#div2').html(e);
        });
        return false;
    });
    $('#logout').click(function () {
        location.assign('CandLogout')
    });
</script>
</html>
