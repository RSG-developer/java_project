<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cariera - Job portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/bootstrap.min.css">    
</head>
<body>
    <%@ include file="Navbar.jsp"%>
    <section class="ptb80" id="contact">
        <div class="container">
            <div class="row">

                <div class="col-md-6 col-xs-12">
                    <p>Provide a seamless platform for job seekers to find opportunities and employers to recruit the right candidates.Offer an intuitive, user-friendly interface for easy navigation.</p>
                    <p>Feel Free to Contact us</p>
                    <!-- Start of Contact Form -->
                    <form id="contact-form" class="mt30">

                        <!-- contact result -->
                        <div id="contact-result"></div>
                        <!-- end of contact result --> 

                        <!-- Form Group -->
                        <div class="form-group">
                            <input class="form-control input-box" type="text" name="name" placeholder="Your Name" autocomplete="off">
                        </div>

                        <!-- Form Group -->
                        <div class="form-group">
                            <input class="form-control input-box" type="email" name="email" placeholder="your-email@cariera.com" autocomplete="off">
                        </div>

                        <!-- Form Group -->
                        <div class="form-group">
                            <input class="form-control input-box" type="tel" name="phone" placeholder="Phone Number" autocomplete="off">
                        </div>

                        <!-- Form Group -->
                        <div class="form-group">
                            <input class="form-control input-box" type="text" name="subject" placeholder="Subject" autocomplete="off">
                        </div>

                        <!-- Form Group -->
                        <div class="form-group mb20">
                            <textarea class="form-control textarea-box" rows="8" name="message" placeholder="Type your message..."></textarea>
                        </div>

                        <!-- Form Group -->
                        <div class="form-group text-center">
                            <button class="btn btn-blue btn-effect" type="submit">Send message</button>
                        </div>
                    </form>
                    <!-- End of Contact Form -->
                    <script src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
                    <script>
                        // Initialize EmailJS with your public key
                        (function() {
                            emailjs.init("Gl_BHUx1DufEu00q8"); // Replace with your EmailJS Public Key
                        })();
                    
                        // Form submission handler
                        document.getElementById("contact-form").addEventListener("submit", function(event) {
                            event.preventDefault(); // Prevent default form submission
                    
                            // Collect form data
                            const formData = {
                                name: document.querySelector('input[name="name"]').value,
                                email: document.querySelector('input[name="email"]').value,
                                phone: document.querySelector('input[name="phone"]').value,
                                subject: document.querySelector('input[name="subject"]').value,
                                message: document.querySelector('textarea[name="message"]').value,
                            };
                    
                            // Send email using EmailJS
                            emailjs.send("service_2tpijcb", "template_k05ojuq", formData)
                            .then(function(response) {
                                console.log("Email sent successfully!", response);
                                alert("Email sent successfully!");
                                document.getElementById("contact-result").innerHTML = '<p style="color: green;">Message sent successfully!</p>';
                                document.getElementById("contact-form").reset(); // Reset form after submission
                            })
                            .catch(function(error) {
                                console.log("Failed to send email", error);
                                document.getElementById("contact-result").innerHTML = '<p style="color: red;">Failed to send message. Please try again.</p>';
                            });
                        });
                    </script>
                    
                </div>

                <!-- Start of Google Map -->
                <div class="col-md-6 col-xs-12 gmaps">
                    
                        <div class="col-md-12 wow fadeInUp" data-wow-delay="0.1s">
                            <iframe class="position-relative rounded w-100 h-100"
                                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2202.7743425718077!2d73.83811387183668!3d18.45499107118075!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc29534bf615555%3A0x19062bb90d45a17c!2sPUNE%20CAMBRIDGE%20INSTITUTE%20OF%20MANAGEMENT%20AND%20COMPUTER%20APPLICATIONS!5e1!3m2!1sen!2sin!4v1739806831874!5m2!1sen!2sin"
                                frameborder="0" style="min-height: 400px; border:0;" allowfullscreen="" aria-hidden="false"
                                tabindex="0"></iframe>
                        </div>
                    
                </div>
                <!-- End of Google Map -->

            </div>
        </div>
    </section>
    
    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script> -->

</body>
</html>