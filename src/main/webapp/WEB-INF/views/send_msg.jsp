<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Book Crossing</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/justified-nav.css"/>">


</head>
<body>

<div class="container">

    <div class="masthead">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="/home"><img src="/resources/images/icon.png" width="40" height="40"/>Book Crossing</a>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">

                <sec:authorize access="isAuthenticated()">

                    <jsp:include page="navbar.jsp" />

                </sec:authorize>

            </div>
        </nav>
    </div>


    <sec:authorize access="isAuthenticated()">

        <!-- Jumbotron -->
            <div class="jumbotron">
                <h3>Send message</h3>
                <div class="container">
                    <div class="row">
                        <div class="col">
                        </div>
                        <div class="col-6">
                            <form:form action="/messages/send/${sender.id}/${receiver.id}" method="post" modelAttribute="msg">
                                <div class="form-group">
                                    <label>From:</label>
                                    <input type="text" class="form-control" readonly value="${receiver.email}">
                                </div>
                                <div class="form-group">
                                    <label>To:</label>
                                    <input type="text" class="form-control" readonly value="${sender.email}">
                                </div>
                                <div class="form-group">
                                    <label>Subject:</label>
                                    <form:input class="form-control" path="title"/>
                                </div>
                                <div class="form-group">
                                    <label>Message:</label>
                                    <form:textarea class="form-control" path="messageBody"/>
                                </div>
                                <div class="form-group">
                                    <input type="submit" value="Wyślij" class="btn btn-md btn-success">
                                </div>
                            </form:form>
                        </div>
                        <div class="col">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </sec:authorize>

    <!-- Site footer -->
    <footer class="footer">
        <p>© Company 2017</p>
    </footer>

</div> <!-- /container -->

<script
        src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>