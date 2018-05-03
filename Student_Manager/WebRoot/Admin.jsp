<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%><!-- 显示时间格式用的 -->
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/struts-dojo-tags" prefix="sx"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<head runat="server">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>管理员界面</title>
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrapValidator.css">
<link rel="stylesheet" href="css/Style.css">
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<sx:head />
</head>

<body>
	<nav class="navbar navbar-fixed-top navbar-inverse">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand">教学辅助系统</a>
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">管理员<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="adLogin.jsp">注&emsp;销</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- /.nav-collapse -->
	</div>
	<!-- /.container --> </nav>
	<!-- /.navbar -->
	<div style="height:100px;"></div>
	<div class="container">
		<section class="sidebar">
		<div class="user-panel">
			<div class="image">
				<img src="img/admin.jpg" class="img-circle" alt="User Image">
			</div>
		</div>
		<ul class="sidebar-menu">
			<li class="header"><i class="fa fa-user"></i><span>&emsp;管理员操作</span>
			</li>

			<li><a href="showAllClass.action"> <i class="fa fa-th-list"></i><span>&emsp;全部课程</span>
			</a></li>
			<li><a href="showAllOClass.action"> <i
					class="fa fa-plus-circle"></i><span>&emsp;开课管理</span>
			</a></li>
			<li><a href="showAllStudent.action"> <i
					class="fa fa-address-book"></i><span>&emsp;学生管理</span>
			</a></li>
			<li><a href="showAllTeacher.action"> <i
					class="fa fa-user-secret"></i><span>&emsp;教师管理</span>
			</a></li>
			<li><a href="adLogin.jsp"> <i class="fa fa-backward"></i><span>&emsp;退出系统</span>
			</a></li>
		</ul>
		</section>


		<section class="content-wrapper"> <s:if
			test="#request.menu=='admin'">
			<div class="content-header">
				<h2>管理员操作界面</h2>
			</div>
		</s:if>
		<div class="content">

			<s:if test="#request.alist!=null">
				<div class="menu">
					<div class="list-menu">
						<h3>课程列表</h3>
					</div>
					<div class="add-button">
						<a href="gotoAddClass.action">添加新课</a>
					</div>
				</div>
				<table class="table_a" border="2" cellspacing="2px"
					cellpadding="2px">
					<tr>
						<td>序号</td>
						<td>课程号</td>
						<td>课程名</td>
						<td>学分</td>
						<td>学院</td>
						<td>操作</td>
					</tr>
					<s:iterator status="spain_a" value="#request.alist" id="a">
						<tr>
							<td>${spain_a.count}</td>
							<td>${a.cno}</td>
							<td>${a.cname}</td>
							<td>${a.credit}</td>
							<td>${a.d.deptName}</td>
							<td><button class="delete_btn"
									onClick="location.href='deleteClass.action?no=${a.cno}'">删除</button></td>
						</tr>
					</s:iterator>
				</table>
				<div style="height:10px;"></div>
			</s:if>

			<s:if test="#request.olist!=null">
				<div class="menu">
					<div class="list-menu">
						<h3>开课信息</h3>
					</div>
					<div class="add-button">
						<a href="gotoAddOClass.action">新开课程</a>
					</div>
				</div>
				<table class="table_a" border="2" cellspacing="2px"
					cellpadding="2px">
					<tr>
						<td>序号</td>
						<td>课程号</td>
						<td>课程名</td>
						<td>教师号</td>
						<td>教师名</td>
						<td>时间安排</td>
						<td>地点安排</td>
						<td>操作</td>
					</tr>
					<s:iterator status="spain_o" value="#request.olist" id="o">
						<tr>
							<td>${spain_o.count}</td>
							<td>${o.id.c.cno}</td>
							<td>${o.id.c.cname}</td>
							<td>${o.id.t.tno}</td>
							<td>${o.id.t.tname}</td>
							<td>${o.time}</td>
							<td>${o.addr}</td>
							<td><button class="delete_btn"
									onClick="location.href='deleteOClass.action?no=${id.c.cno}&mo=${id.t.tno}'">删除</button></td>
						</tr>
					</s:iterator>
				</table>
				<div style="height:10px;"></div>
			</s:if>

			<s:if test="#request.slist!=null">
				<div class="menu">
					<div class="list-menu">
						<h3>学生列表</h3>
					</div>
					<!-- <div class="add-button"><a href="gotoAddClass.action">添加新课</a></div> -->
				</div>
				<table class="table_a" border="2" cellspacing="2px"
					cellpadding="2px">
					<tr>
						<td>序号</td>
						<td>学号</td>
						<td>密码</td>
						<td>姓名</td>
						<td>性别</td>
						<td>出生日期</td>
						<td>学院</td>
						<td>操作</td>
					</tr>
					<s:iterator status="spain_s" value="#request.slist" id="s">
						<tr>
							<td>${spain_s.count}</td>
							<td>${s.stuNo}</td>
							<td>${s.password}</td>
							<td>${s.sname}</td>
							<td><s:if test="#s.gender==0">男</s:if> <s:else>女</s:else></td>
							<td><fmt:formatDate value='${s.birth}' pattern='yyyy-MM-dd' /></td>
							<td>${s.d.deptName}</td>
							<td><button class="delete_btn"
									onClick="location.href='deleteStudent.action?no=${s.stuNo}'">删除</button></td>
						</tr>
					</s:iterator>
				</table>
				<div style="height:10px;"></div>
			</s:if>

			<s:if test="#request.tlist!=null">
				<div class="menu">
					<div class="list-menu">
						<h3>教师列表</h3>
					</div>
					<!-- <div class="add-button"><a href="gotoAddClass.action">添加新课</a></div> -->
				</div>
				<table class="table_a" border="2" cellspacing="2px"
					cellpadding="2px">
					<tr>
						<td>序号</td>
						<td>教师号</td>
						<td>密码</td>
						<td>姓名</td>
						<td>性别</td>
						<td>出生日期</td>
						<td>学院</td>
						<td>操作</td>
					</tr>
					<s:iterator status="spain_t" value="#request.tlist" id="t">
						<tr>
							<td>${spain_t.count}</td>
							<td>${t.tno}</td>
							<td>${t.password}</td>
							<td>${t.tname}</td>
							<td><s:if test="#t.gender==0">男</s:if> <s:else>女</s:else></td>
							<td>${t.career}</td>
							<td>${t.d.deptName}</td>
							<td><button class="delete_btn"
									onClick="location.href='deleteTeacher.action?no=${t.tno}'">删除</button></td>
						</tr>
					</s:iterator>
				</table>
				<div style="height:10px;"></div>
			</s:if>

			<s:if test="#request.menu=='addclass'">
				<s:form action="addClass" method="post" class="ad-dark-matter"
					theme="simple">
					<div class="ad-menu">
						<h3>添加一门新课</h3>
					</div>
					<label> <span>课程课号：</span> <s:textfield cssType="text"
							name="c.cno" placeholder="课程课号" />
					</label>
					<label> <span>课程名称：</span> <s:textfield cssType="text"
							name="c.cname" placeholder="课程名称" />
					</label>
					<label> <span>成绩占比：</span> <s:textfield cssType="text"
							name="c.rate" placeholder="考试成绩所占百分比（0-100）" />
					</label>
					<label> <span>课程学分：</span> <s:textfield cssType="text"
							name="c.credit" placeholder="学分" />
					</label>
					<label> <span>选择学院：</span> <s:select list="#request.dlist"
							class="select-input" name="c.d.deptNo" listKey="deptNo"
							listValue="deptName" label="选择你的学院" />
					</label>
					<input type="submit" class="btn btn-primary register-btn"
						value="添&emsp;加" />
					<input type="button" class="btn btn-primary register-btn"
						onClick="javascript:history.back();" value="返&emsp;回" />
				</s:form>
			</s:if>

			<s:if test="#request.menu=='addoclass'">
				<s:form action="addOClass" method="post" class="ad-dark-matter"
					theme="simple">
					<div class="ad-menu">
						<h3>开设课程</h3>
					</div>
					<label> <span>课程选择：</span> <s:select list="#request.oclist"
							class="select-input" name="oi.c.cno" listKey="cno"
							listValue="cname" label="课程选择" />
					</label>
					<label> <span>教师选择：</span> <s:select list="#request.otlist"
							class="select-input" name="oi.t.tno" listKey="tno"
							listValue="tname" label="教师选择" />
					</label>
					<label> <span>时间安排：</span> <s:textfield cssType="text"
							name="o.time" placeholder="时间安排" />
					</label>
					<label> <span>地点安排：</span> <s:textfield cssType="text"
							name="o.addr" placeholder="地点安排" />
					</label>
					<input type="submit" class="btn btn-primary register-btn"
						value="添&emsp;加" />
					<input type="button" class="btn btn-primary register-btn"
						onClick="javascript:history.back();" value="返&emsp;回" />
				</s:form>
			</s:if>

		</div>
		<footer class="main-footer"> <strong>Copyright
			&copy; 学生管理系统 丨 <a href="http://www.miitbeian.gov.cn/"
			target="_blank" rel="nofollow noopener noreferrer">赣ICP备18001002号
		</a>
		</strong> </footer> </section>


	</div>

	<script src="js/jquery-3.2.0.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/bootstrapValidator.js"></script>
</body>
</html>
