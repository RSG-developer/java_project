<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Uploaded Files</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div id="nav2">
        <%@ include file="Navbar.jsp" %>

    </div>
    <%
        String userRole=(String)session.getAttribute("role");
        //out.println(userRole);
        if (userRole==null || userRole.equals("Company")){
        %>
        
        <div class="alert alert-warning text-center" role="alert">
            Access not allowed to other Companies
           </div>
          
        <%
           
        }
        else {
        %>  
        <div class="text-center text-success font-awesome">
            <h2 class="mb-4 mt-1 py-4 ">Availables Jobs</h2>

        </div>
                        
        <div class="container mb-4">
            <%
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            String filename=null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinejob", "root", "");
                stmt = con.createStatement();
                rs = stmt.executeQuery("SELECT *FROM addjob");

                while (rs.next()) {
                    filename = rs.getString("image");
                    String email=rs.getString("email");
                    String post=rs.getString("post");
                    String date =rs.getString("date");
                    String fileExtension = filename.substring(filename.lastIndexOf(".") + 1).toLowerCase();
                    String name1=rs.getString("name");
                    String type=rs.getString("Type");
            %>
            <div class="container mb-5">
                <div class="card p-4 fs-4 shadow-lg">
                    <div class="d-flex align-items-center">
                        <img src="./Images/UpoladImages/<%=filename%>" alt="Company Logo" class="rounded-circle me-3" width="100">
                        <div class="flex-grow-1">
                            <h5 class="mb-3 fs-2"><%=name1%></h5>
                            <div class="text-muted big">
                                <i class="bi bi-geo-alt"></i> <%=post%> | <i class="bi bi-clock"></i><%=type%>
                                
                            </div>
                        </div>
                        <div>
                            <a class="btn btn-primary fs-5 me-2" href="JobDetails.jsp?id=<%=rs.getInt(1)%>">View</a>
                        </div>
                        <div>
                            <a class="btn btn-success fs-5" href="ApplyJob.jsp?cname=<%=rs.getString(2)%>">Apply Now</a>
                        </div>
                    </div>
                    <div class="mt-2 text-muted small">
                        <i class="bi bi-calendar text-primary me-2 fs-3"></i> <span class="fw-bold">Date Line: </span> <%=date%>
                    </div>
                </div>
            </div>
            </div>
            
            <%
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            } 
        }
            %>
        </div>
    

        
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>

    <script>new WOW().init();</script>
</body>
</html>
