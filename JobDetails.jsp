<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cariera | Online job Portal</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/owl.carousel.min.css">
    <link rel="stylesheet" type="text/css" href="css/swiper.min.css">
    
    <link rel="stylesheet" type="text/css" href="css/responsive.css">    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

   
</head>
<body>
    <%@ include file="Navbar.jsp" %>

    
        <div class="container mt-4 w-100 " id="candidate-profile">
            <%
                String id =request.getParameter("id");
                Connection con = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;
                String photo=null;
                
                
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinejob", "root", "");
                    String query = "SELECT * FROM addjob WHERE id = ?";
                    stmt = con.prepareStatement(query);
                    stmt.setInt(1, Integer.parseInt(id));
                    rs=stmt.executeQuery();
                    while (rs.next()) {
                        photo = rs.getString("image");
                        String email=rs.getString("email");
                        String website=rs.getString("website");
                        String description =rs.getString("decription");
                        String name1=rs.getString("name");
                        String post =rs.getString("post");
                        String date=rs.getString("date");
                       
                %>
            
            <div class="row shadow-lg mb-3 candidate-profile">

                <!-- Start of Profile Picture -->
                <div class="col-md-3 col-xs-12">
                    <div class="profile-photo ">
                        <img src="Images/UpoladImages/<%=photo%>" class="img-responsive" alt="">
                    </div>

                </div>
                <!-- End of Profile Picture -->

                <!-- Start of Profile Description -->
                <div class="col-md-9 col-xs-12">
                    <div class="profile-descr">

                       
                        <div class="profile-title">
                            <h2 class="capitalize"><%=name1%></h2>
                            <h5 class="pt10 fs-4">Requirement : <%=post%></h5>
                        </div>

                       
                        <div class="profile-details mt20">
                            <p><%=description%></p>
                            <p>Apply before :<%=date%> </p>
                        </div>

                        <ul class="profile-info mt20 nopadding">
                            <li>
                                <i class="fa fa-map-marker"></i>
                                <span>Pune</span>
                            </li>

                            <li>
                                <i class="fa fa-globe"></i>
                                <a href="#"><%=website%></a>
                            </li>
                             <!-- <li>
                                <i class="fa fa-phone"></i>
                                <span></span>
                            </li> -->

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
    
        <%@ include file="Footer.html"%>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>