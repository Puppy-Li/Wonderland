<%-- 
    Document   : taglib
    Created on : 2017-11-22, 0:47:56
    Author     : LCX
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String path = request.getContextPath();
    int port = request.getServerPort();
    String basePath  = null;   //项目的根路径
    if(port==80){
        basePath = request.getScheme()+"://"+request.getServerName()+path;
    }else{
        basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    }
    request.setAttribute("basePath", basePath);
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
