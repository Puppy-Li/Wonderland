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
<%@page import="util.DataBaseUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*,java.sql.*,java.text.*,services.LoginService,services.EditInfoService, util.StringUtils,bean.*,java.text.SimpleDateFormat,org.apache.commons.fileupload.*" %> 
<%
String sql="update t_user set username=?,password=?,email=?,address=?,telephone=?,headerPic=? where id = ?";
String username = request.getParameter("username");
String password = request.getParameter("password");
String email= request.getParameter("useremail");
String address= request.getParameter("address");
String headerPic= request.getParameter("headerPic");
String phone = request.getParameter("phone");
System.out.println(username+" "+password+" "+email+" "+address+" "+headerPic+" "+phone);

InputStream str = new FileInputStream(headerPic);    
Statement stmt = DataBaseUtils.getConnection().createStatement();  
System.out.println("连接成功");  

LoginService loginService = new LoginService();
User user = loginService.getUser(username);

PreparedStatement pstmt = DataBaseUtils.getConnection().prepareStatement(sql);  
pstmt.setString(1, username);  
pstmt.setString(2, password);  
pstmt.setString(3, email);  
pstmt.setString(4, address);  
pstmt.setString(5, phone);

long l = (long) str.available();  
pstmt.setBinaryStream(6, str, l);  
pstmt.setString(7,user.getId());
try {  
    pstmt.executeUpdate();  
} catch (Exception e) {   
    out.print(e.getMessage());  
}  
System.out.println("Success!");  
user.setId(user.getId());
user.setUsername(username);
user.setPassword(password);
user.setEmail(email);
user.setTelephone(phone);
user.setAddress(address);
user.setHeaderPic(headerPic);

EditInfoService.editUser(user);
session.setAttribute("user", user);
session.setAttribute("username",user.getUsername());
session.setAttribute("headerPic",user.getHeaderPic());
response.sendRedirect(basePath + "/editInfo.jsp");
%>