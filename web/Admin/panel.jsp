<%--
  Created by IntelliJ IDEA.
  User: Gunee
  Date: 23-09-2018
  Time: 02:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(request.getSession().getAttribute("login")!=null){
        if(!request.getSession().getAttribute("login").equals("true")) {
            response.sendRedirect("index.jsp");
            request.getSession().setAttribute("login","false");
        }
    }else {
        response.sendRedirect("index.jsp");
        request.getSession().setAttribute("login","");
    }
%>
<html>
<head>
    <script src="jquery.js" ></script>
    <title>Admin Panel</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
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
        }
        .add{
            height: 25px;
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

        }
        dl{
            margin-left: 30px;
        }
        h1{
            color: cornflowerblue;
        }
    </style>
</head>

<body style="margin: 0; padding: 0; font-size: large">

<div>
    <div id="div1" style="background-color: cornflowerblue;
                color: aliceblue;width: 20%;height: 100%;
                background-size: cover; float: left">
        <div style="padding-top: 20px;">
            <dl>
                <dt>Candidate</dt>
                <dd><a style="text-decoration: none; color: aliceblue" href="vcand"> View Candidates</a></dd>
                <dd><input class="add" type="button" value="Add Candidates" name="acand"/></dd>

                <br>
                <dt>Employers</dt>
                <dd><a style="text-decoration: none; color: aliceblue" href="vemp">View Employers</a></dd>
                <dd><input class="add" type="button" value="Add Employers" name="aemp"/></dd>

                <br>
                <dt>Jobs</dt>
                <dd><a style="text-decoration: none; color: aliceblue" href="vjob">View Jobs</a></dd>
                <dd><input class="add" type="button" value="Add Jobs" name="ajob"/></dd>

                <br>
                <dt>Interviews</dt>
                <dd><a style="text-decoration: none; color: aliceblue" href="vint">View Interviews</a></dd>
                <dd><input class="add" type="button" value="Add Interviews" name="aint"/></dd>

                <br>
                <dt><a style="text-decoration: none; color: aliceblue" href="vplcmnt">Placements</a></dt>
                <dt><a style="text-decoration: none; color: aliceblue" href="othr_plcmnt">Others</a></dt>
            </dl>
            <input id="logout" type="button" name="log" value="Logout">
        </div>
    </div>
    <div  style="float: right;height: 100%; width: 80%;">
        <div style="float: top;height: 90px;width: 100%;background-color: cornflowerblue;">
            <label style="margin-right: auto;margin-left: auto;color: aliceblue;font-size: 50px">
                Welcome To the Admin panel
            </label>
        </div>
        <div id="div2" style="float: right; background-color: aliceblue; height: 100%;width: 100%"></div>
    </div>
</div>
</body>
<script>
    $('a').click(function(){
        $.post('query.jsp',{value:$(this).attr('href')},function(e){
            $('#div2').html(e);
        });
        return false;
    });
    $('#logout').click(function () {
        location.assign('Logout')
    })
    $('.add').click(function(){
        $.post('query.jsp',{value:$(this).attr('name')},function(e){
            $('#div2').html(e);
        });
        return true;
    });
    function validate() {
        var inputs=$(".form-control");
        for(var i = 0; i < inputs.length; i++){
            if($(inputs[i]).val()=="") {
                alert("You must enter all fields");
                return false;
            }
        }
        return ture;
    }

</script>
</html>
