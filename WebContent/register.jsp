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
%>
<%@page contentType="text/html"%>
<%@ page language="java" import="java.util.*,services.RegisterService,util.StringUtils,bean.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
  <script src="${basePath}/Static/js/jQuery.js"></script>
  <link rel="stylesheet" href="./Static/css/registerStyle.css">
 <style>
    nav ul li a{
   color:#FFFFFF;
   }
  </style>
    </head>
    <body onkeydown="keyLogin();">
        <!-- 头部页面 -->
<%@include file="./Common/header.jsp" %>
    <div class="biggest">
    <table id="info">  
        <tr >  
            <td >  
                <label for="username"> 帐 号：   </label> <font color="red">*</font>
            </td>  
            <td >  
                <input  id="username" name="username" title="请输入英文字母">  
            </td>  
            <td style="display: none;" id="usernameRight"> <img src="./Static/imgs/happy.png" width="19" ></img>  </td>
            <td id="usernameError"   colspan="2"  style="display:none;">  
                <img style="display: none;" id="userSad"
                    src="./Static/imgs/sad.png" width="19" ></img><font color="#EDEDED" size="-1">帐号格式不正确</font>  
            </td>  
        </tr>  
        <tr>  
            <td >  
                <label for="userpassword"> 密 码：    </label>  <font color="red">*</font>
            </td>  
            <td >  
                <input type="password" id="userpassword" name="userpassword" title="请输入6~16位的密码">   
                  
                
            </td>  
            <td style="display: none;" id="userpasswordRight"><img 
                    src="./Static/imgs/happy.png" width="19" ></img>  </td>
            <td id="userpasswordError" colspan="2"  style="display:none">  
               <img style="display: none;" id="psdSad"
                    src="./Static/imgs/sad.png" width="19" ></img>  <font color="#EDEDED" size="-1">密码需6-16位</font>  
            </td>  
        </tr>  
        <tr>  
            <td >  
                <label for="userpassword1"> 密码确认：    </label>  <font color="red">*</font>
            </td>  
            <td >  
                <input type="password"  id="userpassword1" name="userpassword1">   
                   
               
            </td>
            <td style="display: none;" id="userpassword1Right"> <img 
                    src="./Static/imgs/happy.png" width="19" ></img>  </td>  
            <td id="userpassword1Error"   style="display:none">  
                <img style="display: none;" id="psdconfigSad"
                    src="./Static/imgs/sad.png" width="19" ></img><font color="#EDEDED" size="-1">两次密码不一致</font>  
            </td>  
        </tr>  
        <tr>  
            <td >  
                <label for="useremail"> 邮 箱：    </label>  <font color="red">*</font>
            </td>  
            <td >  
                <input  id="useremail" name="useremail"> 
            </td>  
            <td style="display: none;" id="useremailRight"> <img 
                    src="./Static/imgs/happy.png" width="19"></img>  </td>
            <td id="useremailError" colspan="2"  style="display:none">  
                <img style="display: none;" id="emailSad"
                    src="./Static/imgs/sad.png" width="19" ></img><font color="#EDEDED" size="-1">邮箱格式不正确</font>  
            </td>  
        </tr>  
        <tr>  
            <td  >  
                <label > 性别 ：    </label>  <font color="red">*</font>
            </td> 
            <td id="gender"><input type="radio" id="male" value="0" name="sex"> 男
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" id="female" value="1" name="sex" > 女
                
            </td> 
            <td style="display: none;" id="sexRight"><img 
                    src="./Static/imgs/happy.png" width="19" ></img>  </td> 
            <td id="sexError"  colspan="2"  style="display:none">  
                &nbsp;&nbsp;<img style="display: none;" id="sexSad"
                    src="./Static/imgs/sad.png" width="19"></img><font color="#EDEDED" size="-1">请选择性别</font>  
            </td>  
        </tr>  
        <tr>  
            <td  >  
                <label for="userphone"> 手 机：    </label> <font color="red">*</font> 
            </td>  
            <td ><input id="userphone" name="userphone">   
                 
            </td>  
            <td style="display: none;" id="userphoneRight"><img 
                    src="./Static/imgs/happy.png" width="19" ></img> </td>
            <td id="userphoneError"   style="display:none">  
                <img style="display: none;" id="phoneSad"
                    src="./Static/imgs/sad.png" width="19" ></img><font color="#EDEDED" size="-1">手机号码格式不正确</font>  
            </td>  
        </tr>  
        <tr>  
            <td > </td>  
            <td >  
                <input class="btn" name="submit" type="button" id="submit" value="注册" onclick="check()"/>
            </td>  
        </tr>  
    </table>  
</div>

<script type="text/javascript">  
    $(document).ready(function() {  
        //username验证  
       $("#username").focus(function() {
    	   $("#username").css("background-color", "rgba(0, 0, 0, 0.2)"); 
    	   $("#username").css("box-shadow", "0 0 5px 1px rgba(255,255,255,.5)");
    	   $("#username").css("overflow", "hidden"); 
             });
        $("#username").blur(function() {  
            var regtitle = /^[a-zA-Z][a-zA-Z0-9_]*$/;  
            var uname = $("#username").val();  
            $("#username").css("background", "rgba(255, 255, 255, 0.4) no-repeat scroll 16px 16px"); 
            if (uname.length <= 0 || !regtitle.test(uname)) {  
                $("#usernameRight").hide();  
                $("#usernameError").show();  
                $("#userSad").show(); 
            } else {  
                $("#usernameRight").show();  
                $("#usernameError").hide();  
            }  
        });  
        //password验证  
       $("#userpassword").focus(function() {
    	   $("#userpassword").css("background-color", "rgba(0, 0, 0, 0.2)"); 
    	   $("#userpassword").css("box-shadow", "0 0 5px 1px rgba(255,255,255,.5)");
    	   $("#userpassword").css("overflow", "hidden"); 
             });
        $("#userpassword").blur(function(){  
            var upassword = $("#userpassword").val();  
            $("#userpassword").css("background", "rgba(255, 255, 255, 0.4) no-repeat scroll 16px 16px"); 
            if (upassword.length > 5 && upassword.length < 17) {  
                $("#userpasswordRight").show();  
                $("#userpasswordError").hide();  
            } else {  
                $("#userpasswordRight").hide();  
                $("#userpasswordError").show();  
                $("#psdSad").show(); 
            }  
        });  
      //password1验证  
        $("#userpassword1").focus(function() {
    	   $("#userpassword1").css("background-color", "rgba(0, 0, 0, 0.2)"); 
    	   $("#userpassword1").css("box-shadow", "0 0 5px 1px rgba(255,255,255,.5)");
    	   $("#userpassword1").css("overflow", "hidden"); 
             });
        $("#userpassword1").blur(function(){  
            var upassword = $("#userpassword").val();  
            var upassword1 = $("#userpassword1").val();  
            $("#userpassword1").css("background", "rgba(255, 255, 255, 0.4) no-repeat scroll 16px 16px"); 
            if ((upassword1 == null)||(upassword1 != upassword)){  
                $("#userpassword1Right").hide();  
                $("#userpassword1Error").show();  
                $("#psdconfigSad").show();
            } else {  
                $("#userpassword1Right").show();  
                $("#userpassword1Error").hide();  
            }  
        });  
        //userphone验证  
       $("#userphone").focus(function() {
    	   $("#userphone").css("background-color", "rgba(0, 0, 0, 0.2)"); 
    	   $("#userphone").css("box-shadow", "0 0 5px 1px rgba(255,255,255,.5)");
    	   $("#userphone").css("overflow", "hidden"); 
             });
        $("#userphone").blur(function() {  
            var regphone = /^(13[0-9]|15[0-9]|18[0-9]|16[0-9])\d{8}$/;  
            var uphone = $("#userphone").val();  
            $("#userphone").css("background", "rgba(255, 255, 255, 0.4) no-repeat scroll 16px 16px"); 
            if (uphone.length <= 0 || !regphone.test(uphone)) {  
                $("#userphoneRight").hide();  
                $("#userphoneError").show();  
                $("#phoneSad").show(); 
            } else {  
                $("#userphoneRight").show();  
                $("#userphoneError").hide();  
            }  
        });  
        //usereamil验证  
       $("#usereamil").focus(function() {
    	   $("#usereamil").css("background-color", "rgba(0, 0, 0, 0.2)"); 
    	   $("#usereamil").css("box-shadow", "0 0 5px 1px rgba(255,255,255,.5)");
    	   $("#usereamil").css("overflow", "hidden"); 
             });
             
        $("#useremail").blur(function() {  
            var regemail = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;  
            var uemail = $("#useremail").val();  
            $("#useremail").css("background", "rgba(255, 255, 255, 0.4) no-repeat scroll 16px 16px"); 
            if (uemail.length <= 0 || !regemail.test(uemail)) {  
                $("#useremailRight").hide();  
                $("#useremailError").show();  
                $("#emailSad").show(); 
            } else {  
                $("#useremailRight").show();  
                $("#useremailError").hide();  
            }  
        });  
        //sex验证  
        $("#male").blur(function() {  
            var male = $("#male").val(); 
            var female = $("#female").val();  
            
            if (!male.checked) {  
            	$("#sexRight").show();  
                $("#sexError").hide();  
            } else {  
            	$("#sexRight").hide();  
                $("#sexError").show(); 
                $("#sexSad").show(); 
                
            }  
        });  
    });  
    $("#female").blur(function() {  
        var male = $("#male").val(); 
        var female = $("#female").val();  
        
        if (!female.checked) {  
        	$("#sexRight").show();  
            $("#sexError").hide();  
        } else {  
        	$("#sexRight").hide();  
            $("#sexError").show(); 
            $("#sexSad").show(); 
            
        }  
    });  
  
    function check(){
    	var username = $('#username').val();
        var password = $('#userpassword').val();
        var psdconfig=$("#userpassword1").val();
        var email = $('#useremail').val();
        var sex = $("input[name='sex']:checked").val();
        var telephone = $('#userphone').val();
        
        $.ajax({
            type:"post",//请求方式
             url:"${basePath}/Controller/registerController.jsp",//请求地址
             data:{"username":username,"password":password,"psdconfig":psdconfig,"email":email,"sex":sex,"telephone":telephone},//传递给controller的json数据
       
             success:function(data){ //返回成功执行回调函数。
             	if(data==-1){alert("请填入完整信息!");}
             	else if(data==-3){alert("用户名已存在!");}
             	else if(data==-2){alert("请填入合法信息!");}
             	else if(data==1){
                 	alert("注册成功!");
                 	window.location.href = "${basePath}";
                 	 }
 			},
 			error:function(){//如果出错了，将事件重新绑定
                 alert("注册失败！");
             }
     	 });
    }

    function keyLogin(){  
 	   if (event.keyCode==13){  //回车键的键值为13  
 	        document.getElementById("submit").click(); //调用登录按钮的登录事件  
 	    }  
 	}    

    $(function() {
        $( "#username" ).tooltip({
          track: true,  //鼠标跟随
          
          show: {
            effect: "slideDown",
            delay: 250     
          },
          hide: {
              delay: 250
            }
       
        });
    });

    $(function() {
        $( "#userpassword" ).tooltip({
          track: true,  //鼠标跟随
          
          show: {
            effect: "slideDown",
            delay: 250     
          },
          hide: {
              delay: 250
            }
       
        });
    });
</script>  
    </body>
</html>
