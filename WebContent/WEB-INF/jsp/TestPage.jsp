<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="CSS/bootstrap-reboot.min.css">
<link rel="stylesheet" type="text/css" href="CSS/font-awesome.css">
<link rel="stylesheet" type="text/css" href="CSS/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="CSS/bootstrap-grid.min.css">
<link rel="stylesheet" type="text/css" href="CSS/xx.css">
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.min.css">
<script  type="text/javascript" src="CSS/jquery-3.5.1.min.js"></script>
<script src="//cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="//cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>学生交流室</title>
</head>
<body>
<body><h1 align="center">${user}</h1>
  Welcome<br/>
  <div class="container">
  	<div class="row clearfix">
		<div class="col-md-8 column">
		
  <div class="form-group">
  <input class="form-control" id="text" type="text"/>
  </div>
  <button onclick="send()">发送</button>
  <button  value="${user}"  id="ddd" onclick="closeWebSocket()">关闭WebSocket连接</button>
  <hr/>
  <div class="col-md-12 column"  >
 	<div id="message" class="box">
        </div>
  </div>
  </div>
  <div class="col-md-4 column">
  
  </div>
  </div>
  </div>
</body>
<script type="text/javascript">
  var sendpeople=$("#ddd").val();
  var websocket = null;
  //判断当前浏览器是否支持WebSocket
  if ('WebSocket' in window) {
    websocket = new WebSocket("ws://192.168.1.106:8081/JEE_NewMYO/websocketPTP");
  }
  else {
    alert('当前浏览器 Not support websocket')
  }
 
  //连接发生错误的回调方法
  websocket.onerror = function () {
    setMessageInnerHTML("WebSocket连接发生错误");
  };
 
  //连接成功建立的回调方法
  websocket.onopen = function () {
    setMessageInnerHTML("WebSocket连接成功<br>");
  }
 
  //接收到消息的回调方法
  websocket.onmessage = function (event) {
    setMessageInnerHTML(event.data);
  }
 
  //连接关闭的回调方法
  websocket.onclose = function () {
    setMessageInnerHTML("WebSocket连接关闭");
  }
 
  //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
  window.onbeforeunload = function () {
    closeWebSocket();
  }
 
  //将消息显示在网页上
  function setMessageInnerHTML(innerHTML) {
    document.getElementById('message').innerHTML += " <div class='item left'><span class='message'>"+innerHTML+"</span></div>"+"<br>";
  }
 
  //关闭WebSocket连接
  function closeWebSocket() {
    websocket.close();
    document.getElementById('message').innerHTML ="";
  }
 
  //发送消息
  function send() {
    var message = $("#text").val();
    $('#text').val(" ");
    document.getElementById('message').innerHTML += " <div class='item right'><span class='message'> 我："+message+"</span></div>"+"<br>";
    websocket.send(message+"+"+sendpeople);
  }
</script>
</html>