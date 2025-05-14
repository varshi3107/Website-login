<%
    Integer userId = (Integer) session.getAttribute("userid"); // Fix: Cast to Integer
    String role = (String) session.getAttribute("Role");
    String username = (String) session.getAttribute("uname");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            padding: 50px;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            display: inline-block;
        }
        h2 {
            color: #333;
        }
        a {
            display: inline-block;
            margin: 10px;
            padding: 10px 20px;
            text-decoration: none;
            background: #007BFF;
            color: white;
            border-radius: 5px;
        }
        a:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <%
            if (userId != null) {
                if ("user".equals(role)) {
        %>
                    <h2>Welcome Back, User <%= username %>!</h2>
        <%
                } else {
        %>
                    <h2>Welcome Back, Admin <%= username %>!</h2>
                    <a href="list.jsp">Database Table</a>
        <%
                }
        %>
                <a href="Logout.jsp">Logout</a>
        <%
            } else {
        %>
                <h2>Session Expired</h2>
                <a href="login.jsp">Login Again</a>
        <%
            }
        %>
    </div>
</body>
</html>
