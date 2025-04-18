<%@ page import="java.sql.*,java.util.*" %>
<%
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;
    String query=request.getParameter("query");
    if(session==null|| session.getAttribute("currentuser")==null){  %>
        <script>
            alert("Please login first");
            window.location.href = "Home1.html";
        </script>
<%        
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">


<head>
    <meta charset="utf-8" />
    <title>Admin Panel</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
    <meta content="Coderthemes" name="author" />

    <!-- App favicon -->
    <link rel="shortcut icon" href="./Images/logo.svg" hidden>

        
    <!-- Vendor css -->
    <link href="assets/css/vendor.min.css" rel="stylesheet" type="text/css" />

    <!-- App css -->
    <link href="assets/css/app.min.css" rel="stylesheet" type="text/css" id="app-style" />

    <!-- Icons css -->
    <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />

    
    <script src="assets/js/config.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    
</head>

<body>
    <!-- Begin page -->
    <div class="wrapper">

        
        <!-- Sidenav Menu Start -->
        <div class="sidenav-menu">

            <!-- Brand Logo -->
            <a href="Admin.jsp" class="logo">
                <span class="logo-light">
                    <span class="logo-lg"><img src="./Images/logo-white.svg" alt="logo"></span>
                    <!-- <span class="logo-sm"><img src="assets/images/logo-sm.png" alt="small logo"></span> -->
                </span>
            </a>

            <!-- Sidebar Hover Menu Toggle Button -->
            <button class="button-sm-hover">
                <i class="ti ti-circle align-middle"></i>
            </button>

            <!-- Full Sidebar Menu Close Button -->
            <button class="button-close-fullsidebar">
                <i class="ti ti-x align-middle"></i>
            </button>

            <div data-simplebar>

                <!--- Sidenav Menu -->
                <ul class="side-nav">
                    
                    <li class="side-nav-item">
                        <a  href="/JobPortal/Admin.jsp"  class="side-nav-link">
                            <span class="menu-icon"><i data-lucide="airplay"></i></span>
                            <span class="menu-text"> Dashboard </span>
                            
                        </a>
                    </li>
                    <li class="side-nav-title">Apps</li>
                    <li class="side-nav-item">
                        <a href="Admin.jsp?query=companies" class="side-nav-link">
                            <span class="menu-icon"><i data-lucide="life-buoy"></i></span>
                            <span class="menu-text"> Companies</span>
                            
                        </a>
                    </li>

                    
                    <li class="side-nav-item">
                        <a href="Admin.jsp?query=students" class="side-nav-link">
                            <span class="menu-icon"><i data-lucide="life-buoy"></i></span>
                            <span class="menu-text"> Students </span>
                            
                        </a>
                    </li>
                   
                </ul>
                
                <div class="clearfix"></div>
            </div>
        </div>
        <!-- Sidenav Menu End -->

        <!-- Topbar Start -->
        <header class="app-topbar">
            <div class="page-container topbar-menu">
                <div class="d-flex align-items-center gap-1">

                    
                    
                    
                    <!-- Sidebar Menu Toggle Button -->
                    <button class="sidenav-toggle-button px-2">
                        <i data-lucide="menu" class="font-22"></i>
                    </button>

                    <!-- Horizontal Menu Toggle Button -->
                    <button class="topnav-toggle-button px-2" data-bs-toggle="collapse" data-bs-target="#topnav-menu-content">
                        <i data-lucide="menu" class="font-22"></i>
                    </button>

                    <form class="app-search d-none d-sm-flex align-items-center" >
                        <div class="app-search-box">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search...">
                                <div class="input-group-append">
                                    <button class="btn btn-icon" type="submit">
                                        <i data-lucide="search" class="font-16"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>

                    <!-- Mega Menu Dropdown -->
                    <div class="topbar-item d-none d-md-flex">
                        <div class="dropdown">
                                                    </div> <!-- .dropdown-->
                    </div> <!-- end topbar-item -->
                </div>

                <div class="d-flex align-items-center gap-1">
                    <!-- User Dropdown -->
                    <div class="topbar-item nav-user">
                        <div class="dropdown">
                            <a class="topbar-link dropdown-toggle drop-arrow-none px-0" data-bs-toggle="dropdown" data-bs-offset="0,19" type="button" aria-haspopup="false" aria-expanded="false">
                                <img src="./Images/profile.jpg" width="35" class="rounded-circle me-lg-2 d-flex" alt="user-image">
                                <!-- <span class="d-lg-flex flex-column gap-1 d-none">
                                    <i class="mdi mdi-account-circle-outline me-1 font-30 align-middle"></i>
                                </span> -->
                                   

                                <!-- <i data-lucide="chevron-down" class="d-none d-sm-flex" height="12"></i> -->
                            </a>
                            <div class="dropdown-menu dropdown-menu-end">
                                <!-- item-->
                                <div class="dropdown-header noti-title">
                                    <h6 class="text-overflow m-0">Welcome !</h6>
                                </div>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item">
                                    <i class="mdi mdi-account-circle-outline me-1 font-17 align-middle"></i>
                                    <span class="align-middle">My Account</span>
                                </a>

                                
                                
                                <!-- <a href="javascript:void(0);" class="dropdown-item">
                                    <i class="mdi mdi-cog-outline me-1 font-17 align-middle"></i>
                                    <span class="align-middle">Settings</span>
                                </a> -->

                                

                                <div class="dropdown-divider"></div>
                                <!-- item-->
                                <a href="LogoutServlet" class="dropdown-item active fw-semibold text-danger">
                                    <i class="mdi mdi-logout me-1 font-17 align-middle"></i>
                                    <span class="align-middle">Sign Out</span>
                                </a>
                            </div>
                        </div>
                    </div>

                    
                </div>
            </div>
        </header>
        <!-- Topbar End -->

        <div class="page-content">

            <div class="page-container">

                <div class="card page-title-box rounded-0">
                    <div class="d-flex align-items-sm-center flex-sm-row flex-column gap-2">
                        <div class="flex-grow-1">
                            <h4 class="font-18 fw-semibold mb-0">Dashboard</h4>
                        </div>

                        <div class="text-end">
                            <ol class="breadcrumb m-0 py-0">
                                <li class="breadcrumb-item"><a href="javascript: void(0);">Admin</a></li>
                                
                                <li class="breadcrumb-item"><a href="javascript: void(0);">Dashboard</a></li>
                                
                                <li class="breadcrumb-item active">Dashboard</li>
                            </ol>
                        </div>
                    </div>
                </div>
                
                

                <%
                    if("students".equals(query)){
                %>

                <div class="row">
                    <div class="col-xl-6 col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="header-title">Recent Candidates</h4>
                                <p class="card-subtitle">
                                   List Recent Candidates
                                </p>
                            </div>
                            <div class="card-body pt-2">
                                <div class="table-responsive">
                                    <table class="table table-hover m-0 table-actions-bar">

                                        <thead>
                                            <tr>
                                                <th>
                                                    <div class="btn-group dropdown">
                                                        <button type="button" class="btn btn-light btn-xs dropdown-toggle waves-effect waves-light drop-arrow-none" data-bs-toggle="dropdown" aria-expanded="false"> <i class="mdi mdi-chevron-down"></i></button>
                                                        
                                                    </div>
                                                </th>
                                                <th>Name</th>
                                                <th>Location</th>
                                                <th>Experience</th>
                                                <th>Email</th>
                                                <th>Skill</th>
                                                <th>Company</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <%
                                        String photo=null;
                                        String resume=null;
                                        try {
                                            Class.forName("com.mysql.cj.jdbc.Driver");
                                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinejob", "root", "");
                                            stmt = con.createStatement();
                                            rs = stmt.executeQuery("SELECT *FROM applyjob");
                            
                                            while (rs.next()) {
                                                photo = rs.getString("photo");
                                                String email=rs.getString("email");
                                                String info1=rs.getString("experience");
                                                String Location=rs.getString("location");
                                                String Candidatename=rs.getString("name");
                                                String skill=rs.getString("skill");
                                        %>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <img src="./Images/UpoladImages/<%=photo%>" alt="contact-img" title="contact-img" class="rounded-circle avatar-sm" />
                                                </td>

                                                <td>
                                                    <h5 class="m-0 fw-medium"><%=Candidatename%></h5>
                                                </td>

                                                <td>
                                                    <i class="mdi mdi-map-marker text-primary"></i> <%=Location%>
                                                </td>

                                                <td>
                                                    <i class=" text-success"></i> <%=info1%>
                                                </td>

                                                <td>
                                                    <i class="text-warning"></i> <%=email%>
                                                </td>
                                                <td>
                                                    <i class="text-warning"></i> <%=skill%>
                                                </td>
                                                <td><%=rs.getString(11)%></td>
                                                <td>
                                                    <a href="#" class="table-action-btn"><i class="mdi mdi-pencil"></i></a>
                                                    <a href="#" class="table-action-btn"><i class="mdi mdi-close"></i></a>
                                                </td>
                                            </tr>

                                            

                                        </tbody>
                                        <%
                                             }
                                        }catch(Exception e){
                                            out.println("Error"+e.getMessage());
                                        } 
                                        %>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- end col -->
                   <%
                        }
                        else if("companies".equals(query)){
                            String alertMsg=(String) session.getAttribute("msg");
                            String alerttype=(String) session.getAttribute("alerttype");
                            if(alertMsg!=null || alerttype!=null){
                   %>     
                    
                   <div class="container mt-3 " id="alertBox">
                    <div class="alert alert-success alert-dismissible fade show ms-auto" role="alert" style="max-width:250px">
                         <%=alertMsg%>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <% 
                        session.removeAttribute("alertMessage"); 
                        session.removeAttribute("alertType");
                        }
                    %>
                
                <script>
                    
                    setTimeout(function() {
                        let alertBox = document.getElementById("alertBox");
                        if (alertBox) {
                            alertBox.style.display = "none";
                        }
                    }, 5000);
                </script>        
                </div>
                <div>
                    <form action="UploadServlet" method="post" enctype="multipart/form-data" >
                        <div class="row g-3 px-5 py-5">
                            <div class="col-12 col-sm-6">
                                <label for="">Company name</label>
                                <input type="text" class="form-control" required placeholder="Company Name" name="fname">
                            </div>
                            <div class="col-12 col-sm-6">
                                <label for="">Company email</label>
                                <input type="email" class="form-control" required placeholder="Company Email" name="email">
                            </div>
                            <div class="col-12 col-sm-6">
                                <label for="">Company website</label>
                                <input type="text" class="form-control" required placeholder="Comapny  Website" name="website" >
                            </div>
                            <div class="col-12 col-sm-6">
                                <label for="">Upload Company logo </label>
                                <input type="file" class="form-control bg-white" name="filename">
                            </div>
                            
                            <div class="col-12 col-sm-6">
                                <label for="">Last date to enroll</label>
                                <input type="date" class="form-control" name="date" placeholder="date">                
                            </div>
                            
                            <div class="col-12 col-sm-6">
                                <label for="">Post Available</label>
                                <input type="text" class="form-control" name="post" placeholder="Required for post">                
                            </div>
                            <div class="col-12 col-sm-6">
                                <label for="">Type of Job </label>
                                <input type="text" class="form-control" name="type" placeholder="Full Time/Inter/Part Time ">                
                            </div>
                            <div class="col-12">
                                <label for="">Description about the post</label>
                                <textarea class="form-control" rows="5" required placeholder="Description about Post" name="data"></textarea>
                            </div>
                            <div class="col-3 mx-auto p-2">
                                <button class="btn btn-success w-100" type="submit">Upload </button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="row">
                    <div class="col-xl-6 col-lg-12">
                        <div class="card">
                            <div class="card-header" style="display: flex;gap: 500px;" >
                                <div>
                                <h4 class="header-title">Recent Companies</h4>
                                <p class="card-subtitle">
                                    List Of recently added Companies
                                </p>
                                </div>
                                <div>
                                    <button type="button" id="downloadBtn" class="btn btn-success">Genearte report</button>
                                </div>
                            </div>
                            <div class="card-body pt-2">
                                <div class="table-responsive">
                                    <table class="table table-hover m-0 table-actions-bar" id="myTable">

                                        <thead>
                                            <tr>
                                                <th>
                                                    <div class="btn-group dropdown">
                                                        <button type="button" class="btn btn-light btn-xs dropdown-toggle waves-effect waves-light drop-arrow-none" data-bs-toggle="dropdown" aria-expanded="false"> <i class="mdi mdi-chevron-down"></i></button>
                                                        
                                                    </div>
                                                </th>
                                                <th>Name</th>
                                                <th>Website</th>
                                                <th>Type</th>
                                                <th>Email</th>
                                                <th>Post</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <%
                                        
                                        
                                        try {
                                            Class.forName("com.mysql.cj.jdbc.Driver");
                                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinejob", "root", "");
                                            stmt = con.createStatement();
                                            rs = stmt.executeQuery("SELECT *FROM addjob;");
                            
                                            while (rs.next()) {
                                                String photo = rs.getString("image");
                                                String email=rs.getString("email");
                                                String website=rs.getString("website");
                                                String type=rs.getString("type");
                                                String compname=rs.getString("name");
                                                String post=rs.getString("post");
                                        %>
                                        <tbody>
                                            <tr id="row_<%=rs.getInt(1)%>">
                                                <td>
                                                    <img src="./Images/UpoladImages/<%=photo%>" alt="contact-img" title="contact-img" class="rounded-circle avatar-sm" />
                                                </td>

                                                <td>
                                                    <h5 class="m-0 fw-medium"><%=compname%></h5>
                                                </td>

                                                <td>
                                                    <i class=" text-primary"></i><%=website%>
                                                </td>

                                                <td>
                                                    <i class=" text-success"></i> <%=type%>
                                                </td>

                                                <td>
                                                    <i class="text-warning"></i> <%=email%>
                                                </td>
                                                <td>
                                                    <i class="text-warning"></i> <%=post%>
                                                </td>

                                                <td>
                                                    <a href="#" class="table-action-btn"><i class="mdi mdi-pencil"></i></a>
                                                    <a href="javascript:deleteRecord(<%= rs.getInt(1) %>)"  class="table-action-btn"><i class="mdi mdi-close"></i></a>
                                                </td>
                                            </tr>

                                            

                                        </tbody>
                                        <%
                                             }
                                        }catch(Exception e){
                                            out.println("Error"+e.getMessage());
                                        } 
                                        %>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- end col -->
                    </div>
                <!--- end row -->
                <%
                    }
                    else{
                        out.println("\n"); %>
                        <div style="display: flex;flex-wrap: wrap;gap:300px ;">
                        <div id="dashboard" style="height: 500px;max-width: 450px;">
                            <canvas id="dashboardChart"></canvas>
                        </div>
                        <div id="dasboard1" style="height: 500px;max-width: 450px;">
                            <canvas id="doughnutchart"></canvas>
                        </div>
                        </div>
                        <script>
                        var ctx = document.getElementById('dashboardChart').getContext('2d');
                        var ctx1 = document.getElementById('doughnutchart').getContext('2d');
                        var myChart = new Chart(ctx, {
                        type: 'pie',
                        data: {
                        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May'],
                        datasets: [{
                        label: 'Students Registered',
                        data: [12, 19, 3, 5, 2],
                        backgroundColor: ['blue','red','green','cyan','orange']
                        }]
                     }
                    });
                        var myChart = new Chart(ctx1, {
                        type: 'doughnut',
                        data: {
                        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May'],
                        datasets: [{
                        label: 'Students Registered',
                        data: [12, 19, 3, 5, 2],
                        backgroundColor: ['blue','red','green','cyan','orange']
                        }]
                     }
                    });

                    
                </script>
                    <%    
                    }
                %>        
            </div> <!-- container -->

            <!-- Footer Start -->
            <footer class="footer">
                <div class="page-container">
                    <div class="row">
                        <div class="col-md-6 text-center text-md-start">
                            <script>document.write(new Date().getFullYear())</script> © Cariera - By <span class="fw-bold text-decoration-underline text-uppercase text-reset font-12"></span>
                        </div>
                        <div class="col-md-6">
                            <div class="text-md-end footer-links d-none d-md-block">
                                <a href="javascript: void(0);">About</a>
                                
                                <a href="javascript: void(0);">Contact Us</a>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
            <!-- end Footer -->

        </div>
      </div>  

    
    
   
    <script src="assets/js/vendor.min.js"></script>

    
    <script src="assets/js/app.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function deleteRecord(id) {
            if (confirm("Are you sure you want to delete this record?")) {
                $.ajax({
                    url: 'DeleteServlet',
                    type: 'POST',
                    data: { studentId: id },
                    success: function(response) {
                        if (response.trim() === "success") {
                            $("#row_" + id).remove();
                            alert("Record deleted successfully");
                        } else {
                            alert("Failed to delete record!");
                        }
                    }
                });
            }
        }
    </script>
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.31/jspdf.plugin.autotable.min.js"></script>

  <script>
    document.getElementById("downloadBtn").addEventListener("click", function () {
        const { jsPDF } = window.jspdf;
        let doc = new jsPDF();

        let table = document.getElementById("myTable");
        let data = [];
        let headers = [];

        
        table.querySelectorAll("tr").forEach((row, index) => {
            let rowData = [];
            let cells = row.querySelectorAll("th, td");

          
            cells.forEach((cell, cellIndex) => {
            if (cellIndex < cells.length - 1) { 
            rowData.push(cell.innerText);
            }
            });

            if (index === 0) {
                headers = rowData; 
            } else {
                data.push(rowData); 
            }
        });

        doc.autoTable({
            head: [headers],
            body: data
        });

        doc.save("Report.pdf");
    });
</script>


    

    

</body>
</html>