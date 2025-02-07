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
    
        

        <div class="text-center text-success font-awesome">
            <h2 class="mb-4 mt-1 py-4 ">List Of Candidates</h2>

        </div>
       
        <div class="container mb-4">
            <div class="row g-2">
                <div class="col-md-10">
                    <div class="input-group g-2 ">
                        <input type="text" class="form-control me-2" placeholder="Keywords">
                       
                        <input type="text" class="form-control" placeholder="Location">
                    </div>
                </div>
                <div class="col-md-2">
                    <button class="btn btn-primary w-100">
                        <i class="fa fa-search"></i> SEARCH
                    </button>
                </div>
            </div>
        </div>
                        
        <div class="container mb-4">
            <%
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
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
                    resume =rs.getString("resume");
                    String fileExtension = photo.substring(photo.lastIndexOf(".") + 1).toLowerCase();
                    String name1=rs.getString("name");
                    String skill=rs.getString("skill");
            %>
            <div class="container mb-5">
                <div class="card p-4 fs-4 shadow-lg">
                    <div class="d-flex align-items-center">
                        <img src="./Images/UpoladImages/<%=photo%>" alt="Company Logo" class="rounded-circle me-3" width="100">
                        <div class="flex-grow-1">
                            <h5 class="mb-3 fs-2"><%=name1%></h5>
                            <div class="text-muted big">
                                <i class="bi bi-geo-alt"></i> <%=info1%> |
                                <i class="bi bi-clock"></i> <%=skill%>
                                
                            </div>
                        </div>
                        <div class="me-2">
                            <a class="btn btn-success fs-5 " href="">Hire</a>
                        </div>
                        <div>
                            <a class="btn btn-success fs-5 " href="./Images/UpoladImages/<%=resume%>">Download</a>
                        </div>
                    </div>
                    <div class="mt-2 text-muted small">
                    </div>
                </div>
            </div>
            </div>
            
            <%
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            } 
            %>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
</body>
</html>
