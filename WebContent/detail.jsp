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
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="services.ArticleService,services.CommentService"%>
<% ArticleService articleService = new ArticleService(); %>
<%
    String id = request.getParameter("id");
Map<String,Object> map = articleService.getContentByArticleId(id);
pageContext.setAttribute("article", map);

%>
<%
    CommentService commentService = new CommentService();
    List<Map<String,Object>> list = commentService.getCommentsByArticleId(id);
    pageContext.setAttribute("comments", list);
%>


<%@page contentType="text/html" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Details</title>
        <script src="${basePath}/Static/js/jQuery.js"></script>
	
    </head>
    <body>
    <style>
    .article .title {
    text-align: center;
    font-size: 28px;
    color: #565353;
    letter-spacing: 2px;
    margin-top:20px;
    text-align: center;
    font-size: 28px;
    color: #565353;
    letter-spacing: 2px;
    margin-top:20px;
}
.article .light-font{
    font-size:14px;
    color:#666;
}

.article .info{
    font-size:14px;
    color:#3c3a3a;
}
.article .content p{
    text-indent:2em;
    margin-bottom:20px;
    font-family: 微软雅黑;
}
.comment_word {
    margin-top:16px;
}
    </style>
    
        <!-- 头部页面 -->
<%@include file="./Common/header.jsp" %>


<!-- 内容区 -->
<div class='article'>
    <div class='title'>${article.name}</div>
    <div class='category'><span class='light-font'>分类：</span><span class='info'>${article.category_name}</span></div>
    <div class='publicDate'><span class='light-font'>发布时间：</span><span class='info'>${article.create_time}</span></div>
    <hr/>
    <div class='content'>
        ${article.content}
    </div>
</div>

<!-- 评论区 -->
<div class='commentBox'>
    <textarea class="comment_input" id="commenttxt" placeholder="请输入评论信息(600)..." maxlength="600"></textarea>
          <input type="button" value="保存评论" class="button">
</div>
<div class='clearfix'></div>
<br/><hr/>
<div class='mb64' class="comment_list">
<c:forEach items="${comments}" var="comment">
    <div class="comment_infor clearfix">
        <div style='border-bottom:1px solid #ccc' class="comment_word">
             <p style='border-bottom:20px solid #fff'>${comment.username}说：</p>
             <p class='mb32'>${comment.content}</p>
         </div>
    </div>
    </c:forEach>
</div>


<script>
$(".button").eq(0).on('click',function(){
    var txt = $('#commenttxt').val();
    $.post("${basePath}/Controller/CommentController.jsp",{txt : txt , articleId : "${article.id}"},function(data){
        data = data.trim();
        if(data == '-1'){
            alert('请先登录或注册！');
            window.location.href="${basePath}/login.jsp";
        }else if(data == '1'){
            alert('保存成功！');
            location.reload();
        }
    });
});
</script>
</body>
</html>