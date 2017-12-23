<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文件上传结果</title>
</head>
<body>
            <!-- 头部页面 -->
<%@include file="./Common/header.jsp" %>

  <script>
  $(function() {
    var progressbar = $( "#proBar" ),
      progressLabel = $( ".proLabel" );
 
    progressbar.progressbar({
      value: false,
      change: function() {
        progressLabel.text( progressbar.progressbar( "value" ) + "%" );
      },
      complete: function() {
        $("h2").css("display","block");
      }
    });
 
    function progress() {
      var val = progressbar.progressbar( "value" ) || 0;
 
      progressbar.progressbar( "value", val + 1 );
 
      if ( val < 99 ) {
        setTimeout( progress, 50 );
      }
    }
 
    setTimeout( progress, 1000 );
  });
  </script>

        <center><h2 style="display:none">${message}</h2></center>
        <div id="proBar"><div class="proLabel"><center>保存中...</center></div></div>
</body>
</html>