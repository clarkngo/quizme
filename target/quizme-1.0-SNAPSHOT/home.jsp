<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.clarkngo.quizme.web.domain.QuizType" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%--
  Created by IntelliJ IDEA.
  User: clark
  Date: 4/20/2021
  Time: 2:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<jsp:include page="nav.jsp" flush="true" />
<body>
    <p><c:out value="${quizTypeList}"/></p>
    <div class="container">
        <div class="row">
            <c:forEach var="quizType" items="${quizTypeList}">
                <div class="col-sm-4">
                    <div class="card border-primary mb-3" style="max-width: 25rem;">
                        <img class="card-img-top" src="${quizType.getImageUrl()}" alt="Card image" width="100%" height="200">
                        <div class="card-body">
                            <h4 class="card-title"><c:out value="${quizType.getName()}"/></h4>
                            <p class="card-text"><c:out value="${quizType.getDescription()}"/></p>
                            <form action="${pageContext.request.contextPath}/quiz" method="GET">
                                <div class="form-group">
                                    <input type="hidden" class="form-control" name="quizTypeId" value="${quizType.getQuizTypeId()}">
                                </div>
                                <div class="form-group">
                                    <input type="hidden" class="form-control" name="page" value="1">
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary btn-block">Start Quiz</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
