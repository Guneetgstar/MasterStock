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
    if(request.getSession().getAttribute("login")!=null){
        if(request.getSession().getAttribute("login").equals("false")) {
            out.print("alert(\"Please enter a valid details\")");
            request.getSession().setAttribute("login","");
        }
        }
    if(request.getSession().getAttribute("logout")!=null){
        if(request.getSession().getAttribute("logout").equals("true")) {
            out.print("alert(\"Logged out Successfully\")");
            request.getSession().setAttribute("logout","");
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
    <a href="index.jsp">Admin</a>
    <a href="../employ.jsp">Employer</a>
    <a href="../index.jsp">Job Seeker</a>
    <a href="../help.jsp">Help</a>
</div>
<div id="div2">
    <form action="login.jsp" method="post" id="login" onsubmit="return check()">
        <table id="tb">
            <tr>
                <td>Username</td>
                <td><input type="text" id="id" width="100px" name="id"> </td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" id="pw" width="100px" name="pw">  </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="Login" align="center">
                </td>
            </tr>
        </table>
    </form>
</div>
<div style="width: 90%;margin-left: auto;margin-right: auto; background-color: cornflowerblue" ;>
    <footer style="text-align: center">
        <label style="color: aliceblue">&copy; All rights reserved.</label>
    </footer>
</div>
</body>
</html>
