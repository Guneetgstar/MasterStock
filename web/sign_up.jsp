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
    if(request.getSession().getAttribute("cliLogin")!=null){
        if(request.getSession().getAttribute("cliLogin").equals("false")) {
            request.getSession().setAttribute("cliLogin","");
        }else if(request.getSession().getAttribute("cliLogin").equals("true"))
            response.sendRedirect("home.jsp");
    }

%>

<div id="div1">
    <a class="nav" href="Admin/index.jsp">Admin</a>
    <a class="nav" href="employ.jsp">Employer</a>
    <a class="nav" href="index.jsp">Job Seeker</a>
    <a class="nav" href="help.jsp">Help</a>
</div>
<div id="div2">
    <form action="CandSignUp" method="post" id="login" >
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
                <td>DOB</td>
                <td><input type="date" name="dob"/> </td>
            </tr>
            <tr>
                <td>Sex</td>
                <td><select name="gender">
                    <option value="m">Male</option>
                    <option value="f">Female</option>
                    <option value="o">Other</option>
                </select> </td>
            </tr>
            <tr>
                <td>Marital Status</td>
                <td><select name="mstatus">
                    <option value="Single">Single</option>
                    <option value="Married">Married</option>
                </select></td>
            </tr>
            <tr>
                <td>Address</td>
                <td><input type="text" name="address"> </td>
            </tr>
            <tr>
                <td>Home Town</td>
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
                <td>Highest Education</td>
                <td><input type="text" name="edu"></td>
            </tr>
            <tr><td>Email</td><td><input type="text" name="email"></td></tr>
            <tr>
                <td colspan="2">
                    <input class="button" style="margin-top: 20px" type="submit" value="SignUp" align="center">
                </td>
            </tr>
        </table>
    </form>
    <label>Or</label><center>
    <a class="up" href="index.jsp">
        <input type="button" value="Log In" class="button"/>
    </a></center>
</div>
</body>
</html>
