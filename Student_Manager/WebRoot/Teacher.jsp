<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>教师管理</title>
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
					aria-expanded="false">${t.tname}<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="showTinfo?tn=${t.tno}">信息修改</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="tecLogin.jsp">注&emsp;销</a></li>
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
				<img src="${t.photo}" class="img-circle" alt="User Image">
			</div>
		</div>
		<ul class="sidebar-menu">
			<li class="header"><i class="fa fa-user"></i> <span>&nbsp;教师操作</span>
			</li>

			<li><a href="teachManager.action?tn=${t.tno}"> <i
					class="fa fa-server"></i> <span>&nbsp;课程管理</span>
			</a></li>			
			<li><a href="stuLogin.jsp"> <i class="fa fa-backward"></i> <span>&nbsp;退出系统</span>
			</a></li>
		</ul>
		</section>


		<section class="content-wrapper"> 
		<s:if test="#request.menu=='teacher'">
		<div class="content-header">
		    <h2>教师操作界面</h2>
		</div> 
		</s:if>
		<div class="content">
		
		<s:if test="#request.menu=='showTinfo'">
				<s:form action="updateTinfo" method="post" class="dark-matter"
					theme="simple">
					<div class="menu">
						<h2>教师信息修改</h2>
						<s:hidden name="t.tno"></s:hidden>
					</div>
					<label> <span>教&ensp;师&ensp;号：</span> <s:textfield name="tec.tno"
							value="%{t.tno}" readonly="true"></s:textfield>
					</label>
					<label> <span>教师姓名：</span> <s:textfield name="tec.tname"
							value="%{t.tname}" readonly="true"></s:textfield>
					</label>
					<label> <span>密&emsp;&emsp;码：</span> <s:textfield
							name="tec.password" value="%{t.password}"></s:textfield>
					</label>
					<label> <span>性&emsp;&emsp;别：</span> <s:if
							test="t.gender==0">男</s:if> <s:else>女</s:else>
					</label>
					<label> <span>职&emsp;&emsp;称：</span> ${t.career}
					</label>
					<label> <span>选择学院：</span> <s:select value="%{t.d.deptNo}"
							list="#request.dlist" class="select-input" name="tec.d.deptNo"
							listKey="deptNo" listValue="deptName" />
					</label>
					<input type="submit" class="btn btn-primary search-btn"
						value="修&emsp;改" />
					<input class="btn btn-primary search-btn" type="button"
						onClick="javascript:history.back()" value="返&emsp;回" />
				</s:form>
				<br>
			</s:if>
		
		<s:if test="#request.tclist!=null">
				<div class="menu">
					<div class="list-menu">
						<h3>教授课程</h3>
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
						<td>选课人数</td>
						<td>操作</td>
					</tr>
					<s:iterator status="spain" value="#request.tclist" id="o">
						<tr>
							<td>${spain.count}</td>
							<td>${o.id.c.cno}</td>
							<td>${o.id.c.getCname()}</td>
							<td>${o.id.t.tno}</td>
							<td>${o.time}</td>
							<td>${o.addr}</td>
							<td>${o.id.c.getCredit()}</td>
							<td>${numlist[spain.count-1]}</td>
							<td><button class="delete_btn"
									onClick="location.href='showMystu.action?tn=${t.tno}&no=${o.id.c.cno}'">学生</button></td>
						</tr>
					</s:iterator>
				</table>
				<div style="height:30px;"></div>
			</s:if>
			
			<s:if test="#request.stlist!=null">
				<div class="menu">
					<div class="list-menu">
						<h3>成绩列表</h3>
					</div>					
				</div>
				<table class="table_a" border="2" cellspacing="2px"
					cellpadding="2px">
					<tr>
						<td>序号</td>
						<td>学号</td>	
						<td>姓名</td>				
						<td>课程号</td>
						<td>平时分</td>
						<td>考试成绩</td>	
						<td>总成绩</td>					
					</tr>
					<s:iterator status="spain" value="#request.stlist" id="st">
						<tr>
							<td>${spain.count}</td>
							<td>${st.id.s.stuNo}</td>
							<td>${st.id.s.getSname()}</td>
							<td>${st.id.c.getCname()}</td>
							<s:if test="#st.psGrade==null"><td>未打分</td></s:if>
							<s:else><td>${st.psGrade}</td></s:else>
							<s:if test="#st.ksGrade==null"><td>未打分</td></s:if>
							<s:else><td>${st.ksGrade}</td></s:else>
							<s:if test="#st.ksGrade==null||#st.ksGrade==null"><td><button class="delete_btn"
									onClick="location.href='gotoMark.action?tn=${t.tno}&no=${st.id.c.cno}&mo=${st.id.s.stuNo}'">打分</button></td></s:if>
							<s:elseif test="#st.totalScore<60"><td><button class="had_btn"
									onClick="location.href='gotoMark.action?tn=${t.tno}&no=${st.id.c.cno}&mo=${st.id.s.stuNo}'">${st.totalScore}</button></td></s:elseif>
									<s:else><td><button class="pass_btn"
									onClick="location.href='gotoMark.action?tn=${t.tno}&no=${st.id.c.cno}&mo=${st.id.s.stuNo}'">${st.totalScore}</button></td></s:else>
						</tr>
					</s:iterator>
				</table>
				<div style="height:30px;"></div>
			</s:if>
			
			<s:if test="#request.menu=='gotomark'">
				<s:form action="Mark" method="post" class="dark-matter"
					theme="simple">
					<div class="source_menu">
						<h2>学生打分</h2><s:hidden name="t.tno"></s:hidden> <s:hidden  name="sgi.c.cno" value="%{sg.id.c.cno}"></s:hidden>
					</div>
					<label> <span>学&emsp;号</span> <s:textfield class="text"
							name="sgi.s.stuNo" value="%{sg.id.s.stuNo}" readonly="true" />
					</label>
					<label> <span>姓&emsp;名</span> <s:textfield class="text"
							name="sgi.s.sname" value="%{sg.id.s.sname}" readonly="true" />
					</label>
					<label> <span>课程名</span> <s:textfield class="text"
							name="sgi.c.cname" value="%{sg.id.c.cname}" readonly="true" />
					</label>
				   		
					<label> <span>平时分</span> <s:textfield class="text"
							name="sg.psGrade" value="%{sg.psGrade}" placeholder="平时分" />
					</label>
					<label> <span>考试分</span> <s:textfield class="text"
							name="sg.ksGrade" value="%{sg.ksGrade}" placeholder="考试分" />
					</label>
					<input type="submit" class="btn btn-primary search-btn"
						value="打&emsp;分" />
					<input type="button" class="btn btn-primary search-btn" onClick="javascript:history.back();" value="返&emsp;回" />
				</s:form>
				<br>
			</s:if>
		
		</div>
		<footer class="main-footer">
		<strong>Copyright &copy; 学生管理系统  丨 <a href="http://www.miitbeian.gov.cn/" target="_blank" rel="nofollow noopener noreferrer">赣ICP备18001002号 </a></strong>
		</footer>
		</section>
		
	</div>

	<script src="js/jquery-3.2.0.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/bootstrapValidator.js"></script>
</body>
</html>
