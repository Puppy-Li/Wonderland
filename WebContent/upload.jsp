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
    </head>
    <body>
        <!-- 头部页面 -->
<%@include file="./Common/header.jsp" %>
   <form method="post" action="./Controller/uploadController.jsp">
    <table cellspacing="0" cellpadding="0" width="100%" border="0" height="296" id="table212">  
  
        <tr>  
            <td width="20%" height="35" >  
                <span class="login_txt"> 性别 ：    </span>  
            </td> 
            <td width="90" id="gender"><input type="radio" id="male" value="0" name="sex"> 男
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" id="female" value="1" name="sex"> 女
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            </td>  
            
        </tr>  
        <tr><td>
         Address: <input type="text" id="address" name="address" value="${user.address}">
        </td></tr>
         <tr><td>
         Phone: <input type="text" id="phone" name="phone" value="${user.telephone}">
        </td></tr>
        <tr>  
            <td width="20%" height="35"> </td>  
            <td >  
                <input name="submit" type="button" id="submit" value="Save"   onclick="check()"/>
                <input type="submit" name="submit" value="submit"/>
            </td>  
        </tr>  
    </table>  
</form>

<script type="text/javascript">  
   
  
    function check(){
        var address = $('#address').val();
        var sex = $("input[name='sex']:checked").val();
        var phone = $('#phone').val();
        alert(sex+" "+address+" "+phone);
        $.ajax({
            type:"post",//请求方式
             url:"${basePath}/Controller/uploadController.jsp",
             data:{"address":address,"sex":sex,"phone":phone},
       
             success:function(data){ 
             	
 			},
 			error:function(){
             
             }
     	 });
    }


 	
</script>  
    </body>
</html>
