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
        <c:if test="${not empty message}">
            <div class="alert alert-success">
                    ${message}
            </div>
        </c:if>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="/"><img src="/resources/images/icon.png" width="40" height="40"/> Book Crossing</a>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">


                <sec:authorize access="isAnonymous()">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                        </li>
                    </ul>
                    <form class="form-inline my-2 my-lg-0" method="post">
                        <input class="form-control mr-sm-2" name="email" type="text" placeholder="e-mail" aria-label="e-mail">
                        <input class="form-control mr-sm-2" name="password" type="password" placeholder="password" aria-label="password">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <button class="btn btn-outline-success my-2 my-sm-0" formaction="<c:url value="/"/>" type="submit">Sign in</button>
                        <button class="btn btn-outline-success my-2 my-sm-0" formaction="<c:url value="/api/users"/>" type="submit">Register</button>
                    </form>
                </sec:authorize>
            </div>
        </nav>
    </div>

    <sec:authorize access="isAnonymous()">
        <!-- Jumbotron -->
        <div class="jumbotron">
            <h1>Marketing stuff!</h1>
            <p class="lead">Cras justo odio, dapibus ac facilisis in, egestas eget quam. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet.</p>
            <p><a class="btn btn-lg btn-success" href="#" role="button">Get started today</a></p>
        </div>

        <!-- Example row of columns -->
        <div class="row">
            <div class="col-lg-4">
                <h2>Somethign fancy</h2>
                <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                <p><a class="btn btn-primary" href="#" role="button">View details »</a></p>
            </div>
            <div class="col-lg-4">
                <h2>Somethign fancy</h2>
                <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                <p><a class="btn btn-primary" href="#" role="button">View details »</a></p>
            </div>
            <div class="col-lg-4">
                <h2>Somethign fancy</h2>
                <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa.</p>
                <p><a class="btn btn-primary" href="#" role="button">View details »</a></p>
            </div>
        </div>

    </sec:authorize>

    <sec:authorize access="isAuthenticated()">

        <!-- Jumbotron -->
        <div class="jumbotron">
            <h1>Dupa</h1>
            <p class="lead">Cras justo odio, dapibus ac facilisis in, egestas eget quam. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet.</p>
            <p><a class="btn btn-lg btn-success" href="#" role="button">Get started today</a></p>
        </div>

        <!-- Example row of columns -->
        <div class="row" id="userBooks">
            <div class="col-lg-4">
                <h2>Heading</h2>
                <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                <p><a class="btn btn-primary" href="#" role="button">View details »</a></p>
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

