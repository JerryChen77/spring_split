<%--
  Created by IntelliJ IDEA.
  User: 79016
  Date: 2021/7/10
  Time: 17:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.js" type="text/javascript" charset="UTF-8"></script>
    <script type="text/javascript">
        function back() {
            window.location.href="${pageContext.request.contextPath}/commonUser.jsp"
        }
    </script>
</head>
<body>
<h1>转账成功！！</h1>
<h2>账号信息如下</h2>
<table border="" >
    <tr>
        <td>转账卡号</td>
        <td>用户名</td>
        <td>余额</td>
    </tr>
    <tr>
        <td>${fromUser.cardId}</td>
        <td>${fromUser.username}</td>
        <td>${fromUser.accountBalance}</td>
    </tr>
</table>
<button type="button" id="back" onclick="back()">返回</button>
</body>
</html>
