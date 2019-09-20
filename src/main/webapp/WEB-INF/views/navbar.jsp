<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul class="navbar-nav mr-auto">
    <li class="nav-item">
        <a class="nav-link" href="/books/forExchange">Books for exchange</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="http://localhost:8080/books/addBook">Add Book</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="/messages/all">Messages</a>
    </li>
<%--    <li class="nav-item dropdown">--%>
<%--        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
<%--            Dropdown--%>
<%--        </a>--%>
<%--        <div class="dropdown-menu" aria-labelledby="navbarDropdown">--%>
<%--            <a class="dropdown-item" href="#">Action</a>--%>
<%--            <a class="dropdown-item" href="#">Another action</a>--%>
<%--            <div class="dropdown-divider"></div>--%>
<%--            <a class="dropdown-item" href="#">Something else here</a>--%>
<%--        </div>--%>
<%--    </li>--%>
<%--    <li class="nav-item">--%>
<%--        <a class="nav-link disabled" href="#">Disabled</a>--%>
<%--    </li>--%>
</ul>

<a class="nav-link" href="/api/users/details">Witaj, <sec:authentication property="principal.username"/></a>
<form class="form-inline my-2 my-lg-0" action="<c:url value="/logout"/>" method="post">
    <input class="form-control mr-sm-2" type="submit" value="Wyloguj">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>