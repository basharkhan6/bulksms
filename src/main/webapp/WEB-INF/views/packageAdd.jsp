<%-- 
    Document   : packageAdd
    Created on : Feb 26, 2020, 2:30:37 AM
    Author     : Bashar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%--<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>--%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Package | BulkSMS</title>
        <!-- styles -->
        <link rel="stylesheet" type="text/css" href="${contextPath}/webjars/font-awesome/5.12.0/css/all.min.css" />
        <link rel="stylesheet" type="text/css" href="${contextPath}/webjars/bootstrap/3.4.1/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="${contextPath}/webjars/datatables/1.10.20/css/jquery.dataTables.min.css" />
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
                                <li><a href="${contextPath}/">Home</a></li>
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
                                <li>
                                    <a href="${contextPath}/${urlRole}" class="btn">Dashboard </a> 
                                </li>
                                <!--in spring csrf logout implement on post with csrf token & header-->
                                <li>
                                    <form action="${contextPath}/logout" method="post" class="navbar-form">
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
                                <img src="${contextPath}/img/me.jpeg" class="img-circle" alt="Profile Pic" height="150px" width="150px">
                                <h4>${lastName}</h4>
                                <a href="#" class="btn btn-sm btn-info"><i class="glyphicon glyphicon-eye-open"></i> View</a>
                                <a href="#" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-pencil"></i> Edit</a>
                                <hr>
                            </div>
                            <div class="sidemenu">
                                <li class="submenu"><a href="#">Package</a>
                                    <ul class="menu">
                                        <li><a href="list">List All Package</a></li>
                                        <li class="active"><a href="add">Add New Package</a></li>
                                    </ul>
                                </li>
                                <li class="submenu"><a href="#">Order</a>
                                    <ul class="menu">
                                      <li><a href="newOrder.html">Add New Order</a></li>
                                      <li><a href="managePackage.html">Manage Order</a></li>
                                    </ul>
                                  </li>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-9">
                        <div class="mainArea">
                            <div class="title"><h1>Add Package</h1></div>
                            <div class="panel panel-primary">
                                <div class="panel-body">
                                    <form:form action="add" cssClass="form-horizontal" method="post" modelAttribute="pack">
                                        <!-- need to associate this data with package id -->
                                        <form:hidden path="id" />
                                        <div class="form-group">
                                            <label for="pName" class="col-md-3 control-label">Name:</label>
                                            <div class="col-md-9">
                                                <form:input path="pName" cssClass="form-control" required="required"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="price" class="col-md-3 control-label">Price:</label>
                                            <div class="col-md-9">
                                                <form:input path="price" cssClass="form-control" required="required" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="sms" class="col-md-3 control-label">Sms:</label>
                                            <div class="col-md-9">
                                                <form:input path="sms" cssClass="form-control" required="required" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="duration" class="col-md-3 control-label">Duration:</label>
                                            <div class="col-md-9">
                                                <form:input path="duration" cssClass="form-control" required="required" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="type" class="col-md-3 control-label">Type:</label>
                                            <div class="col-md-9">
                                                <form:select path="type" cssClass="form-control" required="required">
                                                    <form:option value="" label="--- Select ---" />
                                                    <form:options items="${types}" />
                                                </form:select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-md-offset-3 col-md-9">
                                                <button class="btn btn-primary">Submit</button>
                                                <a href="list" class="btn btn-warning">Cancel</a>
                                            </div>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <footer>
            <div class="container-fluid">
                <div class="col-sm-3">
                    <h4>WE ACCEPT</h4><hr>
                    <a href="#" title="Pay with bKash"><img src="${contextPath}/img/bKash.png" alt="bKash Payment" class="payMethodBox img-responsive"></a>
                    <a href="#" title="Pay with Rocket"><img src="${contextPath}/img/rocket.png" alt="Rocket Payment" class="payMethodBox img-responsive"></a>
                    <a href="#" title="Pay with Nagad"><img src="${contextPath}/img/nagad.png" alt="Nagad Payment" class="payMethodBox img-responsive"></a>
                    <a href="#" title="Cash on Delivery"><img src="${contextPath}/img/cash.png" alt="Cash Payment" class="payMethodBox img-responsive"></a>
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
        <script src="${contextPath}/webjars/jquery/3.4.1/jquery.min.js"></script>
        <!--bootstrap after jquery-->
        <script src="${contextPath}/webjars/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="${contextPath}/webjars/datatables/1.10.20/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="${contextPath}/webjars/datatables/1.10.20/js/dataTables.bootstrap.min.js"></script>

        <script type="text/javascript">
          $(document).ready(function() {
              $(".submenu").addClass("icn");
              $(".submenu .menu").hide();
              $(".sidemenu li.submenu").hover(function() {
                      $(this).children(".menu").toggle("slow");
                      $(this).toggleClass("icn");
              });
          });
        </script>
        <!-- script end -->
    </body>
</html>