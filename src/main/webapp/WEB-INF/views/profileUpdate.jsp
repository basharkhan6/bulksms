<%-- 
    Document   : profileUpdate
    Created on : Mar 1, 2020, 7:12:11 PM
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
        <title>Profile | BulkSMS</title>
        <!-- styles -->
        <link rel="stylesheet" type="text/css" href="${contextPath}/webjars/font-awesome/5.12.0/css/all.min.css" />
        <link rel="stylesheet" type="text/css" href="${contextPath}/webjars/bootstrap/3.4.1/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="${contextPath}/webjars/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" />
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
                                    <a href="${contextPath}/dashboard" class="btn">Dashboard </a>
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
                                <a href="${contextPath}/profile/view" class="btn btn-sm btn-info"><i class="glyphicon glyphicon-eye-open"></i> View</a>
                                <a href="${contextPath}/profile/update" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-pencil"></i> Update</a>
                                <hr>
                            </div>
                            <div class="sidemenu">
                                <li class="submenu"><a href="#">Package</a>
                                    <ul class="menu">
                                        <li><a href="${contextPath}/${role}/package/list">List All Package</a></li>
                                        <li><a href="${contextPath}/${role}/package/add">Add New Package</a></li>
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
                            <div class="title"><h1>Update Profile</h1></div>
                            <c:if test="${em != null}">
                              <div class="alert alert-danger alert-dismissible fade in">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                ${em}
                              </div>
                            </c:if>
                            <c:if test="${sm != null}">
                              <div class="alert alert-success alert-dismissible fade in">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                ${sm}
                              </div>
                            </c:if>
                            <div class="row">
                                <div class="col-sm-4" style="border-right: 1px solid gray">
                                    <img src="${contextPath}/img/me.jpeg" class="img-thumbnail img-responsive" alt="Profile Pic">
                                    <br><br>
                                    <form action="${contextPath}/profile/updatePicture" cssClass="form-horizontal" method="POST" enctype="multipart/form-data">
                                        <input type="file" name="imgUrl" class="form-control"/>
                                        <input type="submit" value="Upload Image" class="btn btn-primary" />
                                    </form>
                                </div>
                                <div class="col-sm-8">
                                    <form:form action="${contextPath}/profile/update" cssClass="form-horizontal" method="POST" modelAttribute="userForm">
                                        <!-- need to associate this data with user id -->
                                        <form:hidden path="id" />
                                        <form:errors path="id"></form:errors>
                                        <c:if test="${role == 'admin'}">
                                        <div class="form-group">
                                            <label for="locked" class="col-md-3 control-label">Locked:</label>
                                            <div class="col-md-9">
                                                <form:select path="locked" cssClass="form-control" required="required">
                                                    <form:option value="true" label="LOCKED" />
                                                    <form:option value="false" label="UNLOCKED" />
                                                </form:select>
                                            </div>
                                        </div>                                            
                                        </c:if>
                                        <div class="form-group ${status.error ? 'has-error' : ''}"">
                                            <label for="email" class="col-md-3 control-label">Email:</label>
                                            <div class="col-md-9">
                                                <form:input path="email" type="email" cssClass="form-control" required="required" readonly="true"/>
                                                <form:errors path="email"></form:errors>
                                            </div>
                                        </div>
                                        <div class="form-group ${status.error ? 'has-error' : ''}">
                                            <label for="firstName" class="col-md-3 control-label">First Name:</label>
                                            <div class="col-md-9">
                                                <form:input path="firstName" type="text" cssClass="form-control" required="required" />
                                                <form:errors path="firstName"></form:errors>
                                            </div>
                                        </div>
                                        <div class="form-group ${status.error ? 'has-error' : ''}">
                                            <label for="lastName" class="col-md-3 control-label">Last Name:</label>
                                            <div class="col-md-9">
                                                <form:input path="lastName" type="text" cssClass="form-control" required="required" />
                                                <form:errors path="lastName"></form:errors>
                                            </div>
                                        </div>
                                        <div class="form-group ${status.error ? 'has-error' : ''}">
                                            <label for="address" class="col-md-3 control-label">Address:</label>
                                            <div class="col-md-9">
                                                <form:textarea path="address" rows="2" cols="20" cssClass="form-control" />
                                                <form:errors path="address"></form:errors>
                                            </div>
                                        </div>
                                        <div class="form-group ${status.error ? 'has-error' : ''}">
                                            <label for="nid" class="col-md-3 control-label">NID:</label>
                                            <div class="col-md-9">
                                                <form:input path="nid" type="text" cssClass="form-control" />
                                                <form:errors path="nid"></form:errors>
                                            </div>
                                        </div>
                                        <div class="form-group ${status.error ? 'has-error' : ''}">
                                            <label for="dob" class="col-md-3 control-label">Date of Birth:</label>
                                            <div class="col-md-9">
                                                <form:input path="dob" type="text" cssClass="form-control datepicker" />
                                                <form:errors path="dob"></form:errors>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-offset-3 col-md-9">
                                                <button type="submit" class="btn btn-primary">Update</button>
                                                <a href="${contextPath}/dashboard" class="btn btn-warning">Cancel</a>
                                            </div>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                            <hr>
                            <h2>Change Password</h2>
                            <form action="${contextPath}/profile/updatePassword" method="POST" class="form-inline" >
                                <div class="form-group row">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <input type="hidden" name="userEmail" value="${userForm.email}" />
                                    <input type="password" name="password" class="form-control" placeholder="Enter Password" required/>
                                    <input type="password" name="passwordConfirm" class="form-control" placeholder="Repeat Password" required/>
                                    <input type="submit" value="Change Password" class="btn btn-primary" />
                                </div>
                            </form>
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
        <script src="${contextPath}/webjars/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
        
        <script src="${contextPath}/js/loader.js"></script>
        <!-- script end -->
    </body>
</html>