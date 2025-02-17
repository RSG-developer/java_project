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
        input::placeholder{
            font-size: larger;
            font-weight: bold;
            color: #555;
        }
    </style>
</head>
<body>
    <%@ include file="Navbar.jsp" %>
    <div class="text-center mt-5 text-success">
        <h4 class="mb-4 fw-bold ">Add job details</h4>
        <form action="UploadServlet" method="post" enctype="multipart/form-data" >
            <div class="row g-3 px-5 py-5">
                <div class="col-12 col-sm-6">
                    <input type="text" class="form-control" required placeholder="Company Name" name="fname">
                </div>
                <div class="col-12 col-sm-6">
                    <input type="email" class="form-control" required placeholder="Company Email" name="email">
                </div>
                <div class="col-12 col-sm-6">
                    <input type="text" class="form-control" required placeholder="Comapny  Website" name="website" >
                </div>
                <div class="col-12 col-sm-6">
                    <input type="file" class="form-control bg-white" name="filename">
                </div>
                
                <div class="col-12 col-sm-6">
                    <input type="date" class="form-control" name="date" placeholder="date">                
                </div>
                
                <div class="col-12 col-sm-6">
                    <input type="text" class="form-control" name="post" placeholder="Required for post">                
                </div>
                <div class="col-12 col-sm-6">
                    <input type="text" class="form-control" name="type" placeholder="Full Time/Inter/Part Time ">                
                </div>
                <div class="col-12">
                    <textarea class="form-control" rows="5" required placeholder="Description about Post" name="data"></textarea>
                </div>
                <div class="col-3 mx-auto p-2">
                    <button class="btn btn-success w-100" type="submit">Upload </button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>