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
<base href="<%=basePath%>">

<title>教师注册</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrapValidator.css">
<link rel="stylesheet" href="css/Register.css">
<script language="javascript" type="text/javascript"
	src="js/My97DatePicker/WdatePicker.js"></script>
<script language="javascript" type="text/javascript"
	src="js/register.js"></script>
<link href="js/My97DatePicker/skin/WdatePicker.css" rel="stylesheet"
	type="text/css">
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
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">未登录<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="tecLogin.jsp">登&emsp;录</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="getDept.action?role=teacher">注&emsp;册</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- /.nav-collapse -->
	</div>
	<!-- /.container --> </nav>
	<!-- /.navbar -->
	<div style="height:100px;"></div>
	<div class="container">
		<div class="register">
			<s:form action="tecRegister" method="post" class="dark-matter"
				enctype="multipart/form-data" theme="simple">
				<div class="menu">
					<h2>教&emsp;师&emsp;注&emsp;册</h2>
				</div>
				<div class="stu_register">
					<label> <span>教&ensp;师&ensp;号：</span> <s:textfield
							name="tec.tno" class="re-input" label="教师号" placeholder="教师号"></s:textfield>
					</label> <label> <span>教师姓名：</span> <s:textfield name="tec.tname"
							class="re-input" label="教师姓名" placeholder="教师姓名"></s:textfield>
					</label> <label> <span>密&emsp;&emsp;码：</span> <s:password
							name="tec.password" class="re-input" label="密码" placeholder="密码"></s:password>
					</label> <label> <span>性&emsp;&emsp;别：</span> <input type="radio"
						class="re-sex-input" name="tec.gender" value='0'>男 <input
						type="radio" class="re-sex-input" name="tec.gender" value='1'>女
					</label> <label> <span>职&emsp;&emsp;称：</span> <input
						name="tec.career" type="radio" value='讲师' checked>讲师 <input
						name="tec.career" type="radio" value='副教授'>副教授 <input
						name="tec.career" type="radio" value='教授'>教授 <input
						name="tec.career" type="radio" value='工程师'>工程师 <input
						name="tec.career" type="radio" value='其他'>其他
					</label> <label> <span>选择学院：</span> <s:select list="#request.dlist"
							class="re-input select-input" name="tec.d.deptNo"
							listKey="deptNo" listValue="deptName" />
					</label>
				</div>
				<div class="stu_register_img">
					<label style="padding:15px 0;"><span>照&emsp;&emsp;片：</span><input
						type='file' style="width: 200px;" name='picPaths3' id='picPaths3'
						onchange="showPic(this, 3);" /></label>
					<div style="height:2px;"></div>
					<img id="pic3" src="" width="228" style="margin:10px;" alt="">
				</div>
				<input type="submit" class="btn btn-primary register-btn"
					value="注&emsp;册" />
				<input type="button" class="btn btn-primary register-btn"
					onClick="javascript:history.back()" value="返&emsp;回" />
			</s:form>
			<footer class="main-footer"> <strong>Copyright
				&copy; 学生管理系统 丨 <a href="http://www.miitbeian.gov.cn/"
				target="_blank" rel="nofollow noopener noreferrer">赣ICP备18001002号
			</a>
			</strong> </footer>
		</div>
	</div>
	<script src="js/jquery-3.2.0.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
	<script src="js/bootstrapValidator.js"></script>
</body>
</html>
