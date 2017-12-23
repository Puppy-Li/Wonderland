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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="services.ArticleService"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Articles</title>
        
    </head>
    <body>
        <!-- 头部页面 -->
<%@include file="./Common/header.jsp" %>

<style>
.category {
    margin-top: 10px;
    margin-bottom:20px;
}
    
.category .title {
    margin-bottom: 10px;
    border-bottom: 1px solid #cac5c5;
    height: 30px;
    text-indent:1em;
    font-size:18px;
    color:#666;
}

.category .items {
    margin-left:10px;
}

.category .items .item {
    width: 230px;
    height: 320px;
    background: #ccc;
    margin: 20px;
    float: left;
    margin-right:20px;
    cursor:pointer;
}
.category .items .item div {
    text-align:center;
}
.item-banner {
    background: #666;
    color: #FFF;
}
.item-header {
    font-size: 12px;
    line-height: 52px;
}
.item-name {
    font-size: 22px;
    line-height: 74px;
       white-space:nowrap;
       overflow:hidden;
       text-overflow: ellipsis; 
}
.item-author {
    font-size: 14px;
    text-indent: 7em;
    padding-bottom: 70px;
}
.item-description {
    background: #eee;
    height: 104px;
    line-height: 76px;
    text-indent: 3em;
    font-size: 12px;
}
</style>

<div class='category'>
    <div class='title'>连载小说</div>
    <ul class='items'>
        <li class='item'>
    <div class='item-banner'>
        <div class='item-header'>生活中总是充满了乐趣</div>
        <div class='item-name'>聊聊我的大学室友</div>
        <div class='item-author'>@张三 著</div>
    </div>
    <div class='item-description'>那些回忆，那些事。。。</div>
</li>
        <li class='item'></li>
        <li class='item'></li>
        <div style='clear:both'></div>
    </ul>
</div>
<% ArticleService articleService = new ArticleService(); %>
<%
    //查询出编程代码类的相关文章
    List<Map<String,Object>>  articles2 = articleService.getArticlesByCategoryId(2, 0, 6);
    pageContext.setAttribute("articles2", articles2);
%>

<!--${articles2}-->
<div class='category'>
    <div class='title'>编程代码类</div>
    <ul class='items'>
        <c:forEach items="${articles2}" var="item">
            <li class='item' onclick="detail('${item.id}');">
                <div class='item-banner'>
                    <div class='item-header'>${item.header}</div>
                    <div class='item-name' title = "${item.name}">${item.name}</div>
                    <div class='item-author'>@${item.author} 著</div>
                </div>
                <div class='item-description'>${item.description}</div>
            </li>
        </c:forEach>

        <div style='clear:both'></div>
    </ul>
</div>


<script>
//打开详情页
function detail(id){
    var a = document.createElement("a");
    a.href = "detail.jsp?id=" + id; 
    console.log(a);
    a.target = '_new'; //指定在新窗口打开
    a.click();//触发打开事件
}
</script>

</body>
</html>