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

<%@ page language="java" import="java.util.*,services.CommentService, bean.*" pageEncoding="UTF-8"%>
<%
    String txt = request.getParameter("txt").toString();
    User user = (User)session.getAttribute("user");
  //因为评论是需要登陆的,如果没有登陆我们就调整到登陆页面去 
    if((user==null&&txt!=null)||(user==null&&txt==null)){//代表用户没有登陆
        out.print("-1");
        return;
    }else if(user!=null&&txt!=null){
    	String articleId = request.getParameter("articleId").toString();
        CommentService commentService = new CommentService();
        Comments comment = new Comments();
        comment.setId(UUID.randomUUID().toString());
        comment.setUserId(user.getId());
        comment.setArticleId(articleId);
        comment.setContent(txt);
    	commentService.saveComment(comment);
    	out.print("1");
    	return;
    }  
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Comments</title>
</head>
<body>

</body>
</html>