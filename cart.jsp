<%--
  Created by IntelliJ IDEA.
  User: vimu
  Date: 5/4/2025
  Time: 11:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map, java.util.HashMap, java.util.Set, java.util.List" %>
<%@ page import="com.ToyShop.Model.*" %>
<%@ page import="com.ToyShop.dao.*" %>
<%@ page import="com.ToyShop.Controller.*" %>
<html>
<head>
  <title>Your Cart | TOYMART</title>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <link rel="shortcut icon" href="images/favicon1.png" type="">

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">

  <!--owl slider stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

  <!-- font awesome style -->
  <link href="css/font-awesome.min.css" rel="stylesheet" />

  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />

  <style>
    /* Cart Page Specific Styles */
    .cart_section {
      padding: 90px 0;
      background-color: #f9f9f9;
    }

    .cart_container {
      background-color: #ffffff;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 0 15px rgba(0,0,0,0.05);
    }

    .cart_title {
      font-weight: bold;
      color: #203247;
      margin-bottom: 30px;
      position: relative;
      padding-bottom: 15px;
    }

    .cart_title:after {
      content: "";
      position: absolute;
      bottom: 0;
      left: 0;
      width: 80px;
      height: 3px;
      background-color: #3fc1c9;
    }

    .cart_table {
      width: 100%;
      margin-bottom: 30px;
    }

    .cart_table thead {
      background-color: #203247;
      color: #ffffff;
    }

    .cart_table th {
      padding: 15px;
      text-align: center;
      font-weight: 600;
      text-transform: uppercase;
    }

    .cart_table td {
      padding: 20px;
      vertical-align: middle;
      border-bottom: 1px solid #eeeeee;
      text-align: center;
    }

    .cart_item_img {
      width: 100px;
      height: 100px;
      object-fit: contain;
      border-radius: 5px;
      padding: 5px;
      background-color: #f9f9f9;
    }

    .cart_item_name {
      font-weight: 600;
      color: #203247;
      transition: all 0.3s;
    }

    .cart_item_name:hover {
      color: #3fc1c9;
      text-decoration: none;
    }

    .cart_item_price {
      font-weight: 600;
      color: #3fc1c9;
    }

    .cart_item_total {
      font-weight: 700;
      color: #203247;
    }

    .quantity_input {
      width: 70px;
      padding: 8px;
      border: 2px solid #eeeeee;
      border-radius: 5px;
      text-align: center;
      transition: all 0.3s;
    }

    .quantity_input:focus {
      border-color: #3fc1c9;
      outline: none;
    }

    .remove_btn {
      color: #ff6b6b;
      background: none;
      border: none;
      font-size: 18px;
      transition: all 0.3s;
    }

    .remove_btn:hover {
      color: #ff0000;
      transform: scale(1.2);
    }

    .cart_summary {
      background-color: #f9f9f9;
      padding: 30px;
      border-radius: 10px;
    }

    .summary_title {
      font-weight: bold;
      color: #203247;
      margin-bottom: 20px;
      position: relative;
      padding-bottom: 10px;
    }

    .summary_title:after {
      content: "";
      position: absolute;
      bottom: 0;
      left: 0;
      width: 60px;
      height: 2px;
      background-color: #3fc1c9;
    }

    .summary_item {
      display: flex;
      justify-content: space-between;
      margin-bottom: 15px;
    }

    .summary_total {
      display: flex;
      justify-content: space-between;
      margin-top: 20px;
      padding-top: 20px;
      border-top: 2px solid #eeeeee;
      font-weight: 700;
      font-size: 18px;
    }

    .btn_box {
      margin-top: 30px;
      display: flex;
      justify-content: space-between;
    }

    .btn_continue {
      display: inline-block;
      padding: 12px 30px;
      background-color: #ffffff;
      color: #203247;
      border: 2px solid #203247;
      border-radius: 5px;
      transition: all 0.3s;
      font-weight: 600;
    }

    .btn_continue:hover {
      background-color: #203247;
      color: #ffffff;
      text-decoration: none;
    }

    .btn_checkout {
      display: inline-block;
      padding: 12px 30px;
      background-color: #3fc1c9;
      color: #ffffff;
      border: 2px solid #3fc1c9;
      border-radius: 5px;
      transition: all 0.3s;
      font-weight: 600;
    }

    .btn_checkout:hover {
      background-color: #2fa8b0;
      color: #ffffff;
      text-decoration: none;
    }

    .empty_cart {
      text-align: center;
      padding: 50px 0;
    }

    .empty_cart_icon {
      font-size: 80px;
      color: #dddddd;
      margin-bottom: 20px;
    }

    .empty_cart_text {
      font-size: 24px;
      color: #203247;
      margin-bottom: 20px;
    }

    .empty_cart_btn {
      display: inline-block;
      padding: 12px 30px;
      background-color: #3fc1c9;
      color: #ffffff;
      border-radius: 5px;
      transition: all 0.3s;
      font-weight: 600;
    }

    .empty_cart_btn:hover {
      background-color: #2fa8b0;
      color: #ffffff;
      text-decoration: none;
    }

    @media (max-width: 768px) {
      .btn_box {
        flex-direction: column;
      }

      .btn_continue, .btn_checkout {
        width: 100%;
        margin-bottom: 15px;
        text-align: center;
      }

      .cart_item_img {
        width: 70px;
        height: 70px;
      }
    }
  </style>
  <script>
    function autoSubmitForm() {
      // Add a small delay to ensure the input value has been updated
      setTimeout(function() {
        document.getElementById('cartForm').submit();
      }, 300);
    }

    function confirmRemove(toyName) {
      return confirm("Are you sure you want to remove " + toyName + " from your cart?");
    }
  </script>
</head>
<body>

<div class="hero_area">
  <div class="hero_bg_box">
    <img src="images/hero-bg.png" alt="">
  </div>

  <!-- header section starts -->
  <header class="header_section">
    <div class="container-fluid">
      <nav class="navbar navbar-expand-lg custom_nav-container">
        <a class="navbar-brand" href="index.jsp">
          <span>TOYMART</span>
        </a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class=""> </span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" href="index.jsp">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="about.jsp">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="shop.jsp">Shop</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="ageDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Age
              </a>
              <div class="dropdown-menu" aria-labelledby="ageDropdown">
                <a class="dropdown-item" href="age0-2.jsp?age=0-1">0-2 Years</a>
                <a class="dropdown-item" href="age2-4.jsp?age=1-3">2-4 Years</a>
                <a class="dropdown-item" href="age4-6.jsp?age=3-5">4-6 Years</a>
                <a class="dropdown-item" href="age6+.jsp?age=5-8">6+ Years</a>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="contact.jsp">Contact</a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="cart.jsp"><i class="fa fa-shopping-cart" aria-hidden="true"></i> Cart</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="login.jsp"><i class="fa fa-user" aria-hidden="true"></i> Login</a>
            </li>
            <form class="form-inline">
              <button class="btn my-2 my-sm-0 nav_search-btn" type="submit">
                <i class="fa fa-search" aria-hidden="true"></i>
              </button>
            </form>
          </ul>
        </div>
      </nav>
    </div>
  </header>
  <!-- end header section -->
</div>

<!-- Cart Section -->
<section class="cart_section layout_padding">
  <div class="container">
    <div class="cart_container">
      <h2 class="cart_title">Your Shopping Cart</h2>

      <%
        Map<String, Integer> cartMap = (Map<String, Integer>) session.getAttribute("cartMap");
        if (cartMap == null || cartMap.isEmpty()) {
      %>
      <div class="empty_cart">
        <i class="fa fa-shopping-cart empty_cart_icon" aria-hidden="true"></i>
        <h3 class="empty_cart_text">Your cart is empty</h3>
        <p>Looks like you haven't added any toys to your cart yet.</p>
        <a href="shop.jsp" class="empty_cart_btn">
          <i class="fa fa-shopping-bag" aria-hidden="true"></i> Start Shopping
        </a>
      </div>
      <%
      } else {
        InventoryManager manager = new InventoryManager();
        manager.loadFromFile();
        double subtotal = 0;
      %>
      <form id="cartForm" action="CartServlet" method="post">
        <table class="cart_table">
          <thead>
          <tr>
            <th>Product</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Total</th>
            <th>Action</th>
          </tr>
          </thead>
          <tbody>
          <%
            for (String toyId : cartMap.keySet()) {
              Toy toy = manager.getToyList().getHead();
              while (toy != null && !toy.getId().equals(toyId)) {
                toy = toy.next;
              }
              if (toy != null) {
                int qty = cartMap.get(toyId);
                double itemTotal = toy.getPrice() * qty;
                subtotal += itemTotal;
          %>
          <tr>
            <td>
              <div class="d-flex align-items-center">
                <img src="<%= toy.getImagePath() %>" alt="<%= toy.getName() %>" class="cart_item_img mr-3">
                <div>
                  <a href="#" class="cart_item_name"><%= toy.getName() %></a>
                  <div class="mt-2">
                    <span class="badge badge-secondary"><%= toy.getAgeGroup() %>+ years</span>
                    <span class="badge badge-light ml-2"><%= toy.getCategory() %></span>
                  </div>
                </div>
              </div>
            </td>
            <td class="cart_item_price">$<%= String.format("%.2f", toy.getPrice()) %></td>
            <td>
              <input type="number" class="quantity_input" name="quantity_<%= toy.getId() %>"
                     value="<%= qty %>" min="1" onchange="autoSubmitForm()">
            </td>
            <td class="cart_item_total">$<%= String.format("%.2f", itemTotal) %></td>
            <td>
              <button type="button" class="remove_btn"
                      onclick="if(confirmRemove('<%= toy.getName() %>')) window.location.href='CartServlet?action=remove&id=<%= toy.id %>'">
                <i class="fa fa-trash" aria-hidden="true"></i>
              </button>
            </td>
          </tr>
          <%
              }
            }
          %>
          </tbody>
        </table>
      </form>

      <div class="row">
        <div class="col-md-6"></div>
        <div class="col-md-6">
          <div class="cart_summary">
            <h4 class="summary_title">Order Summary</h4>

            <div class="summary_item">
              <span>Subtotal:</span>
              <span>$<%= String.format("%.2f", subtotal) %></span>
            </div>

            <div class="summary_item">
              <span>Shipping:</span>
              <span>FREE</span>
            </div>

            <div class="summary_item">
              <span>Tax (5%):</span>
              <span>$<%= String.format("%.2f", subtotal * 0.05) %></span>
            </div>

            <div class="summary_total">
              <span>Total:</span>
              <span>$<%= String.format("%.2f", subtotal * 1.05) %></span>
            </div>

            <div class="btn_box">
              <a href="home.jsp" class="btn_continue">
                <i class="fa fa-arrow-left" aria-hidden="true"></i> Continue Shopping
              </a>
              <a href="checkout.jsp" class="btn_checkout">
                <i class="fa fa-credit-card" aria-hidden="true"></i> Checkout
              </a>
            </div>
          </div>
        </div>
      </div>
      <%
        }
      %>
    </div>
  </div>
</section>

<!-- info section -->
<section class="info_section layout_padding2">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-lg-3 info_col">
        <div class="info_contact">
          <h4>Address</h4>
          <div class="contact_link_box">
            <a href="">
              <i class="fa fa-map-marker" aria-hidden="true"></i>
              <span>Location</span>
            </a>
            <a href="">
              <i class="fa fa-phone" aria-hidden="true"></i>
              <span>Call +94 721985928</span>
            </a>
            <a href="">
              <i class="fa fa-envelope" aria-hidden="true"></i>
              <span>toymart@gmail.com</span>
            </a>
          </div>
        </div>
        <div class="info_social">
          <a href="">
            <i class="fa fa-facebook" aria-hidden="true"></i>
          </a>
          <a href="">
            <i class="fa fa-twitter" aria-hidden="true"></i>
          </a>
          <a href="">
            <i class="fa fa-linkedin" aria-hidden="true"></i>
          </a>
          <a href="">
            <i class="fa fa-instagram" aria-hidden="true"></i>
          </a>
        </div>
      </div>
      <div class="col-md-6 col-lg-3 info_col">
        <div class="info_detail">
          <h4>Info</h4>
          <p>Online toy shopping platform</p>
        </div>
      </div>
      <div class="col-md-6 col-lg-3 info_col">
        <h4>Subscribe</h4>
        <form action="#">
          <input type="text" placeholder="Enter email" />
          <button type="submit">Subscribe</button>
        </form>
      </div>
    </div>
  </div>
</section>
<!-- end info section -->

<!-- footer section -->
<section class="footer_section">
  <div class="container">
    <p>© 2025 All Rights Reserved By TOYMART</p>
  </div>
</section>
<!-- footer section -->

<!-- jQery -->
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<!-- popper js -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<!-- bootstrap js -->
<script type="text/javascript" src="js/bootstrap.js"></script>
<!-- owl slider -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<!-- custom js -->
<script type="text/javascript" src="js/custom.js"></script>

</body>
</html>
