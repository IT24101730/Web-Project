<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - My Toyshop</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="sub_page">

<div class="hero_area">
    <!-- background box -->
    <div class="hero_bg_box">
        <img src="images/hero-bg.jpg" alt="Background" />
    </div>

    <section class="layout_padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="feature_section box">
                        <div class="heading_container heading_center">
                            <h2>Login</h2>
                            <p>Access your account to start shopping!</p>
                        </div>
                        <form action="LoginServlet" method="post">
                            <div class="form-group">
                                <label for="username">Username</label>
                                <input type="text" class="form-control" id="username" name="username" required>
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn1 mt-3">Login</button>
                            </div>
                        </form>
                        <div class="text-center mt-3">
                            <a href="register.jsp" class="btn btn2">Create an Account</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>
