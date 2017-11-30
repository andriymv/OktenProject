<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@include file="tmp/headerUser.jsp" %>

<div id="user" class="autoheight">

    <nav class="navbar navbar-light bg-light ">
        <a class="navbar-item mr-auto ml-3" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample"><span class="oi oi-cog"></span></a>
        <a class="navbar-brand ml-auto mr-auto" href="#">AIM</a>
        <span class="navbar-text ml-auto mr-3">
      	Hello, <b>${currentUser.firstName} ${currentUser.lastName}</b>
            <a href="chat">Chat</a>
        </span>
        <a class="navbar-item mr-3">
            <c:if test="${currentUser.avatar != null}">
                <img src="${currentUser.avatar}" width="30" height="30" class="rounded-circle" alt="">
            </c:if>
            <c:if test="${currentUser.avatar == null}">
                 <img src="/resources/img/avatar.png" width="30" height="30" class="rounded-circle" alt="">
            </c:if>
        </a>
    </nav>

    <div class="collapse" id="collapseExample" style="position: absolute;left: 10px;">
        <ul class="list-group">
            <li class="list-group-item"><a href="/settings">Settings</a></li>
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <li class="list-group-item"><a href="/logout">Exit</a></li>
            </c:if>
        </ul>
    </div>

    <div class="container">

        <div class="row mt-5">
            <div class="col text-center">
                <h2>Your goals for a <select class="form-control" style="display: inline-block; width: 15%;">
                    <option>Day</option><option>Week</option><option>Month</option><option>Year</option>
                </select><a href="/goal" class="btn btn-outline-primary btn-sm ml-5" role="button" aria-pressed="true">Add goal</a></h2>
            </div>
        </div>

            <div class="container-fluid">
                <div  class="row ml-5 mr-5 mt-4 justify-content-center">
                    <div class="col" style="max-width: 1400px">
                        <div class="card autoheight1" style="overflow-y: auto;">
                            <div class="list-group list-group-flush">
                                    <c:forEach items="${goalList}" var="go">
                                        <c:if test="${go.user.id == currentUser.id}">
                                            <div class="list-group-item autoheight2 row m-0">
                                                <div class="col-sm-8">
                                                    <h5>${go.goalName}</h5>
                                                    <p>${go.goalDesc}</p>
                                                </div>
                                                <div class="col-sm-2 mTop">
                                                    <div class="progress">
                                                        <div class="progress-bar" role="progressbar" style="width: ((${go.currentGoalCrNum}/${go.goalCrNum})*100)" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div><p class="progressText"><b><span class="current-num">${go.currentGoalCrNum}</span>/<span class="max-num">${go.goalCrNum}</span></b></p>
                                                </div>
                                                <div class="col-sm-1 text-center mTop">
                                                    <a href="#" data-toggle="modal" data-target="#myModal"><span class="oi oi-plus"></span></a>
                                                </div>
                                                <div class="modal fade" id="myModal" role="dialog">
                                                    <div class="modal-dialog">

                                                        <!-- Modal content-->
                                                        <div class="modal-content">
                                                            <form action="/changeGoal" method="post">
                                                                <input type="hidden" value="${go.id}" name="goalId">
                                                            <div class="modal-header">
                                                                <h4 class="modal-title">Add progress to your goal</h4>
                                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <p>Your current progress: <b>${go.currentGoalCrNum}/${go.goalCrNum}</b></p><br>
                                                                <div class="progress">
                                                                    <div class="progress-bar" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div><br>
                                                                <p>Change your progress:</p><br>
                                                                <div class="range-slider">
                                                                    <input class="range-slider__range" type="range" name="currentGoalCrNum" value="${go.currentGoalCrNum}" min="${go.currentGoalCrNum}" max="${go.goalCrNum}">
                                                                    <span class="range-slider__value">${go.currentGoalCrNum}</span>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <%--<a href="/changeGoal"  class="btn btn-outline-primary" role="button" aria-pressed="true">Save</a>--%>
                                                                    <input type="submit" value="Add progress" class="tn btn-outline-primary">
                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                                                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                            </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-1 text-center mTop">
                                                    <a href="#"><span class="oi oi-pencil"></span></a>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

    </div>
<%@include file="tmp/footerUser.jsp"%>