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
<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="services.LoginService,services.CommentService,bean.*"%>
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
<title>User Information</title>
<link rel="stylesheet" href="./Static/css/uploadStyle.css">
 <style>
    nav ul li a{
   color:#FFFFFF;
   }
  </style>
</head>
<body>
            <!-- 头部页面 -->
<%@include file="./Common/header.jsp" %>
<div class="biggest">
<form method="post" action="/Wonderland/UploadServlet" enctype="multipart/form-data" >
    <table id="info">
    <tr>
    <td> <label>用户名：</label> 
   </td>
   <td><input type="text" id="username" name="username" value="${sessionScope.username}"/></td>
    </tr>
    <tr>
    <td> <label>修改密码：</label> 
   </td>
    <td> <input type="password" id="password" name="password" value="${user.password}"/></td>
    </tr>
    <tr>
    <td> <label>邮箱：</label> 
   </td>
    <td> <input type="text" id="useremail" name="useremail" value="${user.email}"/></td>
    </tr>
     <tr>
      <td> <label>性别：</label> 
   </td>
    <td id="gender"> <input type="radio" id="male" name="sex" value="0"/>男
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <input type="radio" id="female" name="sex" value="1"/>女
     </td>
     
    </tr>
    <tr>
    <td> <label>创建时间：</label> 
   </td>
    <td> <input type="text" id="createtime" value="${user.createTime}" disabled="disabled"/></td>
    </tr>
    <tr>
     <td> <label>地址： </label> 
   </td>
    <td><input type="text" name="address" id="address" value="${user.address}"/></td>
    </tr>
    <tr>
    <td> <label>电话： </label> 
   </td>
    <td> <input type="text" name="phone" id="phone" value="${user.telephone}"/>
    </td>
    </tr>
    <tr>
    <td> <label>头像: </label> 
   </td>
    <td><img id="selfiePreview" style="display:block;" src="${user.headerPic}" name="photo"/>
            <div id="selfie"></div>
            <input type="file" name="headerPic" id="headerPic" onchange="UploadImg(this)" accept="image/png, image/jpeg,image/jpg" value="选择图片"/>
            <!-- <input type="button" value="隐藏图片" onclick="document.getElementById('selfiePreview').style.display = 'none';"/>
                <input type="button" value="显示图片" onclick="document.getElementById('selfiePreview').style.display = 'block';"/> -->
    </td>
    </tr>
    </table>
    <table>
    <tr><td id="buttons"><input type="submit" name="submit" value="submit" class="btn" /></td>
    <td><input type="reset" value="Clear" name="clear" class="btn" onclick="document.getElementById('selfiePreview').style.display = 'none';"> </td></tr>
  </table>
</form>
</div>

<script>
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

</script>
</body>
</html>