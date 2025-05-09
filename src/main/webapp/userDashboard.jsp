<%--
  Created by IntelliJ IDEA.
  User: vimu
  Date: 5/1/2025
  Time: 10:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.ToyShop.Model.User" %>
<%@ page import="com.ToyShop.Model.Payment" %>
<%@ page import="java.util.List" %>
<%
  User user = (User) session.getAttribute("user");
  if (user == null || user.isAdmin()) {
    response.sendRedirect("login.jsp");
    return;
  }
  List<Payment> orders = (List<Payment>) request.getAttribute("orders");
%>
<!DOCTYPE html>
<html>

<head>
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

  <title>TOYMART | My Account</title>

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
    .dashboard-header {
      background-color: #f7f7f7;
      padding: 30px 0;
      margin-bottom: 30px;
    }

    .user-card {
      background-color: #fff;
      border-radius: 15px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.08);
      padding: 25px;
      margin-bottom: 30px;
      transition: transform 0.3s;
    }

    .user-card:hover {
      transform: translateY(-5px);
    }

    .user-avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      object-fit: cover;
      margin-bottom: 15px;
      background-color: #f1f2f6;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 36px;
      color: #f89c35;
    }

    .dashboard-menu {
      background-color: #fff;
      border-radius: 15px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.08);
      padding: 0;
      overflow: hidden;
    }

    .menu-item {
      padding: 15px 20px;
      border-bottom: 1px solid #eee;
      transition: all 0.3s;
      display: flex;
      align-items: center;
    }

    .menu-item:last-child {
      border-bottom: none;
    }

    .menu-item i {
      margin-right: 10px;
      color: #f89c35;
    }

    .menu-item:hover {
      background-color: #f89c35;
      color: white;
    }

    .menu-item:hover i {
      color: white;
    }

    .menu-item.active {
      background-color: #f89c35;
      color: white;
    }

    .menu-item.active i {
      color: white;
    }

    .dashboard-content {
      background-color: #fff;
      border-radius: 15px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.08);
      padding: 25px;
      min-height: 400px;
    }

    .stats-card {
      background-color: #fff;
      border-radius: 15px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.08);
      padding: 15px;
      margin-bottom: 20px;
      border-left: 4px solid #f89c35;
    }

    .stats-card h3 {
      margin-bottom: 5px;
      font-size: 16px;
    }

    .stats-card p {
      font-size: 24px;
      font-weight: bold;
      margin: 0;
    }

    .btn-toymart {
      background-color: #f89c35;
      color: white;
      border: none;
      transition: all 0.3s;
    }

    .btn-toymart:hover {
      background-color: #e68a1e;
      color: white;
    }

    .profile-form label {
      font-weight: 500;
    }

    .orders-table th {
      background-color: #f89c35;
      color: white;
    }

    .delete-form button {
      background-color: #dc3545;
      color: white;
      border: none;
    }

    .delete-form button:hover {
      background-color: #c82333;
    }

    .tab-content {
      display: none;
    }

    .tab-content.active {
      display: block;
    }
  </style>
</head>

<body>
<!-- header section strats -->
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
            <a class="nav-link" href="userDashboard.jsp"><i class="fa fa-user" aria-hidden="true"></i> My Account <span class="sr-only">(current)</span></a>
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

<div class="dashboard-header">
  <div class="container">
    <h2 class="text-center">My Account Dashboard</h2>
  </div>
</div>

<div class="container mb-5">
  <div class="row">
    <!-- Left Sidebar -->
    <div class="col-lg-3 mb-4">
      <!-- User Card -->
      <div class="user-card text-center">
        <div class="user-avatar mx-auto">
          <i class="fa fa-user"></i>
        </div>
        <h4><%= user.getUsername() %></h4>
        <p class="text-muted"><%= user.getEmail() %></p>
        <a href="#" class="btn btn-toymart btn-sm mt-2" id="edit-profile-btn">Edit Profile</a>
      </div>

      <!-- Dashboard Menu -->
      <div class="dashboard-menu">
        <a href="#" class="menu-item active" data-tab="dashboard">
          <i class="fa fa-dashboard"></i> Dashboard
        </a>
        <a href="#" class="menu-item" data-tab="orders">
          <i class="fa fa-shopping-bag"></i> My Orders
        </a>
        <a href="#" class="menu-item" data-tab="settings">
          <i class="fa fa-cog"></i> Account Settings
        </a>
        <a href="LogoutServlet" class="menu-item">
          <i class="fa fa-sign-out"></i> Logout
        </a>
      </div>
      <a href="home.jsp" >Shopping</a>
    </div>

    <!-- Main Content Area -->
    <div class="col-lg-9">
      <!-- Dashboard Overview -->
      <div class="tab-content active" id="dashboard-tab">
        <div class="dashboard-content">
          <h3 class="mb-4">Dashboard Overview</h3>

          <div class="row">
            <div class="col-md-6">
              <div class="stats-card">
                <h3>Orders</h3>
                <p>5</p>
              </div>
            </div>
            <div class="col-md-6">
              <div class="stats-card">
                <h3>Rewards Points</h3>
                <p>250</p>
              </div>
            </div>
          </div>

          <h4 class="mt-4 mb-3">Recent Orders</h4>
          <div class="table-responsive">
            <table class="table table-hover">
              <thead>
              <tr>
                <th>Order #</th>
                <th>Date</th>
                <th>Items</th>
                <th>Total</th>
                <th>Status</th>
              </tr>
              </thead>
              <tbody>
              <tr>
                <td>TM65432</td>
                <td>Apr 25, 2025</td>
                <td>3</td>
                <td>$85.00</td>
                <td><span class="badge badge-success">Delivered</span></td>
              </tr>
              <tr>
                <td>TM65431</td>
                <td>Apr 12, 2025</td>
                <td>2</td>
                <td>$45.00</td>
                <td><span class="badge badge-info">Shipped</span></td>
              </tr>
              </tbody>
            </table>
          </div>

          <h4 class="mt-4 mb-3">Recently Viewed</h4>
          <div class="row">
            <div class="col-md-3 mb-3">
              <div class="card">
                <img src="images/p1.png" class="card-img-top" alt="Toy">
                <div class="card-body text-center">
                  <h6 class="card-title">Aeroplane</h6>
                  <p class="card-text">$50.00</p>
                </div>
              </div>
            </div>
            <div class="col-md-3 mb-3">
              <div class="card">
                <img src="images/p2.png" class="card-img-top" alt="Toy">
                <div class="card-body text-center">
                  <h6 class="card-title">Building Blocks</h6>
                  <p class="card-text">$35.00</p>
                </div>
              </div>
            </div>
            <div class="col-md-3 mb-3">
              <div class="card">
                <img src="images/p3.png" class="card-img-top" alt="Toy">
                <div class="card-body text-center">
                  <h6 class="card-title">Dinosaur</h6>
                  <p class="card-text">$45.00</p>
                </div>
              </div>
            </div>
            <div class="col-md-3 mb-3">
              <div class="card">
                <img src="images/p4.png" class="card-img-top" alt="Toy">
                <div class="card-body text-center">
                  <h6 class="card-title">Ball</h6>
                  <p class="card-text">$15.00</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Orders Tab -->
      <div class="tab-content" id="orders-tab">
        <div class="dashboard-content">
          <h3 class="mb-4">My Orders</h3>
          <div class="table-responsive">
            <% if (orders != null && !orders.isEmpty()) { %>
            <table class="table table-hover orders-table">
              <thead>
              <tr>
                <th>Order ID</th>
                <th>Toys</th>
                <th>Address</th>
                <th>Amount</th>
                <th>Date</th>
                <th>Action</th>
              </tr>
              </thead>
              <tbody>
              <% for (int i = 0; i < orders.size(); i++) {
                Payment order = orders.get(i);
              %>
              <tr>
                <td><%= order.getOrderId() %></td>
                <td><%= order.getToySummary() %></td>
                <td><%= order.getAddress() %></td>
                <td>₹<%= String.format("%.2f", order.getTotalAmount()) %></td>
                <td><%= order.getDate() %></td>
                <td><a href="OrderDetailsServlet?orderId=<%= order.getOrderId() %>" class="btn btn-sm btn-outline-primary">View</a></td>
              </tr>
              <% } %>
              </tbody>
            </table>
            <% } else { %>
            <p>You have no orders yet.</p>
            <% } %>
          </div>
        </div>
      </div>

      <!-- Removed Wishlist and Address tabs as requested -->

      <!-- Settings Tab -->
      <div class="tab-content" id="settings-tab">
        <div class="dashboard-content">
          <h3 class="mb-4">Account Settings</h3>
          <div class="profile-form">
            <form id="profile-form" action="UpdateProfileServlet" method="post">
              <div class="form-row">
                <div class="form-group col-md-6">
                  <label for="username">Username</label>
                  <input type="text" class="form-control" id="username" name="username" value="<%= user.getUsername() %>" required>
                </div>
                <div class="form-group col-md-6">
                  <label for="email">Email</label>
                  <input type="email" class="form-control" id="email" name="email" value="<%= user.getEmail() %>" required>
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col-md-6">
                  <label for="current-password">Current Password</label>
                  <input type="password" class="form-control" id="current-password" name="currentPassword">
                  <small class="form-text text-muted">Enter your current password to confirm changes</small>
                </div>
                <div class="form-group col-md-6">
                  <label for="new-password">New Password</label>
                  <input type="password" class="form-control" id="new-password" name="password">
                  <small class="form-text text-muted">Leave blank if you don't want to change it</small>
                </div>
              </div>
              <button type="submit" class="btn btn-toymart">Save Changes</button>
            </form>

            <hr class="my-4">

            <h4 class="mb-3">Email Preferences</h4>
            <div class="form-check mb-2">
              <input class="form-check-input" type="checkbox" value="" id="newsletter" checked>
              <label class="form-check-label" for="newsletter">
                Subscribe to newsletter
              </label>
            </div>
            <div class="form-check mb-2">
              <input class="form-check-input" type="checkbox" value="" id="promotions" checked>
              <label class="form-check-label" for="promotions">
                Receive promotions and discounts
              </label>
            </div>
            <div class="form-check mb-3">
              <input class="form-check-input" type="checkbox" value="" id="order-updates" checked>
              <label class="form-check-label" for="order-updates">
                Order status updates
              </label>
            </div>
            <button class="btn btn-sm btn-toymart mb-4">Update Preferences</button>

            <hr class="my-4">

            <h4 class="text-danger mb-3">Delete Account</h4>
            <p>Warning: This action cannot be undone. All your data will be permanently removed.</p>
            <form class="delete-form" action="DeleteAccountServlet" method="post" onsubmit="return confirm('Are you sure you want to delete your account? This action cannot be undone.');">
              <button type="submit" class="btn">Delete Account</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- info section -->
<section class="info_section layout_padding2">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-lg-3 info_col">
        <div class="info_contact">
          <h4>
            Address
          </h4>
          <div class="contact_link_box">
            <a href="">
              <i class="fa fa-map-marker" aria-hidden="true"></i>
              <span>
                  Location
                </span>
            </a>
            <a href="">
              <i class="fa fa-phone" aria-hidden="true"></i>
              <span>
                  Call +94 721985928
                </span>
            </a>
            <a href="">
              <i class="fa fa-envelope" aria-hidden="true"></i>
              <span>
                  toymart@gmail.com
                </span>
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
          <h4>
            Info
          </h4>
          <p>
            Online toy shopping platform
          </p>
        </div>
      </div>

      <div class="col-md-6 col-lg-3 info_col">
        <h4>
          Subscribe
        </h4>
        <form action="#">
          <input type="text" placeholder="Enter email" />
          <button type="submit">
            Subscribe
          </button>
        </form>
      </div>
    </div>
  </div>
</section>
<!-- end info section -->

<!-- footer section -->
<section class="footer_section">
  <div class="container">
    <p>
      © <span id="displayYear"></span> TOYMART. All Rights Reserved
    </p>
  </div>
</section>
<!-- footer section -->

<!-- jQery -->
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<!-- popper js -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
</script>
<!-- bootstrap js -->
<script type="text/javascript" src="js/bootstrap.js"></script>
<!-- owl slider -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
</script>
<!-- custom js -->
<script type="text/javascript" src="js/custom.js"></script>

<script>
  $(document).ready(function() {
    // Tab navigation
    $('.menu-item').not('.logout-link').click(function(e) {
      e.preventDefault();
      $('.menu-item').removeClass('active');
      $('.tab-content').removeClass('active');

      $(this).addClass('active');
      const tabId = $(this).data('tab') + '-tab';
      $('#' + tabId).addClass('active');
    });

    // Edit profile button click
    $('#edit-profile-btn').click(function(e) {
      e.preventDefault();

      $('.menu-item').removeClass('active');
      $('.tab-content').removeClass('active');

      $('.menu-item[data-tab="settings"]').addClass('active');
      $('#settings-tab').addClass('active');
    });

    // Current year for footer
    $("#displayYear").text(new Date().getFullYear());
  });
</script>


</body>

</html>