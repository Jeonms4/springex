<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title>Todo Modify/Remove </title>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">Navbar</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                        <div class="navbar-nav">
                            <a class="nav-link active" aria-current="page" href="#">Home</a>
                            <a class="nav-link" href="#">Features</a>
                            <a class="nav-link" href="#">Pricing</a>
                            <a class="nav-link disabled">Disabled</a>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <!-- header end -->
    <!-- 기존의 <h1>Header</h1>끝 -->
    <div class="row content">
        <div class="col">
            <div class="card">

                <div class="card-header">
                    할 일
                </div>
                <div class="card-body">

                    <form action="/springex/todo/modify"  method="post">

                        <div class="input-group mb-3">
                            <span class="input-group-text">TNO</span>
                            <input type="text" name="tno" class="form-control"
                                   value=<c:out value="${dto.tno}"></c:out> readonly>
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text">Title</span>
                            <input type="text" name="title" class="form-control"
                                   value='<c:out value="${dto.title}"></c:out>' >
                        </div>

                        <div class="input-group mb-3">
                            <span class="input-group-text">DueDate</span>
                            <input type="date" name="dueDate" class="form-control"
                                   value=<c:out value="${dto.dueDate}"></c:out> >

                        </div>

                        <div class="input-group mb-3">
                            <span class="input-group-text">Writer</span>
                            <input type="text" name="writer" class="form-control"
                                   value=<c:out value="${dto.writer}"></c:out> readonly>

                        </div>

                        <div class="form-check">

                            <label class="form-check-label" >

                                Finished &nbsp;

                            </label>

                            <input class="form-check-input" type="checkbox" name="finished" ${dto.finished?"checked":""}  >
                        </div>

                        <div class="my-4">

                            <div class="float-end">

                                <button type="button" class="btn btn-primary">  수정  </button>
                                <button type="button" class="btn btn-danger">   삭제 </button>
                                <button type="button" class="btn btn-secondary"> 할일 목록으로 가기</button>

                            </div>

                        </div>
                   </form>



                </div>

            </div>



        </div>



    </div>

</div>


</body>
</html>
<script>

    //목록 페이지로 이동하는 이벤트 처리
    document.querySelector(".btn-secondary").addEventListener("click", function (event) {
        self.location="/springex/todo/list"
    }, false)

    //수정하는 이벤트 처리
    const formObj = document.querySelector("form")
    document.querySelector(".btn-primary").addEventListener("click",function(e) {
        e.preventDefault()// 기본 이벤트 중지
        e.stopPropagation() // 버블링(전파) 막기

        formObj.action ="/springex/todo/modify"
        formObj.method ="post"

        formObj.submit()
    }, false);

    //삭제하는 이벤트 처리
    document.querySelector(".btn-danger").addEventListener("click",function(e) {

        e.preventDefault()
        e.stopPropagation()

        formObj.action ="/springex/todo/delete"
        formObj.method ="post"

        formObj.submit()

    }, false);





</script>

<script>



    const serverValidResult = {}

    <c:forEach items="${errors}" var="error">

    serverValidResult['${error.getField()}'] = '${error.defaultMessage}'

    </c:forEach>

    console.log(serverValidResult);
    //alert("제목은 " + serverValidResult['title']);


</script>