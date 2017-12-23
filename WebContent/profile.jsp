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
<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="services.LoginService,bean.*"%>
<% 
    String username = session.getAttribute("username").toString();
    LoginService loginService = new LoginService();
    User name= loginService.getUser(username);
    String nameId=name.getId();
    User user = loginService.getId(nameId);
    //pageContext.setAttribute("user", user);
    request.setAttribute("user",user);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profile</title>
<link rel="stylesheet" href="./Static/css/profileStyle.css">
</head>
<body onLoad="init()" id="profileBackground">
            <!-- 头部页面 -->
<%@include file="./Common/header.jsp" %>

      <div id="GeneralTitle">
        <a><span class="glyphicon glyphicon-user">基本信息</span></a>
			<div class="cloud">
			 <div >帐号:
              <label id="id">${user.id}</label>
            </div>
				<div id="name">姓名:
              <label id="username">${sessionScope.username}</label>
            </div>
            <div>年龄:
              <label><span id="age">${user.age}</span></label>
            </div>
            <div>性别:
             <label>${user.sex}</label>
            </div>
            <div>住址:
              <label>${user.address}</label>
            </div>
            <div>电话:
              <label>${user.telephone}</label>
            </div>
            
           
		<section>
				<div class="ddPolitical">政治面貌:
					<div id="politicalStatus" class="wrapper-dropdown-3" tabindex="1">
						<span id="political_status">${user.political_status}</span>
						<ul class="dropdown">
							<li><a href="#"><i class="icon-envelope icon-large"></i>中共党员</a></li>
							<li><a href="#"><i class="icon-truck icon-large"></i>共青团员</a></li>
							<li><a href="#"><i class="icon-plane icon-large"></i>群众</a></li>
							<li><a href="#"><i class="icon-plane icon-large"></i>无党人士</a></li>
						</ul>
					</div>
				</div>
			</section>
			<button onclick="ha()">click</button>
	
		
<!-- jQuery if needed -->
	
		<script type="text/javascript">
			
			function DropDown(el) {
				this.dd = el;
				this.placeholder = this.dd.children('span');
				this.opts = this.dd.find('ul.dropdown > li');
				this.val = '';
				this.index = -1;
				this.initEvents();
			}
			DropDown.prototype = {
				initEvents : function() {
					var obj = this;

					obj.dd.on('click', function(event){
						$(this).toggleClass('active');
						return false;
					});

					obj.opts.on('click',function(){
						var opt = $(this);
						obj.val = opt.text();
						obj.index = opt.index();
						obj.placeholder.text(obj.val);
					});
				},
				getValue : function() {
					return this.val;
				},
				getIndex : function() {
					return this.index;
				}
			}

			$(function() {

				var dd = new DropDown( $('#politicalStatus') );

				$(document).click(function() {
					// all dropdowns
					$('.wrapper-dropdown-3').removeClass('active');
				});
                
			});
          
		  
		  function ha(){
		  alert($('#political_status').text());
		  }
		</script>
			<div>出生日期:
                <select id="birthYear" onChange="swap_day()"><option>${user.birthYear}</option></select>年
				<select id="birthMonth" onChange="swap_day()"><option>${user.birthMonth}</option></select>月
				<select id="birthDay"><option>${user.birthDay}</option></select>日
            </div>	
			<div>婚姻状况:
              <select id="marital_status">
               <option>${user.marital_status}</option>
                <option value="保密">保密</option>
                <option value="未婚">未婚</option>
                <option value="已婚">已婚</option>
                <option value="离异">离异</option>
                <option value="丧偶">丧偶</option>
              </select>
            </div>
            <div>邮箱:
              <label>${user.email}</label>
            </div>	
            <button onclick="saveBasicInfo()">保存</button>
			</div>
			
			<a><span class="glyphicon glyphicon-education">教育背景</span></a>
			<div class="cloud">
				<div>毕业院校:
               <table id="schoolName">
				<c:choose>
        <c:when  test="${empty sessionScope.username||empty user.school}">
                             <tr><td id="school"><input type="text" placeholder="请输入你的学校" id="schoolInput"/></td></tr>  
        </c:when>
        <c:otherwise>
           <tr><td id="school" title="双击修改学校">${user.school}</td></tr> 
        </c:otherwise>
    </c:choose>
			  </table>
            </div>
            <div>就读时间:
              <select id="studyYear">
              <option>${user.studyYear}</option>
                 
              </select>
                                      年
              <select id="studyMonth">
              <option>${user.studyMonth}</option>
               
              </select>   
                                      月
              -
                <select id="graduateYear">
                   <option>${user.graduateYear}</option>
              </select>
                                      年
              <select id="graduateMonth">
               <option>${user.graduateMonth}</option>
              </select>   
                                      月                   
            </div>
            <div>
                                      专业： 
              <table id="majorName">
				<c:choose>
        <c:when  test="${empty sessionScope.username||empty user.major}">
                             <tr><td id="major"><input type="text" placeholder="请输入你的专业" id="majorInput"/></td></tr>  
        </c:when>
        <c:otherwise>
           <tr><td id="major" title="双击修改专业">${user.major}</td></tr> 
        </c:otherwise>
    </c:choose>
			  </table>
        		
            </div>
            <div>学历:
              <select id="educateDegree">
                <option>${user.degree}</option>
                <option value="博士后">博士后</option>
                <option value="博士">博士</option>
                <option value="研究生">研究生</option>
                <option value="本科">本科</option>
                <option value="大专">大专</option>
                <option value="高中">高中</option>
                <option value="初中">初中</option>
                <option value="小学">小学</option>
              </select>
            </div>
            <div>是否统招:
              <select id="Entrance">
                <option>${user.isEntrance}</option>
                <option value="是">是</option>
                <option value="否">否</option>
              </select>
            </div>
            <div>附加说明:<br/>
            <textarea id="ExtraComment">
            ${user.extraComment}
            </textarea>
             <button onclick="saveEducateInfo()">保存</button>
              
            </div>
			</div>
			<a><span class="glyphicon glyphicon-star">获奖证书</span></a>
			<div class="cloud">
				
				<!--<table border="1" width="200" id="certificatedTable">  
				<tr><td>111</td></tr>  
				<tr><td>222</td></tr>  
				<tr><td>333</td></tr>  
				<tr><td>444</td></tr>  
				<tr><td>555</td></tr>  
				</table>  
				
			-->
			<table>
        <tr>
            <td class=''>
                序号
            </td>
            <td class=''>
                获奖年份
            </td>
            <td class=''>
                奖项名称
            </td>
            <td class=''>
                操作 <a href="#" onclick="add_line();">添加</a>
            </td>
        </tr>
    </table>
    <table id="content">
    </table>
    <input type="button" value="提交数据" id="btnSubmit" onclick="SaveData()" />
			</div>
			
			<a><span class="glyphicon glyphicon-briefcase">工作经验</span></a>
			<div class="cloud">
			    <table id="CompanyTable" border="1" width="450px" class="display  hover cell-border  border-blue-1" >
            <tr width="150px">
                <th width="70px">年份</th>
                <th width="50px">公司名称</th>
                <th width="50px">职位</th>
                <th width="40px">操作</th>
            </tr>
        </table>
			    <input type="button" value="添加" onclick="addRow();" />
                <input type="button" value="保存" onclick="ceshi();" />
			    
				
			</div>
			<a><span class="glyphicon glyphicon-th-list">项目经验</span></a>
			<div class="cloud">
				
				
			</div>
			<a><span class="glyphicon glyphicon-tags">自我描述</span></a>
			<div class="cloud">
				<div ng-app="CalculateTextLeft">
   <div ng-controller="CTLCtrl">
    <h3>Description</h3>
    <textarea ng-model="UpperMessage" cols="40" rows="10" id="description"></textarea>
	<p>剩余字数: <span ng-bind="left()"></span></p>
	<button ng-click="save()">Save</button>
	<button ng-click="clear()">Clear</button>
   </div>
  </div>
			</div>
      </div>
      
      <script>
     var app=angular.module("CalculateTextLeft",[]);
  	
  	app.controller("CTLCtrl",function($scope){
  	  $scope.message="${user.description}";    //显示数据库数据
  	  $scope.UpperMessage=angular.lowercase($scope.message);
  	  $scope.left=function(){return 100-$scope.UpperMessage.length;};
  	  $scope.clear=function(){$scope.UpperMessage="";};
  	  $scope.save=function(){
  		var id = $('label#id').text();
  	  	var description = $("#description").val();
  	  	//alert(description);
  	  $.ajax({
	      type:"post",//请求方式
	       url:"${basePath}/Controller/descriptionController.jsp",//请求地址
	       data:{"id":id,"description":description},
	 
	       success:function(data){ //返回成功执行回调函数。
	       	if(data==-1){alert("请先登录或注册!");
	       	window.location.href = "${basePath}/login.jsp";
	       	}    	
	       	else if(data==-2){
	       		alert("内容不能为空！");
	       	}
	       	else if(data==1){
	           	alert("保存成功！");
	           	window.location.reload();
	           	 }
	       	
			},
			error:function(){//如果出错了，将事件重新绑定
	           alert("保存失败！");
	       }
		 });
  	  	};
  	});

  	jQuery().ready(function(){
		// simple accordion
		jQuery('#GeneralTitle').accordion();
  	});

        $("#certificatedTable").find("td").bind("dblclick",function(){  
   var input ="<input type='text' id='temp' value="+$(this).text()+" >";  
  $(this).text("");  
  $(this).append(input);  
    $("input#temp").focus();  
 $("input").blur(function(){  
       if($(this).val()==""){  
          $(this).remove();  
       }else{  
            $(this).closest("td").text($(this).val());  
        }; 
 });
        });

        $("#majorName").find("td").bind("dblclick",function(){  
        	   var input ="<input type='text' id='majorInput' value="+$(this).text()+" >";  
        	  $(this).text("");  
        	  $(this).append(input);  
        	    $("input#majorInput").focus();  
        	 $("input").blur(function(){  
        	       if($(this).val()==""){  
        	    	   $(this).innerHTML="请输入专业名称";   
        	       }else{  
        	            $(this).closest("td").text($(this).val());  
        	        }; 
        	 });
        	        });

        $("#schoolName").find("td").bind("dblclick",function(){  
     	   var input ="<input type='text' id='schoolInput' value="+$(this).text()+" >";  
     	  $(this).text("");  
     	  $(this).append(input);  
     	    $("input#schoolInput").focus();  
     	 $("input").blur(function(){  
     		if($(this).val()==""){  
   	          $(this).innerHTML="请输入学校名称";  
   	       }else{  
   	            $(this).closest("td").text($(this).val());  
   	        }; 
     	 });
     	        });

        $(document).ready(function () {
            $("#CompanyTable").DataTable();
            
        });
        var i = 0;
        //添加行
        function addRow() {
            i++;
            var rowTem = '<tr class="tr_' + i + '">'
                + '<td><select><option value="2000">2000</option></select> 年</td>'
                + '<td><input type="Text" id="company' + i + '"/></td>'
                + '<td><input type="Text" id="position' + i + '" /></td>'
                + '<td><a href="#" onclick=delRow('+i+') >删除</a></td>'
                + '</tr>';
           //var tableHtml = $("#CompanyTable tbody").html();
           // tableHtml += rowTem;
              $("#CompanyTable tbody:last").append(rowTem);
          //  $("#CompanyTable tbody").html(tableHtml);

        }
        //删除行
        function delRow(_id) {
            $("#CompanyTable .tr_"+_id).hide();
            i--;
        }
        //进行测试
        function ceshi() {
        	var year=$('#birthYear option:selected').val();
            alert(year);
        }
        
       </script>
       
       <script>
var month_big = new Array("1","3","5","7","8","10","12"); //包含所有大月的数组
var month_small = new Array("4","6","9","11"); //包含所有小月的数组 
 
//页面加载时调用的初始化select控件的option的函数
function init()
{
  var select_year = document.getElementById("birthYear"); //获取id为"year"的下拉列表框
  var select_month = document.getElementById("birthMonth"); //获取id为"month"的下拉列表框
  var select_day = document.getElementById("birthDay"); //获取id为"day"的下拉列表框

  var study_year = document.getElementById("studyYear");
  var graduate_year = document.getElementById("graduateYear");
  var study_month = document.getElementById("studyMonth");
  var graduate_month = document.getElementById("graduateMonth");
  
  var now = new Date();   
  var year = now.getFullYear(); //获取当前年份
  
  //将年份选项初始化，从1960到当前年份
  for(var i = 1960; i <= year; i++)
  {
    select_year_option = new Option(i, i);
    select_year.options.add(select_year_option);
  }

  //入学 毕业年份初始化
  for(var i = 1990; i <= year; i++)
  {
	study_year_option = new Option(i, i);
	study_year.options.add(study_year_option);
	graduate_year_option = new Option(i, i);
	graduate_year.options.add(graduate_year_option);
  }
  
  //将月份选项初始化，从1到12
  for(var i = 1; i <= 12; i++)
  {
    select_month_option = new Option(i, i);
    select_month.options.add(select_month_option);
    study_month_option = new Option(i, i);
    study_month.options.add(study_month_option);
    graduate_month_option = new Option(i, i);
    graduate_month.options.add(graduate_month_option);
  }
   
  //调用swap_day函数初始化日期  
  swap_day();
}
//判断数组array中是否包含元素obj的函数，包含则返回true，不包含则返回false
function array_contain(array, obj)
{
  for (var i = 0; i < array.length; i++)
  {
    if (array[i] === obj)
    {
      return true;
    }
  }
  return false;
}
 
//根据年份和月份调整日期的函数
function swap_day()
{
  var select_year = document.getElementById("birthYear"); //获取id为"year"的下拉列表框
  var select_month = document.getElementById("birthMonth"); //获取id为"month"的下拉列表框
  var select_day = document.getElementById("birthDay"); //获取id为"day"的下拉列表框

  //select_day.options.length = 0; //在调整前先清空日期选项里面的原有选项
  var month = select_month.options[select_month.selectedIndex].value; //获取被选中的月份month
   
  //如果month被包含在month_big数组中，即被选中月份是大月，则将日期选项初始化为31天
  if(array_contain(month_big, month))
  {
    for(var i = 1; i <= 31; i++)
    {
      select_day_option = new Option(i, i);
      select_day.options.add(select_day_option);
    }
  }
   
  //如果month被包含在month_small数组中，即被选中月份是小月，则将日期选项初始化为30天
  else if(array_contain(month_small, month))
  {
    for(var i = 1; i <= 30; i++)
    {
      select_day_option = new Option(i, i);
      select_day.options.add(select_day_option);
    }
  }
   
  //如果month为2，即被选中的月份是2月，则调用initFeb()函数来初始化日期选项
  else
  {
    initFeb();   
  }
}
//判断年份year是否为闰年，是闰年则返回true，否则返回false
function isLeapYear(year)
{
  var a = year % 4;
  var b = year % 100;
  var c = year % 400;
  if( ( (a == 0) && (b != 0) ) || (c == 0) )
  {
    return true;
  }
  return false;
}
 
//根据年份是否闰年来初始化二月的日期选项
function initFeb()
{
  var select_year = document.getElementById("birthYear"); //获取id为"year"的下拉列表框
  var select_day = document.getElementById("birthDay"); //获取id为"day"的下拉列表框
  var year = parseInt(select_year.options[select_year.selectedIndex].value); //获取被选中的年份并转换成Int
   
  //如果是闰年，则将日期选项初始化为29天
  if(isLeapYear(year))
  {
    for(var i = 1; i <= 29; i++)
    {
      select_day_option = new Option(i, i);
      select_day.options.add(select_day_option);
    }
  }
   
  //如果不是闰年，则将日期选项初始化为28天
  else
  {
    for(var i = 1; i <= 28; i++)
    {
      select_day_option = new Option(i, i);
      select_day.options.add(select_day_option);
    }
  }
}
</script>

<script type="text/javascript">
    var currentStep = 0;
    var max_line_num = 0;
    //添加新记录
    function add_line() {
        max_line_num = $("#content tr:last-child").children("td").html();
        if (max_line_num == null) {
            max_line_num = 1;
        }
        else {
            max_line_num = parseInt(max_line_num);
            max_line_num += 1;
        }
        $('#content').append(
        "<tr id='line" + max_line_num + "'>" +
            "<td class='td_Num'>" + max_line_num + "</td>" +
            "<td class='td_Item'><input type='text' class='stepName' value='"+"'></input></td>" +
            "<td class='td_Item'><input type='text' class='stepDescription' value='" + "'></td>" +
            "<td class='td_Oper'>" +
                "<span onclick='up_exchange_line(this);'>上移</span> " +
                "<span onclick='down_exchange_line(this);'>下移</span> " +
                "<span onclick='remove_line(this);'>删除</span> " +
            "</td>" +
        "</tr>");
    }
    //删除选择记录
    function remove_line(index) {
        if (index != null) {
            currentStep = $(index).parent().parent().find("td:first-child").html();
        }
        if (currentStep == 0) {
            alert('请选择一项!');
            return false;
        }
        if (confirm("确定要删除改记录吗？")) {
            $("#content tr").each(function () {
                var seq = parseInt($(this).children("td").html());
                if (seq == currentStep) { $(this).remove(); }
                if (seq > currentStep) { $(this).children("td").each(function (i) { if (i == 0) $(this).html(seq - 1); }); }
            });
        }
    }
    //上移
    function up_exchange_line(index) {
        if (index != null) {
            currentStep = $(index).parent().parent().find("td:first-child").html();
        }
        if (currentStep == 0) {
            alert('请选择一项!');
            return false;
        }
        if (currentStep <= 1) {
            alert('已经是最顶项了!');
            return false;
        }
        var upStep = currentStep - 1;
        //修改序号
        $('#line' + upStep + " td:first-child").html(currentStep);
        $('#line' + currentStep + " td:first-child").html(upStep);
        //取得两行的内容
        var upContent = $('#line' + upStep).html();
        var currentContent = $('#line' + currentStep).html();
        $('#line' + upStep).html(currentContent);
        //交换当前行与上一行内容
        $('#line' + currentStep).html(upContent);
        $('#content tr').each(function () { $(this).css("background-color", "#ffffff"); });
        $('#line' + upStep).css("background-color", "yellow");
        event.stopPropagation(); //阻止事件冒泡
    }
    //下移
    function down_exchange_line(index) {
        if (index != null) {
            currentStep = $(index).parent().parent().find("td:first-child").html();
        }
        if (currentStep == 0) {
            alert('请选择一项!');
            return false;
        }
        if (currentStep >= max_line_num) {
            alert('已经是最后一项了!');
            return false;
        }
        var nextStep = parseInt(currentStep) + 1;
        //修改序号
        $('#line' + nextStep + " td:first-child").html(currentStep);
        $('#line' + currentStep + " td:first-child").html(nextStep);
        //取得两行的内容
        var nextContent = $('#line' + nextStep).html();
        var currentContent = $('#line' + currentStep).html();
        //交换当前行与上一行内容
        $('#line' + nextStep).html(currentContent);
        $('#line' + currentStep).html(nextContent);
        $('#content tr').each(function () { $(this).css("background-color", "#ffffff"); });
        $('#line' + nextStep).css("background-color", "yellow");
        event.stopPropagation(); //阻止事件冒泡
    }
    //保存数据
    function SaveData() {
        var data = "<root>";
        $('#content tr').each(function () {
            data += "<item>";
            var stepName = $(this).find("td:eq(1)").find("input").val();
            var stepDescription = $(this).find("td:eq(2)").find("input").val();
            data += "   <stepName>" + stepName + "</stepName>";
            data += "   <stepDescription>" + stepDescription + "</stepDescription>";
            data += "<item>";
        });
        data += "</root>";
        alert(data);
    }
</script>

<script>
  function saveBasicInfo(){
  var id = $('label#id').text();
  var username = $('label#username').text();
  var age=new Date().getFullYear()-$('#birthYear option:selected').val();
  var political_status = $('#political_status').text();
  var birthYear = $('#birthYear option:selected').val();
  var birthMonth = $('#birthMonth option:selected').val();
  var birthDay = $('#birthDay option:selected').val();
  var marital_status = $('#marital_status option:selected').val();
  //alert(id+username+age+political_status+birthYear+birthMonth+birthDay+marital_status);
  $.ajax({
      type:"post",//请求方式
       url:"${basePath}/Controller/basicInfoController.jsp",//请求地址
       data:{"id":id,"username":username,"age":age,"political_status":political_status,"birthYear":birthYear,"birthMonth":birthMonth,"birthDay":birthDay,"marital_status":marital_status},//传递给controller的json数据
 
       success:function(data){ //返回成功执行回调函数。
       	if(data==-1){alert("请先登录或注册!");
       	window.location.href = "${basePath}/login.jsp";
       	}    	
       	else if(data==-2){
       		alert("请填入完整信息！");
       	}
       	else if(data==1){
           	alert("保存成功！");
           	window.location.reload();
           	 }
       	
		},
		error:function(){//如果出错了，将事件重新绑定
           alert("保存失败！");
       }
	 });
  }
</script>

<script>
function saveEducateInfo(){
	 var id = $('label#id').text();
	 var school = $('#school').text();
	 var studyYear = $('#studyYear option:selected').val();
	 var studyMonth = $('#studyMonth option:selected').val();
	 var graduateYear = $('#graduateYear option:selected').val();
	 var graduateMonth = $('#graduateMonth option:selected').val();
	 var major = $('#major').text();
	 var degree = $('#educateDegree option:selected').val();
	 var isEntrance = $('#Entrance option:selected').val();
	 var ExtraComment = $('#ExtraComment').val().trim();
	 //alert(id+school+" "+studyYear+studyMonth+graduateYear+graduateMonth+major+degree+isEntrance+ExtraComment);
	 $.ajax({
	      type:"post",//请求方式
	       url:"${basePath}/Controller/EducateController.jsp",//请求地址
	       data:{"id":id,"school":school,"studyYear":studyYear,"studyMonth":studyMonth,"graduateYear":graduateYear,"graduateMonth":graduateMonth,"major":major,"degree":degree,"isEntrance":isEntrance,"ExtraComment":ExtraComment},
	 
	       success:function(data){ //返回成功执行回调函数。
	       	if(data==-1){alert("请先登录或注册!");
	       	window.location.href = "${basePath}/login.jsp";
	       	}    	
	       	else if(data==-2){
	       		alert("请填入完整信息！");
	       	}
	       	else if(data==1){
	           	alert("保存成功！");
	           	window.location.reload();
	           	 }
	       	
			},
			error:function(){//如果出错了，将事件重新绑定
	           alert("保存失败！");
	       }
		 });
	}

$(function() {
    $( "#school" ).tooltip({
      track: true,  //鼠标跟随
      show: {
        effect: "slideDown",
        delay: 250     
      },
      hide: {
    	  effect: "blind",
          delay: 250
        }
   
    });
    $( "#major" ).tooltip({
        track: true,  //鼠标跟随
        show: {
          effect: "slideDown",
          delay: 250     
        },
        hide: {
      	  effect: "blind",
            delay: 250
          }
     
      });
});

	
</body>
</html>