<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@include file="tmp/headerUser.jsp" %>

<div class="autoheight">
    <!-- Navbar -->
    <nav class="navbar navbar-light bg-light ">
        <a class="navbar-item mr-auto ml-3" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample"><span class="oi oi-cog"></span></a>
        <a class="navbar-brand ml-auto mr-auto" href="#">AIM</a>
        <span class="navbar-text ml-auto mr-3">
      		<b>${currentUser.firstName} ${currentUser.lastName}</b>
    	</span>
        <a class="navbar-item mr-3">
            <img src="${currentUser.avatar}" width="30" height="30" class="rounded-circle">
            <c:if test="${currentUser.avatar == null}">
                <img src="/resources/img/avatar.png" width="30" height="30" class="rounded-circle">
            </c:if>
        </a>

    </nav>
    <div class="collapse" id="collapseExample" style="position: absolute;left: 10px;">
        <ul class="list-group">
            <li class="list-group-item"><a href="/account">User Page</a></li>
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <li class="list-group-item"><a href="/logout">Exit</a></li>
            </c:if>
        </ul>
    </div>
    <!-- navbar end -->
    <!-- main section -->

    <div class="container">
        <div class="row">
            <div class="col-md-3"></div>

            <form:form action= "updateUser" method="post"  modelAttribute="currentUser">
                <table>

                    <tr>
                        <td>Name:</td>
                        <td><input type='text' name='firstName' value="${currentUser.firstName}"></td>
                    </tr>
                    <tr>
                        <td>Lastname:</td>
                        <td><input type='text' name='lastName' value="${currentUser.lastName}"></td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td><input type='text' name='email' value="${currentUser.email}"></td>
                    </tr>
                    <tr>
                        <td>Username:</td>
                        <td><input type='text' name='username' value="${currentUser.username}"></td>
                    </tr>

                </table>

                <input name="submit" type="submit" value="submit"/>

                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <input type="hidden" name="userId" value="${currentUser.id}" />
            </form:form>
        </div>
    </div>

    <!-- main section end -->


</div>
<%@include file="tmp/footerUser.jsp"%>