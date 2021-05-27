<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="CSS/font-awesome.css">
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.js">
<title>Z系统注册</title>
</head>
<body>
	<fieldset style="margin: auto; width: 300px; margin-top: 150px;">
		<legend>注册</legend>
		<form action="text" method="post">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="账号"
					name="customer.username">
			</div>
			<div class="input-group">
				<input class="form-control" type="password" placeholder="密码"
					name="customer.password">
			</div>
			<div class="input-group">
				<input class="form-control" type="text" placeholder="学号"
					name="s_number"><br>
			</div>
			<div class="input-group">
				<select class="custom-select" name="s_sex">
					<option value="男">男
					<option value="女">女
				</select>
			</div>
			<div class="input-group">
				<input class="form-control" type="text" placeholder="专业"
					name="workfor">
			</div>
			<div class="input-group">
				<input class="form-control" type="submit" value="注册">
			</div>
		</form>
	</fieldset>
	<br>${out}
</body>
</html>