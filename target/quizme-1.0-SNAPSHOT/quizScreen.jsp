<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.clarkngo.quizme.web.domain.QuizType" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: clark
  Date: 4/20/2021
  Time: 2:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page buffer="none" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<jsp:include page="nav.jsp" flush="true" />
<body>

    <c:set var="p" value="${page}" scope="session"/>
    <c:set var="qz" value="${quiz}" scope="session"/>
    <div class="container">

        <form action="${pageContext.request.contextPath}/quiz" method="POST">
            <fieldset id="${qz.questions[p-1].questionId}">
                <legend> Question: ${qz.questions[p-1].description}</legend><br>
                    <c:forEach var="j" begin="0" end="3">
                        <c:set var="qzSelected" scope="session" value="${qz.questions[p-1].isSelected}"/>
                        <input type="radio" id="${qz.questions[p-1].choices[j].choiceId}" name="${qz.questions[p-1].questionId}" value="${qz.questions[p-1].choices[j].choiceId}">
                        <label for="${qz.questions[p-1].choices[j].choiceId}"><c:out value="${qz.questions[p-1].choices[j].description}"></c:out></label>
                        <c:out value="${qz.questions[p-1].choices[j].choiceId}"></c:out>
                        <br>
                    </c:forEach>
            <c:if test="${p > 1}">
                <c:out value="${qz.questions[p-1].questionId}"></c:out>
                <a href="${pageContext.request.contextPath}/quiz?quizTypeId=${qz.quizType.quizTypeId}&page=${p - 1}&choiceId=${qz.questions[p-1].questionId}">Before</a>
                <c:set var="p" value="${page - 1}" scope="session"/>
            </c:if>
            <c:if test="${p < 9}">
                <a href="${pageContext.request.contextPath}/quiz?quizTypeId=${qz.quizType.quizTypeId}&page=${page + 1}&choiceId=${qz.questions[p-1].questionId}">Next</a>
                <c:set var="p" value="${page + 1}" scope="session"/>
            </c:if>
            <c:if test="${p == 9}">
                <a href="">Submit</a>
                <c:set var="p" value="${page}" scope="session"/>
            </c:if>
            </fieldset>
        </form>
    </div>


</body>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script>
                    function updateChoiceSelection(elmnt,questionId, chId, index) {
                        console.log(name);
                        console.log("${qz}");
                        console.log("${qz.questions.stream().filter(question -> questi)}");


                    }

                    function getJSessionId(){
                        var jsId = document.cookie.match(/JSESSIONID=[^;]+/);
                        if(jsId != null) {
                            if (jsId instanceof Array)
                                jsId = jsId[0].substring(11);
                            else
                                jsId = jsId.substring(11);
                        }
                        return jsId;
                    }
    var allcookies = document.cookie;
    document.write ("All Cookies : " + allcookies );
    console.log(document.cookie.match(/JSESSIONID=[^;]+/));
</script>
</html>
