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
int studyYear=0,studyMonth=0,graduateYear=0,graduateMonth=0;
String id=request.getParameter("id");
String school = request.getParameter("school");
String syear=request.getParameter("studyYear");
String smonth = request.getParameter("studyMonth");
String gyear = request.getParameter("graduateYear");
String gmonth = request.getParameter("graduateMonth");

String major = request.getParameter("major");
String degree = request.getParameter("degree");
String isEntrance = request.getParameter("isEntrance");
String ExtraComment = request.getParameter("ExtraComment").trim();

if(id==null||id.equals("")){
	out.println("-1");
}else if (StringUtils.isEmpty(school)||StringUtils.isEmpty(syear)||StringUtils.isEmpty(smonth)||StringUtils.isEmpty(gyear)||StringUtils.isEmpty(gmonth)||StringUtils.isEmpty(major)||StringUtils.isEmpty(degree)||StringUtils.isEmpty(isEntrance)||StringUtils.isEmpty(ExtraComment)){
	out.print("-2");//错误码-2 :   请填入完整信息
}
else{
	out.print("1"); 
	if(syear!=null||!syear.equals("")){
		studyYear = Integer.parseInt(request.getParameter("studyYear"));}
		if(smonth!=null||!smonth.equals("")){
		studyMonth = Integer.parseInt(request.getParameter("studyMonth"));}
		if(gyear!=null||!gyear.equals("")){
		graduateYear = Integer.parseInt(request.getParameter("graduateYear"));}
		if(gmonth!=null||!gmonth.equals("")){
		graduateMonth = Integer.parseInt(request.getParameter("graduateMonth"));}
DataBaseUtils.getConnection();
LoginService loginService = new LoginService();
User user = loginService.getId(id);
user.setSchool(school);
user.setStudyYear(studyYear);
user.setStudyMonth(studyMonth);
user.setGraduateYear(graduateYear);
user.setGraduateMonth(graduateMonth);
user.setMajor(major);
user.setDegree(degree);
user.setIsEntrance(isEntrance);
user.setExtraComment(ExtraComment);
EditInfoService.editEducateInfo(user);
session.setAttribute("user", user);
session.setAttribute("username",user.getUsername());
}
%>