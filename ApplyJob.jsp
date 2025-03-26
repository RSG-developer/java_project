<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        .form-control::placeholder{
            font-weight: bold;
            color: #555;
            
        }
    </style>
</head>
<body>
    <%@ include file="Navbar.jsp" %>
    <%
        String cname=request.getParameter("cname");
    %>
    <div class="text-center mt-4 text-success">
        <h4 class="fw-bold ">Apply for jobs</h4>

    </div>
    <div class=" mt-5 text-success">
        
        <form action="ApplyServlet" method="post" enctype="multipart/form-data" >
            <div class="row g-3 px-5 py-5">
                <div class="col-12 col-sm-6">
                    <input type="text" class="form-control"  placeholder="Candidate Full Name" name="fname">
                </div>
                <div class="col-12 col-sm-6">
                    <input type="email" class="form-control"  placeholder="Candidate Email" name="email">
                </div>
                <div class="col-12 col-sm-6">
                    <input type="text" class="form-control"  placeholder="Qualification " name="qual" >
                </div>
                
                <div class="col-12 col-sm-6">
                    <input type="text" class="form-control" name="exper" placeholder="Working Experience">                </div>
                <div class="col-12 col-sm-6">
                    <input type="text" class="form-control" name="location" id="" placeholder="location">
                </div>
                <div class="col-12 col-sm-6">
                    <input type="text" class="form-control" name="phone" id="" placeholder="phone number">
                </div>
                <div class="col-12 col-sm-6">
                    <input type="text" class="form-control" name="skill" id="" placeholder="Skills">
                </div>
                <div class="col-12 col-sm-6 text-black">
                   
                    <select id="disabledSelect" name="comname" class="form-select">
                        <option>Select Company</option>
                        <option value="<%=cname%>"><%=cname%></option>
                      </select>
                </div>
                <div class="col-12 text-black fw-bold" >
                    <label for="">Upload photo</label>
                    <input type="file" class="form-control" name="photo" id="">
                </div>
                <div class="col-12 text-black fw-bold" >
                    <label for="">Upload Resume</label>
                    <input type="file" class="form-control" name="resume" id="">
                </div>
                <div class="col-3 mx-auto p-2">
                    <button class="btn btn-success w-100" type="submit">Apply</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>