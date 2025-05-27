<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Forgot Password</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
</head>
<body>
<div class="container">
    <h2>Forgot Password</h2>

   
    <form method="post" action="forgot-password">
        <label for="email">Enter your registered email:</label>
        <input type="email" name="email" id="email" required>
        <button type="submit">Reset Password</button>
    </form>

    <a href="login">Back to Login</a>
</div>
</body>
</html>
