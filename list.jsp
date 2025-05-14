<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
          crossorigin="anonymous">
    <title>Users List</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
        }
        .container {
            max-width: 800px;
            margin-top: 50px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
        }
        .table thead {
            background-color: #007bff;
            color: white;
        }
        .table tbody tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>

<div class="container">
    <h3 class="text-center mb-4">All Users</h3>
    
    <div class="table-responsive">
        <table class="table table-striped table-bordered text-center">
            <thead>
                <tr>
                    <th>User Name</th>
                    <th>User Email</th>
                    <th>User Password</th>
                </tr>
            </thead>
            <tbody>
                <%@ page import="java.sql.*" %>
                <%@ page import="com.mysql.jdbc.Driver" %>
                
                <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb", "root", "root");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM users");

                    while(rs.next()) {
                        String username = rs.getString("username");
                        String email = rs.getString("Gmail");
                        String userpass = rs.getString("pass");
                %>
                        <tr>
                            <td><%= username %></td>
                            <td><%= email %></td>
                            <td><%= userpass %></td>
                        </tr>
                <%
                    }
                    con.close();
                } catch (Exception e) {
                    out.println("<tr><td colspan='3' class='text-danger'>Error fetching users</td></tr>");
                }
                %>
            </tbody>
        </table>
    </div>
    
    <div class="text-center mt-3">
        <a href="index.html" class="btn btn-primary">Back to Home</a>
    </div>
</div>

</body>
</html>
