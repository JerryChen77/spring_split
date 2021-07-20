<%--
  Created by IntelliJ IDEA.
  User: 79016
  Date: 2021/7/11
  Time: 18:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.js" type="text/javascript" charset="UTF-8"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <style type="text/css">
        body{
            width:100%;
            height:100%;
            background:url(${pageContext.request.contextPath}/src/main/webapp/login/images/bg.jpg) center center;
            min-width: 1200px;
            background-size: 100% 100%;
            background-repeat: no-repeat;
        }
        .a-upload {
            padding: 4px 10px;
            height: 30px;
            line-height: 20px;
            position: relative;
            cursor: pointer;
            color: #888;

            background: #fafafa;
            border: 1px solid #ddd;
            border-radius: 4px;
            overflow: hidden;
            display: inline-block;
            *display: inline;
            *zoom: 1
        }

        .a-upload  input {
            position: absolute;
            font-size: 100px;
            right: 0;
            top: 0;
            opacity: 0;
            filter: alpha(opacity=0);
            cursor: pointer
        }

        .a-upload:hover {
            color: #444;
            background: #eee;
            border-color: #ccc;
            text-decoration: none
        }
    </style>
    <script type="text/javascript">

        function deleteUser(id){
            var ret = confirm("请确认删除");
            // alert("我是confirm的选择结果:" + ret);
            if (ret) {
                $.ajax({
                    type:"delete",
                    data:id,
                    url:"${pageContext.request.contextPath}/user/users/"+id,
                    contentType:"application/json",
                    success:function (ret) {
                        if (ret=="success"){
                            $("#"+id).remove();
                        }else{
                            alert("服务器异常，删除失败")
                        }
                    }
                })
            }
        }
        function updateUser(id){
            $.ajax({
                type:"get",
                data:{"cardId":id},
                url:"${pageContext.request.contextPath}/user/findByCardId",
                contentType:"application/json",
                success:function (ret) {
                    if (ret!=null){
                        window.location.href="${pageContext.request.contextPath}/adminUpdate.jsp"
                    }else{
                        alert("服务器异常，暂无法更新")
                    }
                }
            })
        }


            function check_fields(){
                var v1= $("#newUserName").val();
                var v2= $("#newUserPassword").val();
                if($.trim(v1)==""||$.trim(v2)==""){
                    alert("清输入用户信息");
                    return false;
                }else{
                    $("#newUser").submit();
                }
            }

    </script>
</head>
<body>
                    <%--顶部导航条--%>
                    <nav class="navbar navbar-default navbar-inverse">
                        <div class="container-fluid">
                            <!-- Brand and toggle get grouped for better mobile display -->
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <a class="navbar-brand" href="${pageContext.request.contextPath}/login/login.jsp" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="返回登录">英雄联盟</a>
                            </div>

                            <!-- Collect the nav links, forms, and other content for toggling -->
                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                <ul class="nav navbar-nav">
                                    <li class="active"><a href="#">Hi~管理员${sessionScope.user.username}<span class="sr-only">(current)</span></a></li>
                                    <li><IMG src="${pageContext.request.contextPath}/files/${sessionScope.user.img}" width="45px" style="border-radius: 30px"></li>
                                </ul>
                                <form class="navbar-form navbar-left" action="${pageContext.request.contextPath}/user/upload" enctype="multipart/form-data" method="post">
                                    <input type="hidden" name="cardId" value="${sessionScope.user.cardId}">
                                    <input type="hidden" name="pageNum" value="${pageInfo.pageNum}">

                                    <a href="" class="a-upload">
                                        <input type="file" name="img" id="">更新头像
                                    </a>
                                    <button type="submit" class="a-upload" style="position: absolute;top: 8px">上传</button>
                                    <a href="${pageContext.request.contextPath}/user/download?filename=${sessionScope.user.img}" class="a-upload" style="position: absolute;left:420px ;top: 8px">
                                        下载头像
                                    </a>
                                </form>


                                <ul class="nav navbar-nav navbar-right">
                                    <li><IMG src="${pageContext.request.contextPath}/files/LOL-LOGO.jpg" height="45px" style="border-radius: 30px"></li>
                                </ul>
                            </div><!-- /.navbar-collapse -->
                        </div><!-- /.container-fluid -->
                    </nav>

                    <table class="table table-hover" align="center" style="width: 900px;opacity: 85%;text-align: center" >
                        <tr class="active">
                            <td>卡号</td>
                            <td>用户名</td>
                            <td>账号密码</td>
                            <td>账户余额</td>
                            <td>用户ID</td>
                            <td>头像</td>
                            <td>是否管理员（1：是）</td>
                            <td>操作</td>

                        </tr>
                        <c:forEach items="${pageInfo.getList()}" var="user">
                            <tr class="info" id="${user.cardId}">
                                <td>${user.cardId}</td>
                                <td>${user.username}</td>
                                <td>${user.accountPassword}</td>
                                <td>${user.accountBalance}</td>
                                <td>${user.userId}</td>
                                <td><IMG src="${pageContext.request.contextPath}/files/${user.img}" width="45px" style="border-radius: 30px"></td>
                                <td>${user.isAdmin}</td>
                                <td>
                                    <button onclick="updateUser(${user.cardId})" type="button" class="btn btn-warning">修改</button>
                                    <button onclick="deleteUser(${user.cardId})" type="button" class="btn btn-danger">删除</button>
                                </td>
                            </tr>
                        </c:forEach>
                        <tr class="warning">
                            <form id="newUser" action="${pageContext.request.contextPath}/user/register" method="post" enctype="multipart/form-data">
                                <td>新建用户：</td>
                                <td><input type="text" id="newUserName" name="username" placeholder="用户名..." style="width: 70px"></td>
                                <td><input type="password" id="newUserPassword" name="accountPassword" placeholder="密码..." style="width: 70px"></td>
                                <td><input type="text" name="accountBalance" placeholder="余额..." style="width: 70px"></td>
                                <td><input type="text" name="userId" placeholder="用户ID..." style="width: 70px"></td>
                                <%--此处文件名用image，防止后端直接匹配进user对象中--%>
                                <td><input type="file" name="image"  style="width: 80px"></td>
                                <td><input type="text" name="isAdmin" placeholder="是否管理员" style="width: 90px"></td>
                                <td><button type="button" class="btn btn-primary" onclick="check_fields()">新增</button></td>
                            </form>
                        </tr>
                    </table>

                    <nav aria-label="..." style="position: absolute;left: 50%;">
                        <ul class="pagination">
                            <c:if test="${pageInfo.pageNum>1}">
                                <li class="active"><a href="${pageContext.request.contextPath}/userLogin/findByPageNo?pageNum=${pageInfo.pageNum-1}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
                            </c:if>
                            <c:if test="${pageInfo.pageNum<=1}">
                                <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
                            </c:if>
                            <c:forEach var="index" begin="1" end="${pageInfo.pages}">
                                <c:if test="${index==pageInfo.pageNum}">
                                    <li class="active"><a href="${pageContext.request.contextPath}/userLogin/findByPageNo?pageNum=${index}">${index}<span class="sr-only">(current)</span></a></li>
                                </c:if>
                                <c:if test="${index!=pageInfo.pageNum}">
                                    <li ><a href="${pageContext.request.contextPath}/userLogin/findByPageNo?pageNum=${index}">${index}</a></li>
                                </c:if>
                            </c:forEach>
                            <c:if test="${pageInfo.pageNum<pageInfo.pages}">
                                <li class="active"><a href="${pageContext.request.contextPath}/userLogin/findByPageNo?pageNum=${pageInfo.pageNum+1}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
                            </c:if>
                            <c:if test="${pageInfo.pageNum>=pageInfo.pages}">
                                <li class="disabled"><a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
                            </c:if>
                        </ul>
                    </nav>
</body>
</html>
