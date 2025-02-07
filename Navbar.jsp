<%@ page language="java" import="java.io.*,java.sql.*,javax.servlet.*,javax.servlet.http.*" %>
<%
String name=null;
try {
    if (session == null || session.getAttribute("currentuser") == null) {
        response.sendRedirect("Home1.html");
    } else {
        int u_id = Integer.parseInt(session.getAttribute("currentuser").toString());
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinejob","root","");
            stmt = con.prepareStatement("SELECT name FROM users WHERE user_id=?");
            stmt.setInt(1, u_id);
            rs = stmt.executeQuery();
            if (rs.next()) {
                name = rs.getString("name").toString();
            }
        } catch(ClassNotFoundException cse){
          cse.printStackTrace();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }
  }catch (IOException e) {
      e.printStackTrace();
  }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Navbar with Login & Signup Modal</title>
    <link rel="shortcut icon" href="./Images/logo.svg" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        .hidden {
            display: none;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold" href="#">
            <img src="./Images/logo.svg" alt="Cariera" style="height: 30px;">
           
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link text-primary" href="Home.jsp">HOME</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-primary" href="About.jsp">About US</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-primary" href="/">Contact</a>
                </li>
                <!-- <li class="nav-item">
                    <a class="nav-link text-primary" href="/">Services</a>
                </li> -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-primary" href="#" id="servicesDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Services
                    </a>
                    <ul class="dropdown-menu fs-4 rounded" aria-labelledby="servicesDropdown">
                        <li><a class="dropdown-item   text-primary" href="AddJob.jsp">AddJOB</a></li>
                        <li><a class="dropdown-item   text-primary" href="Joblist.jsp">View Jobs</a></li>
                        <li><a class="dropdown-item   text-primary" href="ApplyJob.jsp">Apply for job</a></li>
                        <li><a class="dropdown-item   text-primary" href="Candidates.jsp">Candidates</a></li>
                    </ul>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link " href="#!" data-bs-toggle="modal" data-bs-target="#exampleModal" id="username"><i class="fa-solid fa-user"></i> <%=name %></a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="LogoutServlet"><i class="fa-solid fa-arrow-right-from-bracket"></i>    Logout</a>
                  </li>
            </ul>
        </div>
    </div>
</nav>

   <!-- Modal -->
   <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header  bg-primary text-white text-center">
          <h1 class="modal-title fs-5 "  id="exampleModalLabel">Profile</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body text-center">
            <img src="./Images/profile.jpg" alt="" ><br>
            <%=name%>
            
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary">Edit</button>
        </div>
      </div>
    </div>
  </div>

<!-- Correct Bootstrap JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-2R0iQxn0xNl6FJq5aPBK3PDQxvlZZCozNteYztU8rhlw5osQIqJjDqAxCm1jZ5pB" crossorigin="anonymous"></script>
</body>
</html>
