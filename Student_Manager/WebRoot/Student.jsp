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

<title>学生管理</title>
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
					aria-expanded="false">${s.sname}<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="showSinfo?sn=${s.stuNo}">信息修改</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="stuLogin.jsp">注&emsp;销</a></li>
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
				<img src="${s.photo}" class="img-circle" alt="User Image">
			</div>
		</div>
		<ul class="sidebar-menu">
			<li class="header"><i class="fa fa-user"></i> <span>&nbsp;学生操作</span>
			</li>
			<li><a href="gotoChoose.action?sn=${s.stuNo}"> <i
					class="fa fa-search"></i> <span>&nbsp;选课查询</span>
			</a></li>
			<li><a href="showAClass.action?sn=${s.stuNo}"> <i
					class="fa fa-link"></i> <span>&nbsp;已修课程</span>
			</a></li>
			<li><a href="showSchedule.action?sn=${s.stuNo}"> <i
					class="fa fa-list"></i> <span>&nbsp;课表显示</span>
			</a></li>
			<li><a href="showMyScore.action?sn=${s.stuNo}"> <i
					class="fa fa-search"></i> <span>&nbsp;成绩查询</span>
			</a></li>
			<li><a href="stuLogin.jsp"> <i class="fa fa-backward"></i> <span>&nbsp;退出系统</span>
			</a></li>
		</ul>
		</section>


		<section class="content-wrapper"> <s:if
			test="#request.menu=='student'">
			<div class="content-header">
				<h2>学生操作界面</h2>
			</div>
		</s:if>
		<div class="content">

			<s:if test="#request.menu=='gotochoose'">
				<s:form action="findOClass" method="post" class="dark-matter"
					theme="simple">
					<div class="menu">
						<h2>开课查询</h2>
					</div>
					<div class="menu-add">
						<h3>输入课程号或教师号，支持模糊查询</h3>
						<s:hidden name="s.stuNo"></s:hidden>
					</div>
					<label> <span>课程号</span> <s:textfield class="text"
							name="xk.c.cno" placeholder="课程号" />
					</label>
					<label> <span>教师号</span> <s:textfield class="text"
							name="xk.t.tno" placeholder="教室号" />
					</label>
					<input type="submit" class="btn btn-primary search-btn"
						value="查&emsp;询" />
				</s:form>
				<br>
			</s:if>

			<s:if test="#request.menu=='showSinfo'">
				<s:form action="updateSinfo" method="post" class="dark-matter"
					theme="simple">
					<div class="menu">
						<h2>学生信息修改</h2>
						<s:hidden name="s.stuNo"></s:hidden>
					</div>
					<label> <span>学生学号：</span> <s:textfield name="stu.stuNo"
							value="%{s.stuNo}" readonly="true"></s:textfield>
					</label>
					<label> <span>学生姓名：</span> <s:textfield name="stu.sname"
							value="%{s.sname}" readonly="true"></s:textfield>
					</label>
					<label> <span>密&emsp;&emsp;码：</span> <s:textfield
							name="stu.password" value="%{s.password}"></s:textfield>
					</label>
					<label> <span>性&emsp;&emsp;别：</span> <s:if
							test="s.gender==0">男</s:if> <s:else>女</s:else>
					</label>
					<label> <span>生&emsp;&emsp;日：</span> <fmt:formatDate
							value='${s.birth}' pattern='yyyy-MM-dd' />
					</label>
					<label> <span>选择学院：</span> <s:select value="%{s.d.deptNo}"
							list="#request.dlist" class="select-input" name="stu.d.deptNo"
							listKey="deptNo" listValue="deptName" />
					</label>
					<input type="submit" class="btn btn-primary search-btn"
						value="修&emsp;改" />
					<input class="btn btn-primary search-btn" type="button"
						onClick="javascript:history.back()" value="返&emsp;回" />
				</s:form>
				<br>
			</s:if>

			<s:if test="#request.olist!=null">
				<div class="menu">
					<div class="list-menu">
						<h3>开课信息</h3>
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
							<s:if test="%{#request.blist[#spain_o.count-1]}">
								<td><button class="had_btn" onClick="">已选</button></td>
							</s:if>
							<s:else>
								<td><button class="delete_btn"
										onClick="location.href='attendClass.action?sn=${s.stuNo}&no=${id.c.cno}&mo=${id.t.tno}'">选课</button></td>
							</s:else>
						</tr>
					</s:iterator>
				</table>
				<div style="height:10px;"></div>
			</s:if>

			<s:if test="#request.xklist!=null">
				<div class="menu">
					<div class="list-menu">
						<h3>选修课程</h3>
					</div>
				</div>
				<table class="table_a" border="2" cellspacing="2px"
					cellpadding="2px">
					<tr>
						<td>序号</td>
						<td>课程号</td>
						<td>课程名</td>
						<td>教师号</td>
						<td>时间安排</td>
						<td>地点安排</td>
						<td>学分</td>
						<td>操作</td>
					</tr>
					<s:iterator status="spain" value="#request.xklist" id="xk">
						<tr>
							<td>${spain.count}</td>
							<td>${xk[0]}</td>
							<td>${xk[1]}</td>
							<td>${xk[2]}</td>
							<td>${xk[3]}</td>
							<td>${xk[4]}</td>
							<td>${xk[5]}</td>
							<td><button class="delete_btn"
									onClick="location.href='dropClass.action?sn=${s.stuNo}&no=${xk[0]}&mo=${xk[2]}'">退课</button></td>
						</tr>
					</s:iterator>
				</table>
				<div style="height:30px;"></div>
			</s:if>

			<s:if test="#request.schedule!=null">
				<div class="menu">
					<div class="list-menu">
						<h3>课程表</h3>
					</div>
				</div>
				<table class="schedule" border="2" cellspacing="2px"
					cellpadding="2px">
					<tr>
						<td>代号</td>
						<td>课程号</td>
						<td>课程名</td>
						<td>教师号</td>
						<td>时间安排</td>
						<td>地点安排</td>
						<td>学分</td>
					</tr>
					<s:iterator status="spain2" value="#request.list" id="l">
						<tr>
							<td>${numlist[spain2.count-1]}</td>
							<td>${l[0]}</td>
							<td>${l[1]}</td>
							<td>${l[2]}</td>
							<td>${l[3]}</td>
							<td>${l[4]}</td>
							<td>${l[5]}</td>
						</tr>
					</s:iterator>
				</table>
				<table class="schedule" border="2" cellspacing="2px"
					cellpadding="2px">
					<tr>
						<td>课表</td>
						<td>周一</td>
						<td>周二</td>
						<td>周三</td>
						<td>周四</td>
						<td>周五</td>
					</tr>
					<s:iterator status="spain" value="#request.schedule" id="sch">
						<tr>
							<td>${spain.count}</td>
							<td>${sch[0]}</td>
							<td>${sch[1]}</td>
							<td>${sch[2]}</td>
							<td>${sch[3]}</td>
							<td>${sch[4]}</td>
						</tr>
					</s:iterator>
				</table>
				<div style="height:10px;"></div>
			</s:if>

			<s:if test="#request.glist!=null">
				<div class="menu">
					<div class="list-menu">
						<h3>${s.sname}的成绩表</h3>
					</div>
				</div>
				<table class="table_a" border="2" cellspacing="2px"
					cellpadding="2px">
					<tr>
						<td>序号</td>
						<td>学号</td>
						<td>姓名</td>
						<td>课程名</td>
						<td>教师</td>
						<td>平时分</td>
						<td>考试成绩</td>
						<td>总成绩</td>
					</tr>
					<s:iterator status="spain" value="#request.glist" id="st">
						<tr>
							<td>${spain.count}</td>
							<td>${st.id.s.stuNo}</td>
							<td>${st.id.s.sname}</td>
							<td>${st.id.c.cname}</td>
							<td>${st.id.t.tname}</td>
							<s:if test="#st.psGrade==null">
								<td>未打分</td>
							</s:if>
							<s:else>
								<td>${st.psGrade}</td>
							</s:else>
							<s:if test="#st.ksGrade==null">
								<td>未打分</td>
							</s:if>
							<s:else>
								<td>${st.ksGrade}</td>
							</s:else>
							<s:if test="#st.ksGrade==null||#st.ksGrade==null">
								<td>未打分</td>
							</s:if>
							<s:elseif test="#st.totalScore<60">
								<td style="color:#DC143C;">${st.totalScore}</td>
							</s:elseif>
							<s:else>
								<td>${st.totalScore}</td>
							</s:else>
						</tr>
					</s:iterator>
				</table>
				<div style="height:30px;"></div>
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
