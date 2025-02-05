<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    
</head>
<body>
    <div class="">
        <h4 class="mb-4">Apply For The Job</h4>
        <form action="UploadServlet" method="post" enctype="multipart/form-data">
            <div class="row g-3">
                <div class="col-12 col-sm-6">
                    <input type="text" class="form-control" placeholder="Your Name" name="fname">
                </div>
                <div class="col-12 col-sm-6">
                    <input type="email" class="form-control" placeholder="Your Email" name="email">
                </div>
                <div class="col-12 col-sm-6">
                    <input type="text" class="form-control" placeholder="Portfolio Website" name="website">
                </div>
                <div class="col-12 col-sm-6">
                    <input type="file" class="form-control bg-white" name="filename">
                </div>
                <div class="col-12">
                    <textarea class="form-control" rows="5" placeholder="Coverletter" name="data"></textarea>
                </div>
                <div class="col-12">
                    <button class="btn btn-primary w-100" type="submit">Apply Now</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>