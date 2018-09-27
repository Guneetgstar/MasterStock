<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link type="text/css" rel="stylesheet" href="index.css"/>
</head>
<body>

<script>
    <%
    if(request.getSession().getAttribute("cliLogin")!=null){
        if(request.getSession().getAttribute("cliLogin").equals("false")) {
            out.print("alert(\"Please enter a valid details\")");
            request.getSession().setAttribute("cliLogin","");
        }
        }
    if(request.getSession().getAttribute("cliLogout")!=null){
        if(request.getSession().getAttribute("cliLogout").equals("true")) {
            out.print("alert(\"Logged out Successfully\")");
            request.getSession().setAttribute("cliLogout","");
        }
        }
%>
    function check(){
        alert("redirecting");
        var a=document.getElementById("id").value;
        var b=document.getElementById("pw").value;
        var c=b.length;
        if(a!="" && parseInt(c)>=4){
            document.getElementById("login").submit();
        }
        else {
            alert("Please enter valid username and password");
            return false;
        }
    }
</script>
<div id="div1">
    <a class="nav" href="Admin/index.jsp">Admin</a>
    <a class="nav" href="employ.jsp">Employer</a>
    <a class="nav" href="index.jsp">Job Seeker</a>
    <a class="nav" href="help.jsp">Help</a>
</div>
<div id="div2">
    <form action="cliLogin.jsp" method="post" id="login" onsubmit="return check()">
        <table id="tb">
            <tr>
                <td>Candidate  Username</td>
                <td><input type="text" id="id" width="100px" name="id"> </td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" id="pw" width="100px" name="pw">  </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input class="button" style="margin-top: 20px" type="submit" value="Login" align="center">
                </td>
            </tr>
        </table>
    </form>
    <label>Or</label><center>
    <a class="up" href="sign_up.jsp">
    <input type="button" value="Sign Up" class="button"/>
    </a></center>
</div>
<div style="width: 90%;margin-left: auto;margin-right: auto; background-color: cornflowerblue" ;>
    <footer style="text-align: center">
        <label style="color: aliceblue">&copy; All rights reserved.</label>
    </footer>
</div>
</body>
</html>
