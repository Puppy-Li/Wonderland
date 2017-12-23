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

<%@ page language="java" contentType="text/html" import="services.LoginService,services.CommentService,bean.*,com.jspsmart.upload.SmartUpload;"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Travel</title>
</head>
<body>
            <!-- 头部页面 -->
<%@include file="./Common/header.jsp" %>

<div>
 <label for="loc">Search Footprint:</label>
<input id="loc" name="loc" placeholder="Please enter a place">
<button onclick="searchSpot()">Search</button>
</div>

<% 
String username = session.getAttribute("username").toString();

    LoginService loginService = new LoginService();
    
    //User user = loginService.getUser(username);
   // pageContext.setAttribute("user", user);
 %>
<form method="post" action="/Wonderland/TravelServlet" enctype="multipart/form-data">
<div><input id="searchCity" name="searchCity" value="${user.city}">
 <div id="touristSpots">景点${user.touristSpot}
  <div>
    <img id="spot1" name="spot1" style="display:block;" width="300px" height="350px" src=${user.touristSpot}>
    <input type="file" name="uploadSpot1" id="uploadSpot1" onchange="UploadImg(this)" accept="image/png, image/jpeg,image/jpg" value="选择图片">
  </div>
 </div>
 <div id="peoples">人物
 <div>
 <img id="people1" src="${user.people}" name="people1" style="display:block;" width="300px" height="350px">
 </div>
 </div>
 <div id="yummy">美食
 <div>
 <img id="food1" src="${user.food}" name="food1" style="display:block;" width="300px" height="350px">
 </div>
 </div>
</div>
<input type="submit" name="submit" value="submit"/>
</form>


<script>
$(function() {
    var availableTags = [
      "北京",
      "杭州",
      "嘉兴",
      "上海",
      "衡阳",
      "深圳",
      "石河子",
      "昆明",
      "丽江",
      "香格里拉",
      "乌镇",
      "苏州",
      "无锡",
      "南京",
      "香港",
      "广州"
    ];
    $( "#loc" ).autocomplete({
      source: availableTags,
      minLength: 0  //加上这个才会显示
    }).click(function () {
    	  // 双击的时候进行查找
    	  $(this).autocomplete('search', '');
    	});
  });

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

        var img = document.getElementById("spot1");
        img.src = e.target.result;
        //或者 img.src = this.result;  //e.target == this
    };

    reader.readAsDataURL(file);
}

  function searchSpot(){
      var city= $('#loc').val();
      //alert(city);
      $.ajax({
	      type:"post",//请求方式
	       url:"${basePath}/Controller/travelController.jsp",//请求地址
	       data:{"city":city},
	 
	       success:function(data){ //返回成功执行回调函数。
	       	if(data==-1){alert("Please login or register first!");
	       	window.location.href = "${basePath}/login.jsp";
	       	}    	
	       	else if(data==-2){
	       		alert("Please enter a place！");
	       	}
	       	else if(data==1){
	           	alert("查询成功！");
	           	window.location.reload();
	           	 }
	       	
			},
			error:function(){//如果出错了，将事件重新绑定
	           alert("查询失败！");
	       }
		 });
	  }

</script>
</body>
</html>