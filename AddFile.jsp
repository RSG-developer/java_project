<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Uploaded Files</title>
</head>
<body>
    <form action="UploadServlet" method="post" enctype="multipart/form-data">
        <label for="fname">Enter the name</label>
        <input type="text" name="fname" id="fname" required>
        
        <label for="photo">Upload file</label>
        <input type="file" name="photo" id="photo" required>
        
        <input type="submit" value="Save">
    </form>

    <h2>Uploaded Files:</h2>
    <div>
        <%
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinejob", "root", "");
            stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT filename FROM Upload");

            while (rs.next()) {
                String filename = rs.getString("filename");
        %>
                <img src="./Images/UpoladImages/<%= filename %>" alt="Uploaded Image" height="200px">
        <%
            }
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        } 
        
        %>
    </div>
</body>
</html>
