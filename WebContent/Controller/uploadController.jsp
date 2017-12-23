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
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page language="java" import="java.util.*,services.LoginService,services.RegisterService, util.StringUtils,bean.*,java.text.SimpleDateFormat" pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
int sex = Integer.parseInt(request.getParameter("sex"));
String address= request.getParameter("address");
String phone = request.getParameter("phone");
System.out.println(sex+" "+address+" "+phone);
%>