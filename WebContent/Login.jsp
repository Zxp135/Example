<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="CSS/font-awesome.css">
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.js">
<!-- <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css"> -->

<meta charset="UTF-8">
<title>Z系统登录</title>
</head>
<body  background="Background/rrr.jpg"  class="bg-primary:focus">
	<div align="center">
	<i class="fa fa-gitlab fa-5x"></i>
	<p>欢迎来到学生信息管理系统及聊天室
	</div>
	<hr>
	<fieldset style="margin: auto; width: 300px;">
		<legend>
			<font color="red">请登录</font>
		</legend>
		<form action="test" method="post">
			<div class="input-group">
				<span class="input-group-addon"> <i
					class="fa fa-user-circle fa-2x"></i></span> <input class="form-control"
					type="text" name="username" placeholder="输入账号"> <br>
			</div>
			<div class="input-group margin-bottom-sm">
				<span class="input-group-addon"> <i
					class="fa fa-eercast fa-2x" aria-hidden="true"></i></span> <input
					class="form-control" type="password" name="password"
					placeholder="输入你的密码">
			</div>
			<br> <input type="submit" value="登录"> <br>
			<div class="btn-group">
				<a class="btn btn-lg btn-success" href="go">没有账号？注册一个</a>
			</div>
		</form>
	</fieldset>
	提示信息：
	<br>${out}
</body>
</html>
