<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.jdbc.Driver" %>

<!DOCTYPE html>
<html>
<head>
    <title>Registration Status</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            padding: 50px;
        }
        .container {
            background: white;
            width: 400px;
            margin: auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .message {
            font-size: 18px;
            margin-bottom: 20px;
            padding: 10px;
            border-radius: 5px;
        }
        .error {
            background-color: #ffdddd;
            color: red;
            border: 1px solid red;
        }
        .success {
            background-color: #ddffdd;
            color: green;
            border: 1px solid green;
        }
        .back-link {
            text-decoration: none;
            padding: 10px 20px;
            color: white;
            background-color: #007bff;
            border-radius: 5px;
            display: inline-block;
            transition: 0.3s;
        }
        .back-link:hover {
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
        
        String mail = request.getParameter("mail");
        
        String query = "SELECT * FROM users WHERE Gmail=?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, mail);
        
        ResultSet rs = ps.executeQuery();
        
        if (rs.next()) {
%>
            <div class="message error">User already exists. Try logging in.</div>
            <a href="index.html" class="back-link">Go to Login</a>
<%
        } else {
            String pass = request.getParameter("pass");
            String name = request.getParameter("name");
            String query1 = "INSERT INTO users (username, Gmail, pass, role) VALUES (?, ?, ?, ?);";
            PreparedStatement ps1 = con.prepareStatement(query1);
            ps1.setString(1, name);
            ps1.setString(2, mail);
            ps1.setString(3, pass);
            ps1.setString(4, "user");
            
            ps1.executeUpdate();
%>
            <div class="message success">You are successfully registered!</div>
            <a href="index.html" class="back-link">Go to Login</a>
<%
        }
    } catch(SQLException e) {
%>
        <div class="message error">Database Error: <%= e.getMessage() %></div>
<%
    }
%>
</div>

</body>
</html>
