<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link type="text/css" rel="stylesheet" href="index.css"/>
</head>
<body>
<%
    if(request.getSession().getAttribute("empLogin")!=null){
        if(request.getSession().getAttribute("empLogin").equals("false")) {
            request.getSession().setAttribute("empLogin","");
        }else if(request.getSession().getAttribute("empLogin").equals("true"))
            response.sendRedirect("empHome.jsp");
    }

%>
<div id="div1">
    <a class="nav" href="Admin/index.jsp">Admin</a>
    <a class="nav" href="employ.jsp">Employer</a>
    <a class="nav" href="index.jsp">Job Seeker</a>
    <a class="nav" href="help.jsp">Help</a>
</div>
<div id="div2">
    <form action="EmpSignUp" method="post" id="login" >
        <table id="tb">
            <tr>
                <td>New Username</td>
                <td><input type="text" id="id" width="100px" name="id"> </td>
            </tr>
            <tr>
                <td>New Password</td>
                <td><input type="password" id="pw" width="100px" name="pw">  </td>
            </tr>
            <tr>
                <td>Re-enter Password</td>
                <td><input type="password" id="rpw" width="100px" name="pw">  </td>
            </tr>
            <tr>
                <td>Registration Date</td>
                <td><input type="date" name="dob"/> </td>
            </tr>
            <tr>
                <td>E-mail ID</td>
                <td><input type="text" name="email"> </td>
            </tr>

            <tr>
                <td>Company Name</td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>Description</td>
                <td><textarea name="dis" style="height: 70px;width: 200px">
                </textarea></td>
            </tr>

            <tr>
                <td>Address</td>
                <td><input type="text" name="address"> </td>
            </tr>
            <tr>
                <td>City</td>
                <td><input type="text" name="city"> </td>
            </tr>
            <tr>
                <td>State</td>
                <td><input type="text" name="state"></td>
            </tr>
            <tr>
                <td>Country</td>
                <td><input type="text" name="country"></td>
            </tr>
            <tr>
                <td>Contact person</td>
                <td><input type="text" name="pname"></td>
            </tr>
            <tr>
                <td>Contact Number</td>
                <td><input type="text" name="pno"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input class="button" style="margin-top: 20px" type="submit" value="SignUp" align="center">
                </td>
            </tr>
        </table>
    </form>
    <label>Or</label><center>
    <a class="up" href="employ.jsp">
        <input type="button" value="Log In" class="button"/>
    </a></center>
</div>
</body>
</html>
