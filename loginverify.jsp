<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <title>Login Check</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            margin: 0;
            padding: 0;
        }
        .container {
            margin-top: 100px;
        }
        .error {
            color: red;
            font-size: 18px;
            margin-bottom: 15px;
        }
        .login-link {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            color: white;
            background-color: #007bff;
            text-decoration: none;
            border-radius: 5px;
            transition: 0.3s;
        }
        .login-link:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
<% 
    try {
        String url = "jdbc:mysql://localhost:3306/projectdb";
        String user = "root";
        String password = "root";
        
        String driver = "com.mysql.jdbc.Driver";
        Class.forName(driver);

        Connection con = DriverManager.getConnection(url, user, password);
        
        String query = "SELECT * FROM users WHERE Gmail=? AND pass=?;";
        PreparedStatement ps = con.prepareStatement(query);
        
        String mail = request.getParameter("usermail");
        String pass = request.getParameter("password");
        
        ps.setString(1, mail);
        ps.setString(2, pass);
        
        ResultSet rs = ps.executeQuery();
        
        if(rs.next()) {
            session.setAttribute("userid", rs.getInt("ID"));
            session.setAttribute("uname", rs.getString("username"));
            session.setAttribute("mail", mail);
            session.setAttribute("password", pass);
            session.setAttribute("Role", rs.getString("role"));
            
            response.sendRedirect("success.jsp");
        } else {
%>
            <div class="error">User not found. Please try again.</div>
            <a class="login-link" href="signup.html">Login</a>
<%
        }
    } catch(SQLException e) {
        out.println("<div class='error'>Database error: " + e.getMessage() + "</div>");
    }
%>
</div>

</body>
</html>
