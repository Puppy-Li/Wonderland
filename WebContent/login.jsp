<%
    String path = request.getContextPath();
    int port = request.getServerPort();
    String basePath  = null;
    if(port==80){
        basePath = request.getScheme()+"://"+request.getServerName()+path;
    }else{
        basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    }
    request.setAttribute("basePath", basePath);
%><%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="./Static/css/loginStyle.css">
         <style>
    nav ul li a{
   color:#FFFFFF;
   }
  </style>
    </head>
    <body onkeydown="keyLogin();">
        <!-- 头部页面 -->
<%@include file="./Common/header.jsp" %>

<!-- 登陆框 -->
<div class="biggest">
 
    <div class="">
        <input type="text" id="username" autofocus="autofocus" autocomplete="off" maxlength="60" placeholder="请输入账号/邮箱/手机号">
        <i style='font-size:20px;margin-left:-32px;opacity:0.8;' class='iconfont icon-yonghuming'></i>
    </div>
    <div class="">
        <input type="password" id="password" autofocus="autofocus" autocomplete="off" maxlength="60" placeholder="请输入密码">
        <i style='font-size:20px;margin-left:-32px;opacity:0.8;' class='iconfont icon-mima'></i>
    </div>
    
    <div class="">
        <button id="login" class="btn" onclick="login()">登录</button>
    </div>
</div>



<script type="text/javascript">
function login(){
    var username = $('#username').val();
    var password = $('#password').val();
    $.ajax({
        type:"post",//请求方式
        url:"${basePath}/Controller/loginController.jsp",//请求地址
        data:{"username":username,"password":password},//传递给controller的json数据
        success:function(data){ //返回成功执行回调函数。
            if(data == -1){
                alert('用户名和密码不能为空！');
            }else if(data == -2){
                alert('用户名不存在！');
            }else if(data == -3){
                alert('用户名或密码错误！');
            }else{
                //登录成功后返回首页
                window.location.href = "${basePath}"; 
            }
        },
        error:function(){//如果出错了，将事件重新绑定
            alert("登录出错！");
        }
        
    });
    
    function keyLogin(){  
    	   if (event.keyCode==13){  //回车键的键值为13  
    	        document.getElementById("login").click(); //调用登录按钮的登录事件  
    	    }  
    	}  
}

$(document).ready(function() {  
    //username验证  
   $("#username").focus(function() {
	   $("#username").css("background-color", "rgba(0, 0, 0, 0.2)"); 
	   $("#username").css("box-shadow", "0 0 5px 1px rgba(255,255,255,.5)");
	   $("#username").css("overflow", "hidden"); 
         });
    $("#username").blur(function() {  
        $("#username").css("background", "rgba(255, 255, 255, 0.4) no-repeat scroll 16px 16px"); 
    });  
    //password验证
    $("#password").focus(function() {
 	   $("#password").css("background-color", "rgba(0, 0, 0, 0.2)"); 
 	   $("#password").css("box-shadow", "0 0 5px 1px rgba(255,255,255,.5)");
 	   $("#password").css("overflow", "hidden"); 
          });
     $("#password").blur(function() {  
         $("#password").css("background", "rgba(255, 255, 255, 0.4) no-repeat scroll 16px 16px"); 
     });  
});  
</script>
    </body>
</html>
