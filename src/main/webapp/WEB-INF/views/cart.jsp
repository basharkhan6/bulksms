<%-- 
    Document   : cart
    Created on : Mar 29, 2020, 12:07:33 AM
    Author     : Bashar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%--<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>--%>
<%--<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>--%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Cart | BulkSMS</title>
        <!-- styles -->
        <link rel="stylesheet" type="text/css" href="${contextPath}/webjars/font-awesome/5.12.0/css/all.min.css" />
        <link rel="stylesheet" type="text/css" href="${contextPath}/webjars/bootstrap/3.4.1/css/bootstrap.min.css" />
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
                                <c:if test="${sessionScope.cart != null}">
                                    <li class="active"><a href="${contextPath}/cart/index"><i class="fas fa-shopping-cart label label-success">${fn:length(sessionScope.cart)}</i></a></li>                                    
                                </c:if>
                                <li><a href="${contextPath}/registration"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                                <li><a href="${contextPath}/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                            </ul>
                        </div><!-- /.navbar-collapse -->
                    </div><!-- /.container-fluid -->
                </div>
            </nav>
        </header>


        <main class="pt-60">
            <div class="container">
                <div class="p-10 table-responsive">
                    <table class="table table-striped shade">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th width="120px">Price</th>
                                <th width="120px">Quantity</th>
                                <th width="120px">Total Cost</th>
                                <th width="200px">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="total" value="0"></c:set>
                            <c:forEach var="item" items="${sessionScope.cart}">
                                <c:set var="total"
				value="${total + item.pack.price*item.pack.sms*item.qty }"></c:set>
                            <tr class="item">
                                <td>
                                    <h4>${item.pack.pName}</h4>
                                    ${item.pack.packageType} <br>
                                    ${item.pack.validity}
                                </td>
                                <td class="price">${item.pack.price*item.pack.sms} Tk</td>
                                <td>
                                    <input type="text" value="${item.qty}" class="form-control text-center" style="width: 60px;">
                                    <a href="add/${item.pack.id}" class="btn btn-sm btn-warning">+</a>
                                    <a href="minus/${item.pack.id}" class="btn btn-sm btn-warning">-</a>
                                </td>
                                <td class="cost">${item.pack.price*item.pack.sms*item.qty} Tk</td>
                                <td>
                                    <a href="reset/${item.pack.id}" class="btn btn-sm btn-info"> <i class="glyphicon glyphicon-refresh"></i></a>
                                    <a href="delete/${item.pack.id}" class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-trash"></i></a>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                        <tfoot>
                            <tr class="info">
                                <td class="hidden-xs"></td>
                                <td class="hidden-xs"></td>
                                <td class="text-right">Sub Total:</td>
                                <td id="subTotal">${total} Tk</td>
                                <td class="hidden-xs"></td>
                            </tr>
                            <tr class="success">
                                <td class="hidden-xs"></td>
                                <td class="hidden-xs"></td>
                                <td class="text-right">Cupon: </td>
                                <td><input type="text" class="form-control" value="xyz" style="width: 80px;"></td>
                                <td><a href="#" class="btn btn-info">Apply</a></td>
                            </tr>
                            <tr class="info">
                                <td class="hidden-xs"></td>
                                <td class="hidden-xs"></td>
                                <td class="text-right">Discount:</td>
                                <td id="discount">0 Tk</td>
                                <td class="hidden-xs"></td>
                            </tr>
                            <tr class="info">
                                <td class="hidden-xs"></td>
                                <td class="hidden-xs"></td>
                                <td class="text-right"><strong>Total Amount:</strong></td>
                                <td><strong id="total">${total} Tk</strong></td>
                                <td class="hidden-xs"></td>
                            </tr>
                            <tr>
                                <td><a href="../" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
                                <td class="hidden-xs"></td>
                                <td class="hidden-xs"></td>
                                <td class="hidden-xs"></td>
                                <td><a href="#" class="btn btn-success btn-block">Checkout <i class="fa fa-angle-right"></i></a></td>
                            </tr>
                        </tfoot>
                    </table>
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
        <script src="${contextPath}/webjars/jquery/3.4.1/jquery.min.js"></script>
        <!--bootstrap after jquery-->
        <script src="${contextPath}/webjars/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <!--page specific js-->

        <!-- script end -->
    </body>
</html>