<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
	<h1>Login page</h1>
    <form action="login.jsp" mathod="Post">
        <input type="email" name="usermail" placeholder="Enter gmail" required>
        <input type="password" name="password" placeholder="Enter password" required>
        <button type="submit" class="btn btn-dark">submit</button>
        <button type="reset" class="btn btn-dark">Reset</button>
    </form>
    <a href="register.jsp">Register Here</a>
</body>
</html>