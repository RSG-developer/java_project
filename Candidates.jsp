<%@ page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Uploaded Files</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    
</head>
<body>
        <div id="nav3">
            <%@ include file="Navbar.jsp"%>

        </div>
        <%
            String userRole=(String)session.getAttribute("role");
            //out.println(userRole);
            if (userRole==null || !userRole.equals("Company")){
                //out.println("<h1> Access not allowed to Candidates</h1>");
        %>
        
        <div class="alert alert-warning text-center" role="alert">
           Access not allowed to Candidates
          </div>
        
        <%        
            }
            else {
        %>  

        <div class="text-center text-success font-awesome ">
            <h2 class="mb-4 mt-1 py-4 ">List Of Candidates</h2>

        </div>       
        <div class="container mb-4 me-3">
           
            <form action="SearchServlet" method="post" id="search">
            <div class="row g-2">
                <div class="col-md-2">
                    
                    <a class="btn btn-primary w-100 fs-5" href="Candidates.jsp">Back</a>
                </div>
                <div class="col-md-5">
                    <div class="input-group g-2 ">
                        <input type="text" class="form-control me-2" placeholder="search by first name" name="candidate">
                       
                    </div>
                </div>
                <div class="col-md-2">
                    <button class="btn btn-primary w-100">
                        <i class="fa fa-search"></i> SEARCH
                    </button>
                </div>
                </div>
            </form>
            </div>
            
        </div>
                        
        <div id="list1">
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
                <div class="container mb-5" >
                    <div class="card p-4 fs-4 shadow-lg">
                        <div class="d-flex align-items-center">
                            <img src="./Images/UpoladImages/<%=photo%>" alt="" class="rounded-circle me-3" width="100">
                            <div class="flex-grow-1">
                                <h5 class="mb-3 fs-2"><%=name1%></h5>
                                <div class="text-muted big">
                                    <%=info1%> |
                                   <%=skill%>
                                    
                                </div>
                            </div>
                            <div class="me-2">
                                <a class="btn btn-primary fs-5 " href="CandidateDetails.jsp?name=<%=name1%>">Details</a>
                            </div>
                            <div>
                                <a class="btn btn-success fs-5 " href="./Images/UpoladImages/<%=resume%>" target="_blank">Resume</a>
                            </div>
                        </div>
                        <div class="mt-2 text-muted small">
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
        </div>
        
        </div>

        <div id="searchResults">
            <%
            // Retrieve the attribute and cast it to a List
            List<String[]> candidateList = (List<String[]>) request.getAttribute("candidateList");
        
            if (candidateList != null && !candidateList.isEmpty()) {
        %>
                
        <%
                // Iterate over the list and print each row in a table
                for (String[] candidate : candidateList) {
        %>
        <div class="container mb-5" id="">
            <div class="card p-4 fs-4 shadow-lg">
                <div class="d-flex align-items-center">
                    <img src="./Images/UpoladImages/<%=candidate[4]%>" alt="" class="rounded-circle me-3" width="100">
                    <div class="flex-grow-1">
                        <h5 class="mb-3 fs-2"><%=candidate[0]%></h5>
                        <div class="text-muted big">
                            <i class="bi bi-geo-alt"></i> <%=candidate[2]%> |
                            <i class="bi bi-clock"></i> <%=candidate[3]%>
                            
                        </div>
                    </div>
                    <div class="me-2">
                        <a class="btn btn-primary fs-5 " href="CandidateDetails.jsp?name=<%=candidate[0]%>">Details</a>
                    </div>
                    <div>
                        <a class="btn btn-success fs-5 " href="./Images/UpoladImages/<%=candidate[5]%>">Resume</a>
                    </div>
                </div>
                <div class="mt-2 text-muted small">
                </div>
            </div>
        </div>
        </div>
       
       
        <%
                }
            } 

        %>
        </div>
        

    <script>
        window.onload = function() {
            var searchResults = document.getElementById("searchResults");
            var list1 = document.getElementById("list1");

           
            if (searchResults && searchResults.innerHTML.trim().length > 0) {
                list1.style.display = "none";
            }
        };
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
</body>
</html>
