<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="container">
                            <table class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th>Received messages</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${received}" var="msg">
                                    <tr>
                                        <td data-toggle="collapse" data-target="#message${msg.message.id}">
                                            <a class="nav-link">From: ${msg.sender.email} | Title: ${msg.message.title}</a>
                                        </td>
                                    </tr>
                                    <tr id="message${msg.message.id}" class="collapse">
                                        <td>
                                                ${msg.message.messageBody}
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col">
                        <div class="container">
                            <table class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th>Sent messages</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${sent}" var="msg">
                                    <tr>
                                        <td data-toggle="collapse" data-target="#message${msg.message.id}">
                                            <a class="nav-link">From: ${msg.sender.email} | Title: ${msg.message.title}</a>
                                        </td>
                                    </tr>
                                    <tr id="message${msg.message.id}" class="collapse">
                                        <td>
                                                ${msg.message.messageBody}
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
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