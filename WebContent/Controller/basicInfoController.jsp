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

String id = request.getParameter("id");
String username = request.getParameter("username");
int age = Integer.parseInt(request.getParameter("age"));
String political_status = request.getParameter("political_status");
int birthYear = Integer.parseInt(request.getParameter("birthYear"));
int birthMonth = Integer.parseInt(request.getParameter("birthMonth"));
int birthDay = Integer.parseInt(request.getParameter("birthDay"));
String marital_status = request.getParameter("marital_status");

String year=request.getParameter("birthYear");
String month=request.getParameter("birthMonth");
String day=request.getParameter("birthDay");
System.out.println(username);
if(username.equals("")||username==null){
    out.print("-1");//错误码-1 :   用户名为空，请登录或注册
}
else if (StringUtils.isEmpty(political_status)||StringUtils.isEmpty(year)||StringUtils.isEmpty(month)||StringUtils.isEmpty(day)||StringUtils.isEmpty(marital_status)){
	out.print("-2");//错误码-2 :   请填入完整信息
}
else{
	out.print("1"); //保存成功
	DataBaseUtils.getConnection();
	LoginService loginService = new LoginService();
	User user = loginService.getUser(username);
	user.setId(id);
	user.setAge(age);
	user.setPolitical_status(political_status);
	user.setBirthYear(birthYear);
	user.setBirthMonth(birthMonth);
	user.setBirthDay(birthDay);
	user.setMarital_status(marital_status);
	EditInfoService.editBasicInfo(user);
	session.setAttribute("user", user);
	session.setAttribute("username",user.getUsername());
}
%>