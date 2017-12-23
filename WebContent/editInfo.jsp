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
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="services.LoginService,services.CommentService,bean.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<% 
String username = request.getParameter("username");
LoginService loginService = new LoginService();
User user = loginService.getUser(username);
pageContext.setAttribute("user", user);
 %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Personal Information</title>
<script src="${basePath}/Static/js/jQuery.js"></script>
</head>
<body>
            <!-- 头部页面 -->
<%@include file="./Common/header.jsp" %>


<form method="post" action="./Controller/editInfoController.jsp" >
  <table>
    <tr>
    <td> 用户名： <input type="text" id="username" name="username" value="${sessionScope.username}"/>
   </td>
    </tr>
    <tr>
    <td>修改密码： <input type="password" id="password" name="password" value="${user.password}"/></td>
    </tr>
    <tr>
    <td>邮箱： <input type="text" id="useremail" name="useremail" value="${user.email}"/></td>
    </tr>
     <tr>
    <td>性别： <input type="radio" id="male" name="sex" value="0"/>男
     <input type="radio" id="female" name="sex" value="1"/>女
     </td>
     
    </tr>
    <tr>
    <td>创建时间： <input type="text" id="createtime" value="${user.createTime}" disabled="disabled"/></td>
    </tr>
    <tr>
    <td>地址： <input type="text" name="address" id="address" value="${user.address}"/></td>
    </tr>
    <tr>
    <td>电话： <input type="text" name="phone" id="phone" value="${user.telephone}"/>
    </td>
    </tr>
    <tr>
    <td>头像:<img id="selfiePreview" style="display:block;"/>
            <div id="selfie">${user.headerPic}</div>
            <input type="file" name="headerPic" id="headerPic" onchange="UploadImg(this)" accept="image/png, image/jpeg,image/jpg" value="选择图片"/>
            <!-- <input type="button" value="隐藏图片" onclick="document.getElementById('selfiePreview').style.display = 'none';"/>
                <input type="button" value="显示图片" onclick="document.getElementById('selfiePreview').style.display = 'block';"/> -->
    </td>
    </tr>
    <tr><td><input type="submit" name="submit" value="submit"/>
    <input type="reset" value="清除" name="clear" onclick="document.getElementById('selfiePreview').style.display = 'none';"> </td></tr>
  </table>
  </form>

<script type="text/javascript">

            //图片上传预览    
            //判断浏览器是否支持FileReader接口
            if (typeof FileReader == 'undefined') {
                document.getElementById("selfie").InnerHTML = "<h1>当前浏览器不支持FileReader接口</h1>";
                //使选择控件不可操作
                document.getElementById("selfiePreview").setAttribute("disabled", "disabled");
            }
          
            //选择图片，马上预览
            function UploadImg(obj) {
            	
                var file = obj.files[0];
                console.log("file.size = " + file.size);  //file.size 单位为byte
                var reader = new FileReader();
                //读取文件过程方法
                reader.onloadstart = function (e) {
                    console.log("开始读取....");
                };
                reader.onprogress = function (e) {
                    console.log("正在读取中....");
                };
                reader.onabort = function (e) {
                    console.log("中断读取....");
                };
                reader.onerror = function (e) {
                    console.log("读取异常....");
                };
                reader.onload = function (e) {
                    console.log("成功读取....");

                    var img = document.getElementById("selfiePreview");
                    img.src = e.target.result;
                    //或者 img.src = this.result;  //e.target == this
                };

                reader.readAsDataURL(file);
            }

            function save(){
            	
            	var username = $('#username').val();
                var password = $('#password').val();
                var address=$('#address').val();
                var email = $('#useremail').val();
                var sex = $("input[name='sex']:checked").val();
                var phone = $('#phone').val();
                var headerPic=$('#headerPic').val();
                
                $.ajax({
                    type:"post",//请求方式
                     url:"${basePath}/Controller/editInfoController.jsp",//请求地址
                     data:{"username":username,"password":password,"address":address,"useremail":email,"phone":phone,"headerPic":headerPic},//传递给controller的json数据
               
                     success:function(data){ //返回成功执行回调函数。
                     	
         			},
         			error:function(){//如果出错了，将事件重新绑定
                         alert("保存失败！");
                     }
             	 });
            }

            function getFilePath(input){  
            	    if(input){//input是<input type="file">Dom对象  
            	        if(window.navigator.userAgent.indexOf("MSIE")>=1){  //如果是IE    
            	           input.select();      
            	          return document.selection.createRange().text;      
            	        }      
            	        else if(window.navigator.userAgent.indexOf("Firefox")>=1){  //如果是火狐  {      
            	            if(input.files){      
            	                return input.files.item(0).getAsDataURL();      
            	            }      
            	            return input.value;      
            	        }      
            	       return input.value;   
            	    }  
            	}  
            	            
        </script>
</body>
</html>