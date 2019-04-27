<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page import = "java.io.*,java.util.*, java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Cerca</title>
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
            String tipo = request.getParameter("tipo");
            String valore = request.getParameter("valore");
            String sql = "SELECT * FROM Grossi WHERE ? LIKE '%?%'" ;
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, tipo);
            stmt.setString(2, valore);
            ResultSet rs = stmt.executeQuery();
            
            out.print("<table>");
			
			out.print("<tr><th align=left>Cognome</th><th align=left>Nome</th><th align=left>Email</th><th align=left>Username</th></tr>");
			
    		while(rs.next()){

				String Nome = rs.getString("Nome");
				String Cognome = rs.getString("Cognome");
				String Email = rs.getString("Email");
				String Username = rs.getString("Username");
				String PW = rs.getString("Psw");
                
                out.print("<tr><td>" + Cognome + "</td><td>" + Nome + "</td></td>" + Email + "</td><td>" + Username + "</td><td>" + PW + "</td></tr>");

	        }
	        
	        out.print("</table>");
            
            
            rs.close();
            connection.close();
            } catch(Exception e){
                out.println(e);
            } %>
    </body>
</html>