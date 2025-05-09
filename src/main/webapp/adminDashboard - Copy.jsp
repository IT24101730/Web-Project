<%@ page import="com.ToyShop.Model.User" %>
<%@ page import="java.util.List" %>
<%
    User admin = (User) session.getAttribute("user");
    if (admin == null || !admin.isAdmin()) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<User> users = (List<User>) request.getAttribute("users");
    List<User> admins = (List<User>) request.getAttribute("admins");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>TOYMART Admin Dashboard</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.0/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <!-- Custom styles -->
    <style>
        :root {
            --primary: #FF6F61;
            --secondary: #6B5B95;
            --success: #88B04B;
            --info: #92A8D1;
            --light: #F7F7F7;
            --dark: #34495E;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f8f9fc;
        }

        .sidebar {
            position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
            z-index: 100;
            padding: 48px 0 0;
            box-shadow: inset -1px 0 0 rgba(0, 0, 0, .1);
            background-color: var(--dark);
        }

        .sidebar-sticky {
            position: relative;
            top: 0;
            height: calc(100vh - 48px);
            padding-top: 1rem;
            overflow-x: hidden;
            overflow-y: auto;
        }

        .sidebar .nav-link {
            font-weight: 500;
            color: #f8f9fa;
            padding: 0.75rem 1rem;
            margin-bottom: 0.5rem;
            border-radius: 0.25rem;
            transition: all 0.3s;
        }

        .sidebar .nav-link:hover {
            color: #fff;
            background-color: rgba(255, 255, 255, 0.1);
        }

        .sidebar .nav-link.active {
            color: #fff;
            background-color: var(--primary);
        }

        .sidebar .nav-link i {
            margin-right: 10px;
        }

        .navbar-brand {
            padding-top: 0.75rem;
            padding-bottom: 0.75rem;
            font-size: 1.5rem;
            background-color: var(--primary);
            box-shadow: inset -1px 0 0 rgba(0, 0, 0, .25);
        }

        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 25px;
            transition: all 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background-color: #fff;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
            font-weight: 600;
        }

        .card-header i {
            margin-right: 10px;
            color: var(--primary);
        }

        .stat-card {
            padding: 20px;
            border-radius: 10px;
            color: white;
        }

        .stat-card i {
            font-size: 3rem;
            opacity: 0.3;
        }

        .stat-card .stat-number {
            font-size: 2rem;
            font-weight: 700;
        }

        .bg-gradient-primary {
            background: linear-gradient(45deg, var(--primary), #ff9a8d);
        }

        .bg-gradient-success {
            background: linear-gradient(45deg, var(--success), #a8d36b);
        }

        .bg-gradient-info {
            background: linear-gradient(45deg, var(--info), #b2c8e0);
        }

        .bg-gradient-secondary {
            background: linear-gradient(45deg, var(--secondary), #8b7bb5);
        }

        .table {
            margin-bottom: 0;
        }

        .table td, .table th {
            vertical-align: middle;
        }

        .badge-status {
            padding: 5px 10px;
            border-radius: 20px;
            font-weight: 400;
        }

        .btn-icon {
            border-radius: 50%;
            width: 32px;
            height: 32px;
            padding: 0;
            line-height: 32px;
            text-align: center;
            margin-right: 5px;
        }

        /* Form styling */
        .form-control {
            border-radius: 20px;
            padding: 12px 15px;
        }

        .btn-primary {
            background-color: var(--primary);
            border-color: var(--primary);
            border-radius: 20px;
            padding: 8px 20px;
        }

        .btn-primary:hover {
            background-color: #e86556;
            border-color: #e86556;
        }

        .content-wrapper {
            padding-left: 260px;
            padding-top: 20px;
            padding-right: 20px;
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 80px;
            }

            .sidebar .nav-link span {
                display: none;
            }

            .sidebar .nav-link i {
                margin-right: 0;
                font-size: 1.2rem;
            }

            .content-wrapper {
                padding-left: 100px;
            }
        }

        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .fade-in {
            animation: fadeIn 1s;
        }
    </style>
</head>
<body>
<!-- Sidebar -->
<nav class="sidebar">
    <div class="sidebar-sticky">
        <h3 class="px-3 mt-4 mb-5 text-white">
            <i class="fas fa-store"></i> TOYMART
        </h3>
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link active" href="#dashboard">
                    <i class="fas fa-tachometer-alt"></i>
                    <span>Dashboard</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#users">
                    <i class="fas fa-users"></i>
                    <span>Users</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="inventory.jsp">
                    <i class="fas fa-boxes"></i>
                    <span>Inventory</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="category.jsp">
                    <i class="fas fa-tags"></i>
                    <span>Categories</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="ageList.jsp">
                    <i class="fas fa-child"></i>
                    <span>Age Groups</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#orders">
                    <i class="fas fa-shopping-cart"></i>
                    <span>Orders</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#reports">
                    <i class="fas fa-chart-bar"></i>
                    <span>Reports</span>
                </a>
            </li>
            <li class="nav-item mt-5">
                <a class="nav-link" href="editProfile.jsp">
                    <i class="fas fa-user-cog"></i>
                    <span>My Profile</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="logout.jsp">
                    <i class="fas fa-sign-out-alt"></i>
                    <span>Logout</span>
                </a>
            </li>
        </ul>
    </div>
</nav>

<!-- Main Content -->
<main class="content-wrapper">
    <div class="container-fluid">
        <!-- Welcome Banner -->
        <div class="row mb-4 fade-in">
            <div class="col-12">
                <div class="card bg-gradient-primary text-white">
                    <div class="card-body">
                        <div class="row align-items-center">
                            <div class="col-md-8">
                                <h2 class="mb-0">Welcome back, <%= admin.getUsername() %>!</h2>
                                <p class="lead mb-0">Here's what's happening with your store today.</p>
                            </div>
                            <div class="col-md-4 text-right">
                                <i class="fas fa-laugh-beam display-4"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Statistics -->
        <div class="row mb-4 fade-in">
            <div class="col-xl-3 col-md-6">
                <div class="card stat-card bg-gradient-primary">
                    <div class="row">
                        <div class="col-8">
                            <div class="stat-number"><%=users != null ? users.size() : 0%></div>
                            <div>Total Users</div>
                        </div>
                        <div class="col-4 text-right">
                            <i class="fas fa-users"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card stat-card bg-gradient-success">
                    <div class="row">
                        <div class="col-8">
                            <div class="stat-number">42</div>
                            <div>Products</div>
                        </div>
                        <div class="col-4 text-right">
                            <i class="fas fa-box-open"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card stat-card bg-gradient-info">
                    <div class="row">
                        <div class="col-8">
                            <div class="stat-number">16</div>
                            <div>New Orders</div>
                        </div>
                        <div class="col-4 text-right">
                            <i class="fas fa-shopping-bag"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card stat-card bg-gradient-secondary">
                    <div class="row">
                        <div class="col-8">
                            <div class="stat-number">$2.4k</div>
                            <div>Revenue</div>
                        </div>
                        <div class="col-4 text-right">
                            <i class="fas fa-dollar-sign"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Quick Actions -->
        <div class="row mb-4 fade-in">
            <div class="col-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0"><i class="fas fa-bolt"></i> Quick Actions</h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-3 col-sm-6 mb-3 mb-md-0">
                                <a href="addToy.jsp" class="btn btn-light btn-block py-3">
                                    <i class="fas fa-plus text-success"></i> Add New Toy
                                </a>
                            </div>
                            <div class="col-md-3 col-sm-6 mb-3 mb-md-0">
                                <a href="inventory.jsp" class="btn btn-light btn-block py-3">
                                    <i class="fas fa-clipboard-list text-primary"></i> Manage Inventory
                                </a>
                            </div>
                            <div class="col-md-3 col-sm-6 mb-3 mb-sm-0">
                                <a href="processOrders.jsp" class="btn btn-light btn-block py-3">
                                    <i class="fas fa-shipping-fast text-info"></i> Process Orders
                                </a>
                            </div>
                            <div class="col-md-3 col-sm-6">
                                <button type="button" class="btn btn-light btn-block py-3" data-toggle="modal" data-target="#addAdminModal">
                                    <i class="fas fa-user-plus text-warning"></i> Add Admin
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Users Table -->
        <div class="row fade-in">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0"><i class="fas fa-users"></i> Users</h5>
                        <button class="btn btn-sm btn-outline-primary">View All</button>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Username</th>
                                    <th>Email</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    if (users != null && !users.isEmpty()) {
                                        int count = 0;
                                        for (User u : users) {
                                            if (count >= 5) break; // Show only 5 users for preview
                                %>
                                <tr>
                                    <td><%= u.getUsername() %></td>
                                    <td><%= u.getEmail() %></td>
                                    <td><span class="badge badge-success badge-status">Active</span></td>
                                    <td>
                                        <button class="btn btn-sm btn-icon btn-info"><i class="fas fa-edit"></i></button>
                                        <button class="btn btn-sm btn-icon btn-danger"><i class="fas fa-trash"></i></button>
                                    </td>
                                </tr>
                                <%
                                        count++;
                                    }
                                } else {
                                %>
                                <tr>
                                    <td colspan="4" class="text-center">No users found.</td>
                                </tr>
                                <%
                                    }
                                %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Admins Table -->
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0"><i class="fas fa-user-shield"></i> Administrators</h5>
                        <button class="btn btn-sm btn-outline-primary" data-toggle="modal" data-target="#addAdminModal">Add Admin</button>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Username</th>
                                    <th>Email</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    if (admins != null && !admins.isEmpty()) {
                                        for (User a : admins) {
                                %>
                                <tr>
                                    <td><%= a.getUsername() %></td>
                                    <td><%= a.getEmail() %></td>
                                    <td>
                                        <form action="DeleteAdminServlet" method="post" style="display:inline;">
                                            <input type="hidden" name="username" value="<%= a.getUsername() %>">
                                            <button type="submit" class="btn btn-sm btn-icon btn-danger" onclick="return confirm('Delete this admin?');"><i class="fas fa-trash"></i></button>
                                        </form>
                                    </td>
                                </tr>
                                <%
                                    }
                                } else {
                                %>
                                <tr>
                                    <td colspan="3" class="text-center">No admins found.</td>
                                </tr>
                                <%
                                    }
                                %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Recent Activity -->
        <div class="row mt-4 fade-in">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0"><i class="fas fa-history"></i> Recent Activity</h5>
                    </div>
                    <div class="card-body">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <div>
                                    <i class="fas fa-user-plus text-success mr-2"></i>
                                    New user registered
                                    <small class="text-muted d-block">John Doe - john@example.com</small>
                                </div>
                                <span class="text-muted">5 mins ago</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <div>
                                    <i class="fas fa-shopping-cart text-primary mr-2"></i>
                                    New order placed
                                    <small class="text-muted d-block">Order #12345 - $85.00</small>
                                </div>
                                <span class="text-muted">15 mins ago</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <div>
                                    <i class="fas fa-box text-warning mr-2"></i>
                                    Inventory updated
                                    <small class="text-muted d-block">Building Blocks - Stock: 35</small>
                                </div>
                                <span class="text-muted">1 hour ago</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <div>
                                    <i class="fas fa-comment text-info mr-2"></i>
                                    New customer review
                                    <small class="text-muted d-block">Dinosaur Toy - 5 stars</small>
                                </div>
                                <span class="text-muted">3 hours ago</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<!-- Add Admin Modal -->
<div class="modal fade" id="addAdminModal" tabindex="-1" role="dialog" aria-labelledby="addAdminModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addAdminModalLabel">Add New Administrator</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="AddAdminServlet" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" id="username" name="username" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Add Administrator</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.0/js/bootstrap.min.js"></script>

<script>
    // Toggle between tabs
    $(document).ready(function() {
        $('.nav-link').on('click', function() {
            $('.nav-link').removeClass('active');
            $(this).addClass('active');
        });
    });
</script>
</body>
</html>