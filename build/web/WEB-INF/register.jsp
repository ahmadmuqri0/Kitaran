<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="register" method="post">
            Username: 
            <input 
                type="text" 
                id="username" 
                name="username" 
                placeholder="Enter your username" 
                required
                minlength="3"
            ><br>
            Password: 
            <input 
                type="password" 
                id="password" 
                name="password" 
                placeholder="Enter your password" 
                required
                minlength="6"
            ><br>
            No. Phone: 
            <input
                type="text"
                id="no_phone"
                name="no_phone"
                placeholder="Enter your number: 01234567890"
                required
            ><br>
            <input type="submit" value="Register">
        </form>
    </body>
</html>
