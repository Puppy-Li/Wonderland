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

//取出参数值
int sex=0;
String username = request.getParameter("username");
String password = request.getParameter("password");
String psdconfig= request.getParameter("psdconfig");
String email= request.getParameter("email");
String stringSex= request.getParameter("sex");
String phone = request.getParameter("telephone");

//初始化LoginService
LoginService loginService = new LoginService();
//接下来判断用户名是否存在
User newuser = loginService.getUser(username);
if(newuser != null){
    out.print("-3");//错误码-3 :   用户名已存在！
}
else if(StringUtils.isEmpty(username) || StringUtils.isEmpty(password)||StringUtils.isEmpty(psdconfig)|| StringUtils.isEmpty(email)|| StringUtils.isEmpty(stringSex)|| StringUtils.isEmpty(phone)){
    out.print("-1");   //错误码-1 :   所有项不能为空！
}else if(!password.equals(psdconfig)||(!StringUtils.testName(username))||(!StringUtils.testEmail(email))||(!StringUtils.testPassword(password))||(!StringUtils.testPhone(phone))){
	out.print("-2");   //错误码-2 :   有非法项！
}else{
	out.print("1");
	if(stringSex!=null||!stringSex.equals("")){
	 sex = Integer.parseInt(request.getParameter("sex"));}
	
	User user=new User();
	user.setId(UUID.randomUUID().toString());
	user.setUsername(username);
	user.setPassword(password);
	user.setEmail(email);
	user.setSex(sex);
	user.setTelephone(phone);
	user.setCreateTime(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()));
	
	RegisterService.insertUser(user);
	session.setAttribute("user", user);
	session.setAttribute("username",user.getUsername());
	
}
%>
