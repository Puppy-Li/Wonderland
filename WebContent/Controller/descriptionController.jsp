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
import="java.util.*,services.LoginService,services.RegisterService, services.EditInfoService,util.StringUtils,bean.*,util.DataBaseUtils,java.text.SimpleDateFormat"%>
<%
request.setCharacterEncoding("UTF-8");
String id=request.getParameter("id");
String description=request.getParameter("description");

if(id==null||id.equals("")){
	out.println("-1");
}else if (StringUtils.isEmpty(description)){
	out.print("-2");//错误码-2 :   请填入完整信息
}
else{
	out.print("1"); 
DataBaseUtils.getConnection();
LoginService loginService = new LoginService();
User user = loginService.getId(id);
user.setDescription(description);
EditInfoService.editDescriptionInfo(user);
session.setAttribute("user", user);
session.setAttribute("username",user.getUsername());

}
%>