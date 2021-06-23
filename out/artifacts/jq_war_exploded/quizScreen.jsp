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
    <style>
        .content { margin-top:54px; }
        .header {padding:15px; position:fixed; top:0; width:100%; z-index:9999; }
        .left-title { width:80px; color:#FFF; font-size:18px; float:left; }
        .right-title { width:150px; text-align:right; float:right; color:#FFF;  }
        .quiz-body { margin-top:15px; padding-bottom:50px; }
        .option-block-container { margin-top:20px; max-width:420px; }
        .option-block { padding:10px; background:aliceblue; border:1px solid #84c5fe; margin-bottom:10px; cursor:pointer; }
        .result-question { font-weight:bold; }
        .c-wrong { margin-left:20px; color:#FF0000; }
        .c-correct {  margin-left:20px; color:green; }
        .last-row { border-bottom:1px solid #ccc; padding-bottom:25px; margin-bottom:25px; }
        .res-header { border-bottom:1px solid #ccc; margin-bottom:15px; padding-bottom:15px; }
    </style>
</head>
<body>

<header class="header bg-primary">

    <div class="left-title">JS Quiz</div>
    <div class="right-title">Total Questions: <span id="tque"></span></div>
    <div class="clearfix"></div>
</header>
<div class="content">
    <div class="container-fluid">

        <div class="row">
            <div class="col-sm-12">
                <div id="result" class="quiz-body">
       <!--             <form name="quizForm" onSubmit="" action="${pageContext.request.contextPath}/quizSubmit" method="POST"> -->
                    <form id="sampleForm" name="sampleForm" action="http://localhost:8080/app/quizSubmit" method="POST">

                        <fieldset class="form-group">
                            <!--
                            <input type="hidden" name="total" id="total" value="2">
                            <a href="#" onclick="setValue();">Click to submit</a>
-->
                            <button  name="previous" id="previous" class="btn btn-success">Previous</button>
                            &nbsp;
                            <button  name="next" id="next" class="btn btn-success">Next</button>
                            <h4><span id="qid">1.</span> <span id="question"></span></h4>

                            <div class="option-block-container" id="question-options">

                            </div> <!-- End of option block -->
                        </fieldset>

                    </form>
                </div>
            </div> <!-- End of col-sm-12 -->

        </div> <!-- End of row -->
    </div> <!-- ENd of container fluid -->
</div> <!-- End of content -->

</body>
</html>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script>

    var quiz;
    $(document).ready(function(){
        $.ajax({
            type: "GET",
            url: "http://localhost:8080/app/quizjson?quizTypeId=1",
            dataType: 'html',
            success: function(data) {
                quiz = { "JS" : [JSON.parse(data)] }
                console.log(data);

                console.log(quiz.JS);
                console.log(quiz.JS.length);
                console.log(quiz.JS[0]);
                console.log(quiz.JS[0][0]);

                var quizApp = function() {

                    this.score = 0;
                    this.qno = 1;
                    this.currentque = 0;
                    var totalque = quiz.JS[0].length;

                    this.displayQuiz = function(cque) {
                        this.currentque = cque;
                        if(this.currentque <  totalque) {
                            $("#tque").html(totalque);
                            $("#previous").attr("disabled", false);
                            $("#next").attr("disabled", false);
                            $("#qid").html(quiz.JS[0][this.currentque].id + '.');


                            $("#question").html(quiz.JS[0][this.currentque].question);
                            $("#question-options").html("");
                            for (var key in quiz.JS[0][this.currentque].options[0]) {
                                if (quiz.JS[0][this.currentque].options[0].hasOwnProperty(key)) {

                                    $("#question-options").append(
                                        "<div class='form-check option-block'>" +
                                        "<label class='form-check-label'>" +
                                        "<input type='radio' class='form-check-input' name='option'   id='q"+key+"' value='" + quiz.JS[0][this.currentque].options[0][key] + "'><span id='optionval'>" +
                                        quiz.JS[0][this.currentque].options[0][key] +
                                        "</span></label>"
                                    );
                                }
                            }
                        }
                        if(this.currentque <= 0) {
                            $("#previous").attr("disabled", true);
                        }
                        if(this.currentque >= totalque) {
                            $('#next').attr('disabled', true);
                            for(var i = 0; i < totalque; i++) {
                                this.score = this.score + quiz.JS[0][i].score;
                            }
                            return this.showResult(this.score);
                        }
                    }

                    this.showResult = function(scr) {
                        $("#result").addClass('result');
                        $("#result").html("<h1 class='res-header'>Total Score: &nbsp;" + scr  + '/' + totalque + "</h1>");
                        $("#result").append('<h3><a href="http://localhost:8080/app/feedback-form">Give a Feedback</a></h3>');


                        $("#result").append('<br>');
        //                $("#result").append('<form id="sampleForm" name="sampleForm" action="http://localhost:8080/app/quizSubmit" method="POST">');
          //              $("#result").append('<input type="hidden" name="total" id="total" value="">');
            //            $("#result").append('<a href="#" onclick="setValue();">Click to submit</a>');


                        for(var j = 0; j < totalque; j++) {
                            var res;
                            if(quiz.JS[0][j].score == 0) {
                                    res = '<span class="wrong">' + quiz.JS[0][j].score + '</span><i class="fa fa-remove c-wrong"></i>';
                                } else {
                                    res = '<span class="correct">' + quiz.JS[0][j].score + '</span><i class="fa fa-check c-correct"></i>';
                                }
                                $("#result").append(
                                '<div class="result-question"><span>Q ' + quiz.JS[0][j].id + '</span> &nbsp;' + quiz.JS[0][j].question + '</div>' +
                                '<div><b>Selected answer:</b> &nbsp;' + quiz.JS[0][j].selected + '</div>' +
                                '<div><b>Correct answer:</b> &nbsp;' + quiz.JS[0][j].answer + '</div>' +
                                '<div class="last-row"><b>Score:</b> &nbsp;' + res +

                                '</div>'
                            );
                            console.log(quiz.JS[0][j].questionId);
                            console.log(quiz.JS[0][j].question);
                            console.log(quiz.JS[0][j].selected);
                            console.log(quiz.JS[0][j].answer);
                            console.log(quiz.JS[0][j].score);
                        }
                    }

                    this.checkAnswer = function(option) {
                        var answer = quiz.JS[0][this.currentque].answer;
                        option = option.replace(/\</g,"&lt;")   //for <
                        option = option.replace(/\>/g,"&gt;")   //for >
                        option = option.replace(/"/g, "&quot;")

                        if(option ==  quiz.JS[0][this.currentque].answer) {
                            if(quiz.JS[0][this.currentque].score == "") {
                                quiz.JS[0][this.currentque].score = 1;
                                quiz.JS[0][this.currentque].status = "correct";
                            }
                        } else {
                            quiz.JS[0][this.currentque].status = "wrong";
                        }
                        quiz.JS[0][this.currentque].selected = option;
                    }

                    this.changeQuestion = function(cque) {
                        this.currentque = this.currentque + cque;
                        this.displayQuiz(this.currentque);
                    }
                }

                var jsq = new quizApp();
                var selectedopt;
                $(document).ready(function() {
                    jsq.displayQuiz(0);
                    $('#question-options').on('change', 'input[type=radio][name=option]', function(e) {

                        //var radio = $(this).find('input:radio');
                        $(this).prop("checked", true);
                        selectedopt = $(this).val();
                    });
                });

                $('#next').click(function(e) {
                    e.preventDefault();
                    if(selectedopt) {
                        jsq.checkAnswer(selectedopt);
                    }
                    jsq.changeQuestion(1);
                });

                $('#previous').click(function(e) {
                    e.preventDefault();
                    if(selectedopt) {
                        jsq.checkAnswer(selectedopt);
                    }
                    jsq.changeQuestion(-1);
                });


                console.log(quiz.JS[0]);

            }
        });
    });



</script>

<script type="text/javascript">
    function setValue(){
        console.log(quiz);
        console.log(JSON.stringify(quiz));
        document.sampleForm.total.value = quiz.JS[0];
        document.forms["sampleForm"].submit();
    }
</script>
<script type="text/javascript">
    function setValue2() {
        var element = document.getElementById("total");
        element.value = quiz.JS[0];
        element.form.submit();

    }
</script>