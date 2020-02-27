<%-- 
    Document   : index
    Created on : Jan 19, 2020, 7:26:02 PM
    Author     : Bashar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>BulkSMS</title>
        <!-- styles -->
        <link rel="stylesheet" type="text/css" href="webjars/font-awesome/5.12.0/css/all.min.css" />
        <link rel="stylesheet" type="text/css" href="webjars/bootstrap/3.4.1/css/bootstrap.min.css" />
            <!--main/custom css after bootstrap-->
        <link href="${contextPath}/css/main.css" rel="stylesheet" />
        <!-- style end -->
    </head>
    <body>
        <header>
            <nav>
                <div class="navbar navbar-default navbar-fixed-top">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <a href="${contextPath}/" class="navbar-brand">BulkSMS</a>
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar" style="color: black;">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>
                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse" id="navbar">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="index">Home</a></li>
                                <li class="dropdown">
                                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Services<span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Masking SMS</a></li>
                                        <li><a href="#">Non-Masking SMS</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">Price</a></li>
                                <li><a href="#">About Us</a></li>
                                <li><a href="#">Contact</a></li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="${contextPath}/registration"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                                <li><a href="${contextPath}/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                            </ul>
                        </div><!-- /.navbar-collapse -->
                    </div><!-- /.container-fluid -->
                </div>
            </nav>
        </header>

        <main>
            <section class="front pt-60">
                <div class="container">
                    <div class="col-sm-6" style="padding-bottom: 20px">
                        <h1>বাংলাদেশের সেরা রেট ২০ পয়সা!</h1>
                        <p>ব্যবসার দ্রুত এবং সবচাইতে সাশ্রয়ী প্রচারে BulkSMS এর SMS সার্ভিস আপনাকে এনে দিবে সর্বোচ্চ সাফল্য!</p>
                        <a href="" class="btn btn-lg btn-success regBtn">Register Yourself</a>
                    </div>
                    <div class="col-sm-6">
                        <img src="img/front-bg.png" alt="front image" class="img-responsive">
                    </div>
                </div>
            </section>

            <section class="feature">
                <div class="container text-center">
                    <h2><u>Why Choose Us</u></h2>
                    <div class="col-sm-3">
                        <img src="img/feature-1.png" alt="">
                        <h4>Cheap SMS Rates</h4>
                        <p>We Provide Lowest Rate.</p>
                    </div>
                    <div class="col-sm-3">
                        <img src="img/feature-2.png" alt="">
                        <h4>24/7 Support</h4>
                        <p>We are ensure service 24 hours.</p>
                    </div>
                    <div class="col-sm-3">
                        <img src="img/feature-4.png" alt="">
                        <h4>Two-way SMS</h4>
                        <p>You Can Send & Receive SMS.</p>
                    </div>
                    <div class="col-sm-3">
                        <img src="img/feature-3.png" alt="">
                        <h4>SMPP Connection</h4>
                        <p>Direct Connect operator via SMPP.</p>
                    </div>
                </div>
            </section>

            <section class="benefit">
                <div class="container">
                    <div class="col-sm-6">
                        <img src="img/promotional-sms.png" alt="" class="img-responsive">
                    </div>
                    <div class="col-sm-6">
                        <h2>Benefits of SMS Marketing:</h2>
                        <ul class="list-unstyled">
                            <li>✓ SMS marketing will generate more new clients</li>
                            <li>✓ More Business will be originated from existing clients</li>
                            <li>✓ Gross profit margin must be Improved</li>
                            <li>✓ Extremely cost effective</li>
                            <li>✓ No or little waste</li>
                            <li>✓ Immediate delivery</li>
                            <li>✓ Economical</li>
                            <li>✓ Professional Impact on customers</li>
                            <li>✓ 21st century marketing</li>
                        </ul>
                        <a href="#" class="btn btn-lg btn-success">Signup Now</a>
                    </div>
                </div>
            </section>

            <section class="price">
                <div class="container">
                    <h2 class="text-center"><u>Popular Package</u></h2>
                    <div class="row">
                        <div class="col-sm-3">
                            <div class="package">
                                <div class="persms">
                                    <sup>BDT</sup> <span>0.35</span><sub>/sms</sub>
                                    <div class="type">NON-MASKING</div>
                                </div>
                                <hr>
                                <strong>Validity: </strong>One Year <hr>
                                <strong>Quantity: </strong>1,000 SMS <hr>
                                <del><strong>Price: </strong>BDT 400 Tk </del><br>
                                <strong>New Price: </strong>BDT 350 Tk <hr>
                                <a href="#" class="btn btn-success">Buy Now</a>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="package">
                                <div class="persms">
                                    <sup>BDT</sup> <span>0.35</span><sub>/sms</sub>
                                    <div class="type">NON-MASKING</div>
                                </div>
                                <hr>
                                <strong>Validity: </strong>One Year <hr>
                                <strong>Quantity: </strong>1,000 SMS <hr>
                                <del><strong>Price: </strong>BDT 400 Tk </del><br>
                                <strong>New Price: </strong>BDT 350 Tk <hr>
                                <a href="#" class="btn btn-success">Buy Now</a>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="package">
                                <div class="persms">
                                    <sup>BDT</sup> <span>0.35</span><sub>/sms</sub>
                                    <div class="type">NON-MASKING</div>
                                </div>
                                <hr>
                                <strong>Validity: </strong>One Year <hr>
                                <strong>Quantity: </strong>1,000 SMS <hr>
                                <del><strong>Price: </strong>BDT 400 Tk </del><br>
                                <strong>New Price: </strong>BDT 350 Tk <hr>
                                <a href="#" class="btn btn-success">Buy Now</a>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="package">
                                <div class="persms">
                                    <sup>BDT</sup> <span>0.35</span><sub>/sms</sub>
                                    <div class="type">NON-MASKING</div>
                                </div>
                                <hr>
                                <strong>Validity: </strong>One Year <hr>
                                <strong>Quantity: </strong>1,000 SMS <hr>
                                <del><strong>Price: </strong>BDT 400 Tk </del><br>
                                <strong>New Price: </strong>BDT 350 Tk <hr>
                                <a href="#" class="btn btn-success">Buy Now</a>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-3">
                            <div class="package">
                                <div class="persms">
                                    <sup>BDT</sup> <span>0.35</span><sub>/sms</sub>
                                    <div class="type">MASKING</div>
                                </div>
                                <hr>
                                <strong>Validity: </strong>One Year <hr>
                                <strong>Quantity: </strong>1,000 SMS <hr>
                                <del><strong>Price: </strong>BDT 400 Tk </del><br>
                                <strong>New Price: </strong>BDT 350 Tk <hr>
                                <a href="#" class="btn btn-success">Buy Now</a>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="package">
                                <div class="persms">
                                    <sup>BDT</sup> <span>0.35</span><sub>/sms</sub>
                                    <div class="type">MASKING</div>
                                </div>
                                <hr>
                                <strong>Validity: </strong>One Year <hr>
                                <strong>Quantity: </strong>1,000 SMS <hr>
                                <del><strong>Price: </strong>BDT 400 Tk </del><br>
                                <strong>New Price: </strong>BDT 350 Tk <hr>
                                <a href="#" class="btn btn-success">Buy Now</a>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="package">
                                <div class="persms">
                                    <sup>BDT</sup> <span>0.35</span><sub>/sms</sub>
                                    <div class="type">MASKING</div>
                                </div>
                                <hr>
                                <strong>Validity: </strong>One Year <hr>
                                <strong>Quantity: </strong>1,000 SMS <hr>
                                <del><strong>Price: </strong>BDT 400 Tk </del><br>
                                <strong>New Price: </strong>BDT 350 Tk <hr>
                                <a href="#" class="btn btn-success">Buy Now</a>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="package">
                                <div class="persms">
                                    <sup>BDT</sup> <span>0.35</span><sub>/sms</sub>
                                    <div class="type">MASKING</div>
                                </div>
                                <hr>
                                <strong>Validity: </strong>One Year <hr>
                                <strong>Quantity: </strong>1,000 SMS <hr>
                                <del><strong>Price: </strong>BDT 400 Tk </del><br>
                                <strong>New Price: </strong>BDT 350 Tk <hr>
                                <a href="#" class="btn btn-success">Buy Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="testimonial">
                <div class="container text-center">
                    <h2><u>What our customers say</u></h2>
                    <div id="myCarousel" class="carousel slide text-center" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                            <li data-target="#myCarousel" data-slide-to="2"></li>
                        </ol>
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                            <div class="item active">
                                <h4>"This company is the best. I am so happy with the result!"<br><span style="font-style:normal;">Michael Roe, Vice President, Comment Box</span></h4>
                            </div>
                            <div class="item">
                                <h4>"One word... WOW!!"<br><span style="font-style:normal;">Md Someone, DIU</span></h4>
                            </div>
                            <div class="item">
                                <h4>"Could I... BE any more happy with this company?"<br><span style="font-style:normal;">Chandler Bing, Actor, FriendsAlot</span></h4>
                            </div>
                        </div>
                        <!-- Left and right controls -->
                        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
            </section>
        </main>


        <footer>
            <div class="container-fluid">
                <div class="col-sm-3">
                    <h4>WE ACCEPT</h4><hr>
                    <a href="#" title="Pay with bKash"><img src="img/bKash.png" alt="bKash Payment" class="payMethodBox img-responsive"></a>
                    <a href="#" title="Pay with Rocket"><img src="img/rocket.png" alt="Rocket Payment" class="payMethodBox img-responsive"></a>
                    <a href="#" title="Pay with Nagad"><img src="img/nagad.png" alt="Nagad Payment" class="payMethodBox img-responsive"></a>
                    <a href="#" title="Cash on Delivery"><img src="img/cash.png" alt="Cash Payment" class="payMethodBox img-responsive"></a>
                </div>
                <div class="col-sm-3">
                    <h4>QUICK LINKS</h4><hr>
                    <ul class="list-unstyled">
                        <li><a href="#"><i class="glyphicon glyphicon-circle-arrow-right"></i> Home</a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-circle-arrow-right"></i> Services</a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-circle-arrow-right"></i> Price</a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-circle-arrow-right"></i> API</a></li>
                    </ul>
                </div>
                <div class="col-sm-3">
                    <h4>BulkSMS</h4><hr>
                    <address class="glyphicon glyphicon-map-marker">
                        DF Tower(Level-7A), House: 11  Road: 14, Dhanmondi, Dhaka- 1209.
                    </address>
                    <div class="glyphicon glyphicon-earphone"> 01713493159</div><br>
                    <div class="glyphicon glyphicon-envelope"> contact@skill.jobs</div>
                </div>
                <div class="col-sm-3">
                    <h4>GET IN TOUCH WITH US</h4><hr>
                    <a href="#" title="Connect in Facebook"><i class="fab fa-facebook-f social"></i></a>
                    <a href="#" title="Follow on Twitter"><i class="fab fa-twitter social"></i></a>
                    <a href="#" title="Subscribe in Youtube"><i class="fab fa-youtube social"></i></a>
                    <a href="#" title="See Us on Pinterest"><i class="fab fa-pinterest social"></i></a>
                    <a href="#" title="Follow in Linkedin"><i class="fab fa-linkedin-in social"></i></a>
                </div>
            </div>
            <div class="container-fluid text-center" style="background-color: #333; padding: 20px 0px; margin-top: 20px;">
                DESIGN AND DEVELOPED BY: <a href="https://abulbasar.me">Abul Basar</a>
            </div>
        </footer>

        <!-- script -->
        <script src="webjars/jquery/3.4.1/jquery.min.js"></script>
            <!--bootstrap after jquery-->
        <script src="webjars/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <!-- script end -->
    </body>
</html>