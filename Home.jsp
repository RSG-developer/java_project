<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cariera</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/owl.carousel.min.css">
    <link rel="stylesheet" type="text/css" href="css/swiper.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/responsive.css">
</head>

<body>

    <%@include file="Navbar.jsp" %>

        <section class="main2">

            <!-- ===== Start of Swiper Slider ===== -->
            <div class="swiper-container">
                <div class="swiper-wrapper">

                    <!-- Start of Slide 1 -->
                    <div class="swiper-slide overlay-black"
                        style="background: url('Images/slider-img-1.jpg'); background-size: cover; background-position: 40% 40%;">

                        <!-- Start of Slider Content -->
                        <div class="slider-content container">

                            <div class="col-md-6 col-md-offset-6 col-xs-12 text-center">

                                <div class="section-title">
                                    <h2 class="text-white">your career start now!</h2>
                                </div>

                                <p class="text-white">Unlock Opportunities, Shape Your Future</p>

                            </div>

                        </div>
                        <!-- End of Slider Content -->

                    </div>
                    <!-- End of Slide 1 -->


                    <!-- Start of Slide 2 -->
                    <div class="swiper-slide overlay-black"
                        style="background: url('Images/image2.jpg'); background-size: cover; background-position: 50% 50%;">

                        <!-- Start of Slider Content -->
                        <div class="slider-content container">

                            <div class="col-md-6 col-xs-12 text-center">

                                <div class="section-title">
                                    <h2 class="text-white">your career start now!</h2>
                                </div>

                                <p class="text-white">Connecting Talent with opportunity</p>

                            </div>

                        </div>
                        <!-- End of Slider Content -->

                    </div>
                    <!-- End of Slide 2 -->

                </div>
                <!-- End of Swiper Wrapper -->

                <!-- Navigation Buttons -->
                <div class="swiper-button-prev"><i class="fa fa-angle-left"></i></div>
                <div class="swiper-button-next"><i class="fa fa-angle-right"></i></div>

            </div>
            <!-- ===== End of Swiper Slider ===== -->
        </section>
        
        <section>
            
            <div class="container-xxl py-5">
                <div class="container">
                    <h1 class="text-center mb-5 wow fadeInUp" data-wow-delay="0.1s">JOB Listing</h1>
                </div>
                <div class="container mb-4">
                    <div class="card p-5 fs-4 shadow-sm">
                        <div class="d-flex align-items-center">
                            <img src="./Images/img/com-logo-1.jpg" alt="Company Logo" class="rounded-circle me-3" width="100">
                            <div class="flex-grow-1">
                                <h5 class="mb-3 fs-2">Software Engineer</h5>
                                <div class="text-muted big">
                                    <i class="bi bi-geo-alt"></i> New York, USA |
                                    <i class="bi bi-clock"></i> Full Time 
                                    
                                </div>
                            </div>
                            <div>
                                <a class="btn btn-success fs-5" href="AddJob.jsp">Apply Now</a>
                            </div>
                        </div>
                        <div class="mt-2 text-muted small">
                            <i class="bi bi-calendar text-primary me-2 fs-3"></i> <span class="fw-bold">Date Line: </span> 01 Jan, 2045
                        </div>
                    </div>
                </div>
            </div>
            <%@include file="Joblist.jsp" %>
        </section>
       
        
        <script src="js/jquery-3.1.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-select.min.js"></script>
        <script src="js/swiper.min.js"></script>
        <script src="js/jquery.ajaxchimp.js"></script>
        <script src="js/jquery.countTo.js"></script>
        <script src="js/jquery.inview.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/jquery.easypiechart.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/tinymce/tinymce.min.js"></script>
        <script src="js/countdown.js"></script>
        <script src="js/isotope.min.js"></script>
        <script src="js/custom.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>
        <script>new WOW().init();</script>

</body>

</html>