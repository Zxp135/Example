<%@ page  contentType="text/html; charset=UTF-8"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="//cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="//cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="//cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script  type="text/javascript" src="CSS/bootstrap.bundle.js"></script>
<link rel="stylesheet" type="text/css" href="CSS/bootstrap-reboot.min.css">
<link rel="stylesheet" type="text/css" href="CSS/font-awesome.css">
<link rel="stylesheet" type="text/css" href="CSS/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="CSS/bootstrap-grid.min.css">
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.min.css">
<script  type="text/javascript" src="CSS/jquery.min.js"></script>
<script  type="text/javascript" src="CSS/bootstrap.min.js"></script>
<title>管理员</title>
</head>
<body bgcolor="red">
<script type="text/javascript">
 var ALLdata=null;
 var temp;
 //查询全部
$(document).ready(function() {
	$("#ww").click(function () {
		  $("#tt").empty();
		$.ajax(
				{
					url:"mydata",
					type:"post",
					contentType:"application/json;charset=utf-8",
					datatype:"json",
					success:function(data){
						ALLdata=data; 
						if(data!=null){	
							for(var i=0; i<data.length;i++)		{
							temp=i;
$("tbody").append("<tr class='success'><td>"+ data[i].customer.username+ "</td><td>" +data[i].s_number + "</td><td>" + data[i].s_sex+ "</td><td>" +data[i].workfor + "</td><td>" +data[i].customer.password + "      <button id='"+temp+"' onclick='deleteUser(this)'  type='button' class='btn btn-xs btn-warning'>"+"删除"+"</button>"+"   "+"<button id='"+temp+"' type='button' class='btn btn-default btn-success btn-xs'   data-toggle='modal' data-target='#customerEditDialog' onclick= 'ddd(this)'>"+"修改"+"</button>"+"</td></tr>");
							}	
											
						}else{document.write("cuowu")}
					}
				});	
		
	});
});
</script>
<script type="text/javascript">
//模糊查询
function dd(obj){
	var username=$("#username").val();
	var s_number=$("#s_number").val();
	var workfor=$("#workfor").val();
    $("#tt").empty();
	if(username=="" && s_number=="" && workfor=="")  alert("请输入查询信息！");else{
	$.ajax(
			{
				url:"mydata2",
				type:"post",
				data:JSON.stringify({"username":username,"s_number":s_number,"workfor":workfor}),
				contentType:"application/json;charset=utf-8",
				datatype:"json",
				success:function(data){
					ALLdata=data;
					if(data!=null){	
						for(var i=0; i<data.length;i++)		{
							temp=i;
$("tbody").append("<tr  class='success'><td>"+ data[i].customer.username+ "</td><td>" +data[i].s_number + "</td><td>" + data[i].s_sex+ "</td><td>" +data[i].workfor + "</td><td>" +data[i].customer.password + "   <button id='"+temp+"' onclick='deleteUser(this)'  type='button' class='btn btn-xs btn-warning'>"+"删除"+"</button>"+"   "+"<button id='"+temp+"' type='button' class='btn btn-default btn-success btn-xs'   data-toggle='modal' data-target='#customerEditDialog' onclick= 'ddd(this)'>"+"修改"+"</button>"+"</td></tr>");
						}	
										
					}else{
						alert("没有查询到信息请重新输入！");
						}
				}
			});
	}
}


//展示
function display() {
	 $("#tt").empty();
	$.ajax(
			{
				url:"mydata",
				type:"post",
				contentType:"application/json;charset=utf-8",
				datatype:"json",
				success:function(data){
					if(data!=null){	
						for(var i=0; i<data.length;i++)		{
						temp=i;
						$("tbody").append("<tr  class='success'><td>"+ data[i].customer.username+ "</td><td>" +data[i].s_number + "</td><td>" + data[i].s_sex+ "</td><td>" +data[i].workfor + "</td><td>" +data[i].customer.password + "   <button id='"+temp+"' onclick='deleteUser(this)'  type='button' class='btn btn-xs btn-warning'>"+"删除"+"</button>"+"   "+"<button id='"+temp+"' type='button' class='btn btn-default btn-success btn-xs'   data-toggle='modal' data-target='#customerEditDialog' onclick= 'ddd(this)'>"+"修改"+"</button>"+"</td></tr>");
						}	
						ALLdata=data; 				
					}else{document.write("cuowu")}
				}
			});	
}
</script>
<script type="text/javascript">
var UpdateID;
//删除
function deleteUser(obj) {
	var id=$(obj).attr('id');
	var s_number=ALLdata[id].s_number;
	var username=ALLdata[id].customer.username;
	if(confirm("确实要删除该客户吗?")) {
		$.ajax(
					{
						url:"deleteuser",
						type:"post",
						data:JSON.stringify({"s_number":s_number,"username":username}),
						contentType:"application/json;charset=utf-8",
						datatype:"json",
						success:function(data){
							if(data=="OK"){	
									alert("删除成功！");	
									 $("#tt").empty();
									 display();
							}else{
								     alert("删除失败！");
								}
						}
					});	
		                         }
	else{
		
	}

}
//修改按钮
function ddd(obj) {
	var id=$(obj).attr('id');
	UpdateID=id;
	$("#x1").val(ALLdata[id].customer.username);
	$("#x2").val(ALLdata[id].s_number);
	$("#x3").val(ALLdata[id].workfor);
	$("#x4").val(ALLdata[id].customer.password);
	$("#x5").val(ALLdata[id].s_sex);
}		    
//保存修改按钮
function updateCustomer(){
	var username=$('#x1').val();
	var s_number=$('#x2').val();
	var workfor=$('#x3').val();
	var password=$('#x4').val();
	var s_sex=$('#x5 option:selected').val();
	var id=ALLdata[UpdateID].id;
	var uid=ALLdata[UpdateID].customer.id;
	if(username=="" || s_number=="" || workfor==""  || password=="" || s_sex=="" || id=="" || uid==""){
		alert("请输入完整信息");
	}else{
	if(confirm("确实要修改该客户吗?")) {
		$.ajax(
					{
						url:"updata",
						type:"post",
						data:JSON.stringify({"s_number":s_number,"username":username,"s_sex":s_sex,"password":password,"workfor":workfor,"id":id,"uid":uid}),
						contentType:"application/json;charset=utf-8",
						datatype:"json",
						success:function(data){
							if(data=="OK"){	
									alert("修改成功！");
									$("#tt").empty();
									display();
							}else{
								     alert("修改失败！");
								}
						}
					});	
		                         }
	else{
		
	}
	}
}
</script>
<script type="text/javascript">
function createU() {
	var username=$('#e1').val();
	var s_number=$('#e2').val();
	var workfor=$('#e3').val();
	var password=$('#e4').val();
	var s_sex=$('#e5 option:selected').val();
	if(username=="" ||s_number=="" || workfor=="" || password=="" || s_sex==""){alert("请补全信息");}else{
if(confirm("确实创建该客户吗?")) {
		$.ajax(
					{
						url:"create",
						type:"post",
						data:JSON.stringify({"s_number":s_number,"username":username,"s_sex":s_sex,"workfor":workfor,"password":password}),
						contentType:"application/json;charset=utf-8",
						datatype:"json",
						success:function(data){
							if(data=="SUCCESS"){	
									alert("创建成功！");
									$('#e1').val(" ");
									$('#e2').val(" ");
									$('#e3').val(" ");
									$('#e4').val(" ");
									 $("#tt").empty();
										display();
							}else if(data=="FAIL"){
								     alert("该用户已经存在！");
								}else {
									alert("创建失败！");
								}
						}
					});	
		                         }
	else{
		
	}
	}
}

</script>
<div  class="container">
            <h3 class="text-center">${log}</h3>
            <hr>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="carousel slide" id="carousel-896769">
				<ol class="carousel-indicators">
					<li class='active' data-slide-to="0" data-target="#carousel-896769">
					</li>
					<li data-slide-to="1" data-target="#carousel-896769">
					</li>
					<li data-slide-to="2" data-target="#carousel-896769">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
						<img alt="" src="Background/4.jpg" />
						<div class="carousel-caption">
							<h4>
								欢迎
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="Background/11.jpg" />
						<div class="carousel-caption">
							<h4>
								欢迎
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="Background/3.jpg" />
			            	<div class='carousel-caption'>
			            	<h4>
								欢迎
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
							</div>
					</div>
				</div> <a class="carousel-control  left" href="#carousel-896769" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
				       <a class="carousel-control right " href="#carousel-896769" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
			</div>
			
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-8 column">
			<table  class="table table-bordered table-hover">
				<thead>
					<tr>
						<th>
							姓名
						</th>
						<th>
							学号
						</th>
						<th>
							性别
						</th>
						<th>
							专业
						</th>
						<th>
							密码
						</th>
					</tr>
				</thead>
				<tbody id="tt">
					
				</tbody>
			</table>
			<!--开始--><div class="col-md-12 column">
			<div class="panel-group" id="panel-621224">
				<div class="panel panel-default">
					<div class="panel-heading">
						 <a class="panel-title" data-toggle="collapse" data-parent="#panel-621224" href="#panel-element-734243">新建用户</a>
					</div>
					<div id="panel-element-734243" class="panel-collapse in">
						<div class="panel-body">
							<div class="col-md-12 column">
			<form role="form" class="form-inline" action="" method="post">
				<div class="form-group">
					 <label for="exampleInputEmail1">姓名：</label><input type="text" class="form-control" id="e1" />
				</div>
				<div class="form-group">
					 <label for="exampleInputPassword1">学号：</label><input type="text" class="form-control" id="e2" />
				</div>
				<div class="form-group">
					 <label for="exampleInputPassword1">专业：</label><input type="text" class="form-control" id="e3" />
				</div>
				<div class="form-group">
					 <label for="exampleInputPassword1">密码：</label><input type="password" class="form-control" id="e4" />
				</div><br>
				<div class="form-group">
					 <label for="exampleInputPassword1">性别：</label><select class="custom-select" id="e5">
					<option value="男">男
					<option value="女">女
				</select>
				</div>
	<button class="btn btn-primary btn-lg btn-block" type="button" onclick="createU()" >新建学生   <i class="fa fa-thumbs-up" style="font-size:48px;color:red"></i></button>
			</form>
		</div>
						</div>
					</div>
				</div>
				
			</div>
	<!-- 结束 -->	</div>
			
			
		</div>
		<div class="col-md-4 column">
			 <button  id="ww" type="submit" class="btn btn-primary btn-lg btn-block">查询全部用户   <i class="fa fa-angellist"></i></button>
			 <br>
			<form class="form-horizontal" role="form" method="post">
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">姓名</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="username" name="username" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputPassword3" class="col-sm-2 control-label">学号</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="s_number" name="s_number"  />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputPassword3" class="col-sm-2 control-label">专业</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="workfor" name="workfor"  />
					</div>
				</div>
				<div class="form-group">
					<div align="center" class="col-sm-offset-2 col-sm-10">
						 <button id="get" type="button" class="btn btn-default" onclick="dd()">查询</button> 
                    </div>
                </div>
			</form>
		</div>
	</div>
</div>
<div class="modal fade" id="customerEditDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">修改客户信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="edit_customer_form">
					<input type="hidden" id="edit_cust_id" name="cust_id"/>
					<div class="form-group">
						<label for="edit_customerName" class="col-sm-2 control-label">姓名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="x1"/>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_linkMan" class="col-sm-2 control-label">学号</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="x2"  />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_phone" class="col-sm-2 control-label">专业</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="x3"/>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_mobile" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="x4"  />
						</div>
					</div>
				         <div class="form-group">
						<label for="edit_custLevel" style="float:left;padding:7px 15px 0 27px;">&nbsp &nbsp &nbsp &nbsp性别</label>
						<div class="col-sm-10">
							<select	class="form-control" id="x5" name="cust_level">
								    <option value="男">男</option>
									<option value="女">女</option>
							</select>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="updateCustomer()">保存修改</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>