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
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"
import="java.util.*,services.*,util.StringUtils,bean.*,util.DataBaseUtils,java.text.SimpleDateFormat"%>
<%
request.setCharacterEncoding("UTF-8");

String city = request.getParameter("city");
String username = session.getAttribute("username").toString();
if(username.equals("")||username==null){
    out.print("-1");//错误码-1 :   用户名为空，请登录或注册
}
else if (StringUtils.isEmpty(city)){
	out.print("-2");//错误码-2 :   请输入一个地点
}
else{
	out.print("1"); //查询成功
	DataBaseUtils.getConnection();
	LoginService loginService = new LoginService();
	User user = loginService.getUser(username);
	user.setCity(city);
	user.setUsername(username);
	loginService.getTravel(username,city);
	
	session.setAttribute("user", user);
	session.setAttribute("searchCity", city);
	session.setAttribute("username",user.getUsername());
}
%>