<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="CSS/font-awesome.css">
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.min.css">
<meta charset="UTF-8">
<script  type="text/javascript" src="CSS/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#ww").click(function () {
		$.ajax(
				{
					url:"mydata",
					type:"post",
					contentType:"application/json;charset=utf-8",
					datatype:"json",
					success:function(data){
						var str=""; 
						if(data!=null){			
							for(var i=0; i<data.length;i++)		{
$("tbody").append("<tr><td>"+ data[i].customer.username+ "</td><td>" +data[i].s_number + "</td><td>" + data[i].s_sex+ "</td><td>" +data[i].workfor + "</td><td>" +data[i].customer.password + "</td></tr>");
							}	
											
						}else{document.write("cuowu")}
					}
				});	
		
	});
});
</script>
</head>
<body>
<div align="left">
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<img width="140px" height="150px" src="bg/zpp.jpg" class="img-thumbnail " />
		</div>
	</div>
</div>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<a class="text-left text-info">${log}</a>
			</div>
		</div>
	</div>
		<hr>
<div class="row clearfix">
		<div class="col-md-2 column">
	 </div>
	    <div class="col-md-4 column" align="left">
	    
		<div class="row clearfix">
			<div class="col-md-12 column">
				<table id="data" class="table table-bordered table-hover">
					<thead id="data">
						<tr>
							<th>姓名</th>
							<th>学号</th>
							<th>性别</th>
							<th>专业</th>
							<th>密码</th>
						</tr>
					</thead>
					<tbody id="data1">
					</tbody>
				</table>
			</div>
		</div>
		<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<ul class="pagination">
				<li>
					 <a href="#">上一页</a>
				</li>
				<li>
					 <a href="#">1</a>
				</li>
				<li>
					 <a href="#">2</a>
				</li>
				<li>
					 <a href="#">3.</a>
				</li>
				<li>
					 <a href="#">4</a>
				</li>
				<li>
					 <a href="#">5</a>
				</li>
				<li>
					 <a href="#">下一个</a>
				 </li>
		  	 </ul>
	 	 </div>
	 </div>
  </div>
	</div>
	<div class="col-md-6 column">
	<div id="myButtons1" class="bs-example">
			<button id="ww" type="submit" class="btn btn-primary">查询所有成员信息</button>
		</div>
	</div>
	</div>
</div>
</body>
</html>