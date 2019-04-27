<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page import = "java.io.*,java.util.*, java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
    </head>
    <body>
     <% 
            
            try {
                
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=grossi.marco;password=xxx123#";

            // l'istruzione seguente è fondamentale altrimenti non viene caricato il driver

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            // Load SQL Server JDBC driver and establish connection.
            Connection connection = DriverManager.getConnection(connectionUrl);

            //inserimento di un nuovo giudice
            String sql = "SELECT * FROM GrossiE Username = ' "+ request.getParameter("username") + " ' AND Pw = ' " + request.getParameter("password")+"'";
            Statement stmt = connection.createStatement(sql);
            ResultSet rs = stmt.executeQuery();
            if (rs.next())
            {
                out.println("Benvenuto "+ rs.getString("Nome"));
            }
            else
            }
                out.println("Ma chi sei?!?");
            }
            rs.close();
            connection.close();
            } catch(Exception e){
                out.println(e);
            } %>
    </body>
</html>