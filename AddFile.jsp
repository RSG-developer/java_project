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
    <!-- <div class="container mt-5">
        <form action="UploadServlet" method="post" enctype="multipart/form-data" class="mb-4">
            <div class="mb-3">
                <label for="fname" class="form-label">Enter the name</label>
                <input type="text" name="fname" id="fname" class="form-control" required>
            </div>
            
            <div class="mb-3">
                <label for="photo" class="form-label">Upload file</label>
                <input type="file" name="photo" id="photo" class="form-control" required>
            </div>
            
            <button type="submit" class="btn btn-primary">Save</button>
        </form> -->
        <%@include file ="Navbar.jsp" %>
        <h2 class="mb-4">Candidates Details:</h2>

        <div class="row row-cols-1 row-cols-md-3 g-4">
            <%
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            String filename=null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinejob", "root", "");
                stmt = con.createStatement();
                rs = stmt.executeQuery("SELECT *FROM AddData");

                while (rs.next()) {
                    filename = rs.getString("filename");
                    String email=rs.getString("email");
                    String info1=rs.getString("data");
                    
                    String fileExtension = filename.substring(filename.lastIndexOf(".") + 1).toLowerCase();
                    String name1=rs.getString("name");
            %>
                <div class="col">
                    <div class="card shadow-sm">
                        <% if (fileExtension.equals("jpg") || fileExtension.equals("jpeg") || fileExtension.equals("png") || fileExtension.equals("gif")) { %>
                            <img src="./Images/UpoladImages/<%= filename %>" class="card-img-top" alt="Uploaded Image" height="200px" width="">
                        <% } else if (fileExtension.equals("pdf")) { %>
                            <iframe src="./Images/UpoladImages/<%= filename %>" width="100%" height="200px"></iframe>
                        <% } else { %>
                            <p class="p-3">Unsupported file type: <a href="./Images/UpoladImages/<%= filename %>" target="_blank"><%= filename %></a></p>
                        <% } %>

                        <div class="card-body">
                            <h5 class="card-title"><%=name%></h5>
                            <p class="card-text"><%= email %></p>
                            <p class="card-text"><%=info1%></p>
                            <a href="#" class="btn btn-primary">Hire Me</a>
                             <button class="btn btn-primary " onclick="download('<%=filename%>')">Download</button>
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
    <script>
        function download(filename){
            window.open('./Images/UpoladImages/'+filename);
        }
    </script>
</body>
</html>
