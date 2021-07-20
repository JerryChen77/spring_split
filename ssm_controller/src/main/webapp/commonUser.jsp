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

        function queryCardId() {
            $("#queryCardId").toggle()
            $("#queryCardId").html(${sessionScope.user.cardId})
        }

        function queryBalance() {
            $.ajax({
                type:"get",
                data:{"cardId":"${sessionScope.user.cardId}"},
                url:"${pageContext.request.contextPath}/user/findByCardId",
                contentType:"application/json",
                success:function (ret) {
                    $("#queryBalance").toggle()
                    $("#queryBalance").html(ret.accountBalance)
                }
            })
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
                                    <li class="active"><a href="#">Hi~${sessionScope.user.username}<span class="sr-only">(current)</span></a></li>
                                    <li><IMG src="${pageContext.request.contextPath}/files/${sessionScope.user.img}" width="45px" style="border-radius: 30px"></li>
                                </ul>
                                <form class="navbar-form navbar-left" action="${pageContext.request.contextPath}/user/upload" enctype="multipart/form-data" method="post">
                                    <input type="hidden" name="cardId" value="${sessionScope.user.cardId}">
                                    <a href="" class="a-upload">
                                        <input type="file" name="img" id="">更新头像
                                    </a>
                                    <button type="submit" class="a-upload" style="position: absolute;top: 8px">上传</button>
                                    <a href="${pageContext.request.contextPath}/user/download?filename=${sessionScope.user.img}" class="a-upload" style="position: absolute;left:375px ;top: 8px">
                                        下载头像
                                    </a>
                                </form>


                                <ul class="nav navbar-nav navbar-right">
                                    <li><IMG src="${pageContext.request.contextPath}/files/LOL-LOGO.jpg" height="45px" style="border-radius: 30px"></li>
                                </ul>
                            </div><!-- /.navbar-collapse -->
                        </div><!-- /.container-fluid -->
                    </nav>
                    <h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="label label-default">诺克萨斯</span></h1>

<table  align="center"  style="position:absolute;top: 150px;left: 50px">
    <tr>
        <td width="85px"><button type="button" onclick="queryCardId()" class="btn btn-success">查询卡号</button></td>
        <td width="60px" style="background-color: #5db85d;border-radius: 5px;text-align: center" hidden id="queryCardId" ></td>
    </tr>
    <tr style="height: 5px"></tr>
    <tr>
        <td width="85px"><button type="button" onclick="queryBalance()" class="btn btn-danger">查询余额</button></td>
        <td width="60px" style="background-color: #d95450;border-radius: 5px;text-align: center" hidden id="queryBalance" ></td>
    </tr>
</table>

<form action="/user/transfer"  style="position:absolute;top: 230px;left: 50px">

    <table border="" style="background-color: ghostwhite" width="350px">
        <input type="hidden" name="fromCardId" value="${user.cardId}">
        <tr>
            <td colspan="2" align="center">发起转账</td>
        </tr>
        <tr>
            <td>收款账号：</td>
            <td><input type="text" name="toCardId"></td>
        </tr>
        <tr>
            <td>转账金额:</td>
            <td><input type="text" name="money"></td>
        </tr>
        <tr>
            <td colspan="2" align="center"><input type="submit" placeholder="提交"></td>
        </tr>
    </table>
</form>
</body>
</html>
