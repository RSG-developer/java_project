<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cariera | Online job Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
   
   
</head>
<body>
    <%@ include file="Navbar.jsp" %>

    
        <div class="container mt-4 w-100 " id="candidate-profile">
            <%
                String sname =request.getParameter("name");
                
                Connection con = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;
                String photo=null;
                String resume=null;
                
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinejob", "root", "");
                    String query = "SELECT * FROM applyjob WHERE name = ?";
                    stmt = con.prepareStatement(query);
                    stmt.setString(1,sname);
                    rs=stmt.executeQuery();
                    while (rs.next()) {
                        photo = rs.getString("photo");
                        String email=rs.getString("email");
                        String phone=rs.getString("phone");
                        resume =rs.getString("resume");
                        String fileExtension = photo.substring(photo.lastIndexOf(".") + 1).toLowerCase();
                        String name1=rs.getString("name");
                        String skill=rs.getString("skill");
                        String place =rs.getString("location");
                %>
            
            <div class="row shadow-lg mb-3 candidate-profile">

                <!-- Start of Profile Picture -->
                <div class="col-md-3 col-xs-12">
                    <div class="profile-photo mt-4 ">
                        <img src="Images/UpoladImages/<%=photo%>" class="img-thumbnail" alt="">
                    </div>

                </div>
                <!-- End of Profile Picture -->

                <!-- Start of Profile Description -->
                <div class="col-md-9 col-xs-12">
                    <div class="profile-descr">

                       
                        <div class="profile-title">
                            <h2 class="capitalize"><%=name1%></h2>
                            <h5 class="pt10"><%=skill%></h5>
                        </div>

                       
                        <div class="profile-details mt20">
                            <p><%=skill%> use HTML, CSS, and JavaScript to code the website and web app designs created by web designers. The code they write runs inside the browser (as opposed to a back end developer, whose code runs on the web server). 
                                Being also in charge of making sure that there are no errors or bugs on the front end, 
                                as well as making sure that the design appears as its supposed to across various 
                                platforms and browsers.And I have experience of <%=rs.getString("experience")%></p>
                        </div>

                        <ul class="profile-info mt20 nopadding">
                            <li>
                                <i class="fa fa-map-marker"></i>
                                <span><%=place%></span>
                            </li>

                            <li>
                                <i class="fa fa-globe"></i>
                                <a href="#">cariera.com</a>
                            </li>
                             <li>
                                <i class="fa fa-phone"></i>
                                <span><%=phone%></span>
                            </li>

                            <li>
                                <i class="fa fa-envelope"></i>
                                <a href="#"><span ><%=email%></span></a>
                            </li>
                        </ul>

                    </div>
                </div>
                <!-- End of Profile Description -->

            </div>
            <!-- End of Row -->
            <% }
            
            }catch(Exception e){
                out.println(e);
            }
            
            %>

           
        </div>
    


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>