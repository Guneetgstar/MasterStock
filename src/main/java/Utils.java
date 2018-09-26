package main.java;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import java.io.IOException;
import java.io.PrintStream;
import java.io.Writer;
import java.sql.*;

public class Utils {
    public static Connection getConnection(){
        Connection connection=null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

        try {
            connection = DriverManager.getConnection
                    ("jdbc:sqlserver://localhost:1433;databaseName=master_stock;" +
                            "user=sa;password=as");
            System.out.println("success");
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        }catch (ClassNotFoundException e){
            System.out.println(e);
        }
        return connection;
    }
    public static void displayTable(ResultSet set, JspWriter out){
        try {

            out.print("<table class='table-bordered' style='width:90%'> <tr>");
            int colCount = set.getMetaData().getColumnCount();
            int i;
            for (i = 1; i <= colCount; i++) {
                out.print("<td>"+set.getMetaData().getColumnName(i)+"</td>");
                }
            out.print("</tr>"+"<tr>");
            while (set.next()) {
                for (i = 1; i <= colCount; i++) {
                    switch (set.getMetaData().getColumnType(i)){
                        case 4:{
                            out.print("<td>"+set.getInt(i)+"</td>");
                            break;
                        }
                        case 12:{
                            out.print("<td>"+set.getString(i)+"</td>");
                            break;
                        }
                        case 93:{
                            out.print("<td>"+set.getDate(i)+"</td>");
                            break;
                        }

                    }

                }
                out.print("</tr>");
            }
            out.print(" </tr>  </table>");
        }catch (SQLException | IOException e){
                System.out.println("error"+e);
        }
    }
    public static void getSchema(ResultSet set,JspWriter out){
        try {
            out.print("<form id='update' method='post' onSubmit='return validate()' action='update.jsp' class='col-sm-6'>");
            out.print("<div class='form-group'>");
            while(set.next()) {
                out.print("<label>" + set.getString(4) + "</label>");
                switch (set.getInt(5)){
                    default:{
                        out.print("<input type='text' name='"+set.getString(4)+"' class='form-control'>");
                        break;
                    }
                    case 93:{
                        out.print("<input type='date' name='"+set.getString(4)+"' class='form-control'>");
                        break;
                    }

                }

            }
            out.print("<input type='submit'/>");
            out.print("</div>");
            out.print("</form>");
        }catch (SQLException | IOException e){
            System.out.println("error"+e);
        }
    }
    public static void updateTable(ResultSet set, PreparedStatement stat, HttpServletRequest request) throws SQLException{
        int count = stat.getParameterMetaData().getParameterCount();
        String fields[] = new String[count];
        String parameters[] = new String[count];
        for (int i = 1; i <= count; i++) {
            set.next();
            fields[i - 1] = set.getString(4);
            System.out.println(fields[i-1]);
        }

        for (int i = 1; i <= count; i++) {
            parameters[i - 1] = request.getParameter(fields[i - 1]);
            System.out.println(parameters[i-1]);
        }
        for (int i = 1; i <= count; i++) {
            switch (stat.getParameterMetaData().getParameterType(i)) {
                case 4: {
                    stat.setInt(i, Integer.valueOf(parameters[i - 1]));
                    break;
                }
                case 12: {
                    stat.setString(i, parameters[i - 1]);
                    break;
                }
                case 93: {
                    stat.setDate(i, Date.valueOf(parameters[i - 1]));
                    break;
                }

            }

        }
        stat.execute();

    }
}
