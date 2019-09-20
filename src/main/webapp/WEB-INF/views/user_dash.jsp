<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
            <h1>Twoje książki</h1>
            <c:if test="${empty books}">
                <p class="lead">Niestety nie masz jeszcze dodanych książek.</p>
                <p><a class="btn btn-lg btn-success" href="http://localhost:8080/books/addBook" role="button">Dodaj pierwszą książę</a></p>
            </c:if>
        </div>

        <!-- Example row of columns -->
        <div class="card-columns" id="userBooks">
                <div class="col-sm-6">
            <c:forEach items="${books}" var="book">

                <div class="card" style="width: 18rem;">
                    <img class="card-img-top" src="/resources/images/${book.image}" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">${book.title}</h5>
                        <p class="card-text">${fn:substring(book.description,0,50)}...</p>
                        <a href="/books/details/${book.id}" class="btn btn-primary">View details »</a>
                    </div>
                </div>

            </c:forEach>

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

