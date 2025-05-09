<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register - My Toyshop</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css">
    <style>
        .register-header {
            background-color: #3fc1c9;
            color: white;
            text-align: center;
            padding: 30px 0;
        }

        .register-box {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
        }

        .btn-register {
            background-color: #203247;
            color: #ffffff;
            border: none;
        }

        .btn-register:hover {
            background-color: #0c1520;
        }
    </style>
</head>
<body class="sub_page">

<div class="hero_area">
    <div class="hero_bg_box">
        <img src="images/hero-bg.jpg" alt="Background">
    </div>

    <section class="layout_padding">
        <div class="container">
            <div class="register-header">
                <h2>Create Your Account</h2>
                <p>Join the Toyshop community</p>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="register-box">
                        <% if (request.getAttribute("error") != null) { %>
                        <div class="message error"><%= request.getAttribute("error") %></div>
                        <% } %>
                        <form action="RegisterServlet" method="post">
                            <div class="form-group">
                                <label for="fullname">Full Name</label>
                                <input type="text" class="form-control" id="fullname" name="fullname" required>
                            </div>

                            <div class="form-group">
                                <label for="email">Email Address</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>

                            <div class="form-group">
                                <label for="username">Username</label>
                                <input type="text" class="form-control" id="username" name="username" required>
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                            <div class="form-group text-center">
                                <button type="submit" class="btn btn-register">Register</button>
                            </div>
                        </form>
                        <div class="text-center mt-3">
                            <p>Already have an account? <a href="index.jsp">Login here</a></p>
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
