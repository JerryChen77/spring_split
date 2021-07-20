<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

	<head>
		<meta charset="utf-8" />
		<title>用户登录界面</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/login/css/style.css" />
		<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.js" type="text/javascript" charset="UTF-8"></script>
		<script type="text/javascript">
			$(function() {
				$('#kaptchaImage').click(function() {
					$(this).attr('src','${pageContext.request.contextPath}/kaptcha.jpg?' + new Date());
				});
			});

			${error}
		</script>

	</head>

	<body>
		<div class="login">
			<div class="login_form">
				<div class="form">
					<div class="login_con">
						<span class="welcome">欢迎光临峡谷银行</span>
						<br />
						<form action="/userLogin/login" method="post">
						<img src="${pageContext.request.contextPath}/login/images/user.png" class="user" />
						<input type="text" id="username" name="username" placeholder="请输入用户名" class="username same">
						<br />
						<img src="${pageContext.request.contextPath}/login/images/password.png" class="pass" />
						<input type="password" id="password" name="password" placeholder="请输入密码" class="password same" />
						<br />
						<input type="text" placeholder="请输入验证码" name="kaptcha" class="yanzhengma" />
						<img src="${pageContext.request.contextPath}/kaptcha.jpg" id="kaptchaImage" style="margin-left: 0px;margin-top: 20px;">
							<input type="submit" value="登录" class="yanzhengma">
						</form>
					</div>
				</div>
			</div>
			<div class="footer">
				<a href="#">版权所有：阿卡丽的神秘商店 </a>&nbsp;
				<a href="#">技术支持：JerryChen</a>
			</div>
		</div>

	</body>
</html>