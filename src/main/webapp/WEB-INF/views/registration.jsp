<%-- 
    Document   : registration
    Created on : Jan 20, 2020, 5:05:01 PM
    Author     : Bashar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%--<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>--%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Registration | BulkSMS</title>
        <!-- styles -->
        <link rel="stylesheet" type="text/css" href="webjars/font-awesome/5.12.0/css/all.min.css" />
        <link rel="stylesheet" type="text/css" href="webjars/bootstrap/3.4.1/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="webjars/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" />
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
                                <li><a href="index.html">Home</a></li>
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
                                <li class="active"><a href="${contextPath}/registration"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                                <li><a href="${contextPath}/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                            </ul>
                        </div><!-- /.navbar-collapse -->
                    </div><!-- /.container-fluid -->
                </div>
            </nav>
        </header>

        <main>
            <div class="container pt-60">
                <form:form method="POST" modelAttribute="userForm" class="form-signin well col-sm-4 col-sm-offset-4">
                    <div class="form-heading text-center">
                        <h2>Create Account</h2>
                    </div>
                    <hr>
                    <spring:bind path="email">
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="email" path="email" class="form-control" placeholder="Email" autofocus="true" required="required"></form:input>
                        <form:errors path="email"></form:errors>
                        </div>
                    </spring:bind>
                    <spring:bind path="password">
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="password" path="password" class="form-control" placeholder="Password" required="required"></form:input>
                        <form:errors path="password"></form:errors>
                        </div>
                    </spring:bind>
                    <spring:bind path="passwordConfirm">
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="password" path="passwordConfirm" class="form-control" placeholder="Confirm your password" required="required"></form:input>
                        <form:errors path="passwordConfirm"></form:errors>
                        </div>
                    </spring:bind>
                    <spring:bind path="profile.firstName">
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input path="profile.firstName" type="text" cssClass="form-control" placeholder="First Name" required="required" />
                        <form:errors path="profile.firstName"></form:errors>
                        </div>
                    </spring:bind>
                    <spring:bind path="profile.lastName">
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input path="profile.lastName" type="text" cssClass="form-control" placeholder="Last Name" required="required" />
                        <form:errors path="profile.lastName"></form:errors>
                        </div>
                    </spring:bind>
                    <spring:bind path="profile.dob">
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input path="profile.dob" type="text" cssClass="form-control datepicker" placeholder="Date of Birth" />
                        <form:errors path="profile.dob"></form:errors>
                        </div>
                    </spring:bind>
                    <spring:bind path="profile.gender">
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:select path="profile.gender" cssClass="form-control" placeholder="Gender" required="required">
                            <form:option value="" label="--- Select ---" />
                            <form:options items="${genderEnum}" />
                        </form:select>
                        </div>
                    </spring:bind>
                    <spring:bind path="profile.nid">
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input path="profile.nid" type="text" cssClass="form-control" placeholder="NID No" required="required" />
                        <form:errors path="profile.nid"></form:errors>
                        </div>
                    </spring:bind>
                    <spring:bind path="profile.companyName">
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input path="profile.companyName" type="text" cssClass="form-control" placeholder="Company Name" required="required"/>
                        <form:errors path="profile.companyName"></form:errors>
                        </div>
                    </spring:bind>
                    <spring:bind path="profile.address1">
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:textarea path="profile.address1" rows="2" cols="20" cssClass="form-control" placeholder="Address 1" required="required" />
                        <form:errors path="profile.address1"></form:errors>
                        </div>
                    </spring:bind>
                    <spring:bind path="profile.address2">
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:textarea path="profile.address2" rows="2" cols="20" cssClass="form-control" placeholder="Adddress 2 (Optional)"/>
                        <form:errors path="profile.address2"></form:errors>
                        </div>
                    </spring:bind>
                    <spring:bind path="profile.city">
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input path="profile.city" type="text" cssClass="form-control" placeholder="City" required="required" />
                        <form:errors path="profile.city"></form:errors>
                        </div>
                    </spring:bind>
                    <spring:bind path="profile.region">
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input path="profile.region" type="text" cssClass="form-control" placeholder="State/Region" required="required" />
                        <form:errors path="profile.region"></form:errors>
                        </div>
                    </spring:bind>
                    <spring:bind path="profile.zip">
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input path="profile.zip" type="text" cssClass="form-control" placeholder="Zip Code" required="required" />
                        <form:errors path="profile.zip"></form:errors>
                        </div>
                    </spring:bind>
                    <spring:bind path="profile.country">
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:select path="profile.country" cssClass="form-control" placeholder="Country" required="required">
                            <form:option value="" label="--- Select ---" />
                            <form:options items="${countryEnum}" />
                        </form:select>
                        </div>
                    </spring:bind>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Create</button>
                    <h4 class="text-center"><a href="login">Login</a></h4>
                </form:form>
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
        <script src="webjars/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
        <!--page specific js-->
        <script>
            $('.datepicker').datepicker({
                format: 'yyyy-mm-dd',
                endDate: '0d',
                todayHighlight: true
            });
        </script>
        <!-- script end -->
    </body>
</html>