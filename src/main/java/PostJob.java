package main.java;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "PostJob")
public class PostJob extends HttpServlet {
    final String AJOB = "INSERT INTO [master_stock].[dbo].[jobs] " +
            "([job_code], [job_title], [emp_code], [profile], [expe], " +
            "[edu_qual], [salary],[city],[mail], " +
            "[vacancy], [job_date]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        Connection connection=Utils.getConnection();
        try (PreparedStatement stat = connection.prepareStatement(AJOB);
             Statement statement=connection.createStatement()) {
            ResultSet set=statement.executeQuery("select TOP 1 job_code from jobs order by job_code desc");
            int i=0;
            if(set.next())
                i=set.getInt(1)+1;
            stat.setInt(1,i);
            Map<String, String[]> map = request.getParameterMap();
            map.forEach((a, b) -> {
                switch (a) {
                    case "title": {try {
                        stat.setString(2, b[0].toString());
                    }catch (SQLException e){
                        System.out.println("Error");
                        e.printStackTrace();
                        }
                        break;
                    }
                    case "profile": {try{
                        stat.setString(4, b[0].toString());
                        break;
                    }catch (SQLException e){
                        System.out.println("Error");
                        e.printStackTrace();
                        }
                    }
                    case "exp": {try {
                        stat.setString(5, b[0].toString());

                    }catch (SQLException e){                        System.out.println("Error");
                    e.printStackTrace();
                        }
                        break;
                    }

                    case "qual": {
                        try{
                        stat.setString(6, b[0].toString());

                    }catch (SQLException e){
                        System.out.println("Error");
                        e.printStackTrace();
                        }
                        break;
                    }
                    case "pay": {
                        try{
                        stat.setString(7, b[0].toString());
                    }catch (SQLException e){
                        System.out.println("Error");
                        e.printStackTrace();
                        }
                        break;
                    }
                    case "posts": {try {
                        stat.setString(10, b[0].toString());

                    }catch (SQLException e){
                        System.out.println("Error");
                        e.printStackTrace();
                        }
                        break;
                    }
                    case "mail": {try {
                        stat.setString(9, b[0].toString());
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
                }
            });
            stat.setDate(11, new Date(System.currentTimeMillis()));
            stat.setInt(3,
                    Integer.valueOf((String) request.getSession().getAttribute("emp_code")));
            if (stat.execute()) {
                response.getWriter().println("<script>alert('Job Added successfully');</script>");
                response.sendRedirect("empHome.jsp");
            } else {
                response.getWriter().println("<script>alert('Error while adding');</script>");
                response.sendRedirect("empHome.jsp");
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

}
