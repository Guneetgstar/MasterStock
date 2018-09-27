package main.java;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.Map;

@WebServlet(name = "EmpSignUp")
public class EmpSignUp extends HttpServlet {
    final String AEMP = "INSERT INTO [master_stock].[dbo].[employer] " +
            "([emp_code], [loginID], [password], [e_mail], [comp_name], [detail], " +
            "[address], [city], [state], [country], [count_no], [count_per], " +
            "[reg_date]) VALUES (?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?, ?, ?)";
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection connection=Utils.getConnection();
        try (PreparedStatement stat = connection.prepareStatement(AEMP);
             Statement statement=connection.createStatement()) {
            ResultSet set=statement.executeQuery("select TOP 1 emp_code from jobs order by emp_code desc");
            int i=0;
            if(set.next())
                i=set.getInt(1)+1;
            stat.setInt(1,i);
            Map<String, String[]> map = request.getParameterMap();
            map.forEach((a, b) -> {
                switch (a) {
                    case "id": {try {
                        stat.setString(2, b[0].toString());
                    }catch (SQLException e){
                        System.out.println("Error");
                        e.printStackTrace();
                    }
                        break;
                    }
                    case "pw": {try{
                        stat.setString(3, b[0].toString());
                        break;
                    }catch (SQLException e){
                        System.out.println("Error");
                        e.printStackTrace();
                    }
                    }
                    case "dob": {try {
                        stat.setDate(13,Date.valueOf(b[0].toString()));
                    }catch (SQLException e){
                        System.out.println("Error");
                        e.printStackTrace();
                    }
                        break;
                    }

                    case "email": {
                        try{
                            stat.setString(4, b[0].toString());

                        }catch (SQLException e){
                            System.out.println("Error");
                            e.printStackTrace();
                        }
                        break;
                    }
                    case "name": {
                        try{
                            stat.setString(5, b[0].toString());
                        }catch (SQLException e){
                            System.out.println("Error");
                            e.printStackTrace();
                        }
                        break;
                    }
                    case "dis": {try {
                        stat.setString(6, b[0].toString());

                    }catch (SQLException e){
                        System.out.println("Error");
                        e.printStackTrace();
                    }
                        break;
                    }
                    case "address": {try {
                        stat.setString(7, b[0].toString());
                    }catch (SQLException e){
                        System.out.println("Error");
                        e.printStackTrace();
                    }
                        break;
                    }
                    case "city": {try {
                        stat.setString(8, b[0].toString());
                    }catch (SQLException e){
                        System.out.println("Error");
                        e.printStackTrace();
                    }
                        break;
                    }
                    case "state": {try {
                        stat.setString(9, b[0].toString());
                    }catch (SQLException e){
                        System.out.println("Error");
                        e.printStackTrace();
                    }
                        break;
                    }
                    case "country": {try {
                        stat.setString(10, b[0].toString());
                    }catch (SQLException e){
                        System.out.println("Error");
                        e.printStackTrace();
                    }
                        break;
                    }
                    case "pname": {try {
                        stat.setString(12, b[0].toString());
                    }catch (SQLException e){
                        System.out.println("Error");
                        e.printStackTrace();
                    }
                        break;
                    }
                    case "pno": {try {
                        stat.setString(11, b[0].toString());
                    }catch (SQLException e){
                        System.out.println("Error");
                        e.printStackTrace();
                    }
                        break;
                    }
                }
            });
            if (stat.execute()) {
                response.getWriter().println("<script>alert('Account Added successfully');</script>");
                request.getSession().setAttribute("empLogin","true");
                response.sendRedirect("empHome.jsp");
            } else {
                response.sendRedirect("empHome.jsp");
                response.getWriter().println("<script>alert('Error while adding');</script>");
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

}



