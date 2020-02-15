<%-- 
    Document   : dashboard
    Created on : Feb 9, 2020, 2:57:16 PM
    Author     : Bashar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
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
                        <!--in spring csrf logout implement on post with csrf token & header-->
                                <li>
                                <c:url var="logoutUrl" value="/logout"/>
                                <form action="${logoutUrl}" method="post" class="navbar-form">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <div class="form-group">
                                        <input type="submit" class="btn btn-danger" value="Logout" />
                                    </div>
                                </form>
                                </li>
                            </ul>
                        </div><!-- /.navbar-collapse -->
                    </div><!-- /.container-fluid -->
                </div>
            </nav>
        </header>


        <main style="padding-top: 80px; padding-bottom: 20px; background-color: #e6e6e6;">
          <div class="container">
            <div class="row">
              <div class="col-sm-3">
                <div class="sidebar">
                  <div class="profile text-center">
                    <img src="img/me.jpeg" class="img-circle" alt="Profile Pic" height="150px" width="150px">
                    <h4>${lastName}</h4>
                    <a href="#" class="btn btn-sm btn-info"><i class="glyphicon glyphicon-eye-open"></i> View</a>
                    <a href="#" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-pencil"></i> Edit</a>
                    <hr>
                  </div>
                  <ul>
                    <li><a href="dashboard"><button>Dashboard</button></a></li>
                    <li onclick="clk(this)"><button type="button" name="button">Package</button>
                      <div class="subside" id="subside">
                        <ul>
                          <li><a href="newPackage">Add New Package</a></li>
                          <li><a href="managePackage">Manage Package</a></li>
                        </ul>
                      </div>
                    </li>
                    <li onclick="clk(this)"><button type="button" name="button">Order</button>
                      <div class="subside" id="subside">
                        <ul>
                          <li><a href="newOrder">New Order</a></li>
                          <li><a href="manageOrder">Manage Order</a></li>
                        </ul>
                      </div>
                    </li>
                  </ul>
                </div>
              </div>

              <div class="col-sm-9">
                <div class="mainArea">
                  <div class="title"><h1>Dashboard</h1></div>
                  <p>Welcome, <strong>${lastName}</strong>(Admin).
                  <br>You can see <strong>Notice, Report, etc...</strong> here
                  <br>Find more option from <strong>Sidebar</strong>.</p>
                </div>
              </div>
            </div>
          </div>
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
        <script type="text/javascript">
            function clk(element) {
              var subside = element.querySelector("#subside");
              subside.classList.toggle("show");
            }
        </script>
        <!-- script end -->
    </body>
</html>