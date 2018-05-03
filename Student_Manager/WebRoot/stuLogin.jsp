<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>学生登录</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrapValidator.css">
    <link rel="stylesheet" href="css/login.css">
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
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand">教学辅助系统</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">未登录<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="stuLogin.jsp">登&emsp;录</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="getDept.action?role=student">注&emsp;册</a></li>                       
                    </ul>
                </li>
            </ul>
        </div>
        <!-- /.nav-collapse -->
    </div>
    <!-- /.container -->
</nav>
<!-- /.navbar -->
<div style="height:100px;"></div>
<div class="container">
    <div class="row">
    <div class="login-body">
        <section>
            <div class="page-header">
            <ul class="nav nav-tabs">
                <li class="active"><a href="stuLogin.jsp">学生登录</a></li>
                <li><a href="tecLogin.jsp">教师登录</a></li>
                <li><a href="adLogin.jsp">管理员登录</a></li>
                </ul>
            </div>
            <form id="login" action="stuLogin" method="post" class="form-horizontal" role="form">
                <div class="form-group">
                    <label class="col-sm-2 col-xs-2 col-sm-offset-2 control-label">学&emsp;号</label>
                    <div class="col-sm-4 col-xs-10">
                        <input type="text" name="s.stuNo" class="form-control" name="id" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 col-sm-offset-2 col-xs-2 control-label">密&emsp;码</label>
                    <div class="col-sm-4 col-xs-10">
                        <input type="password" name="s.password" class="form-control" name="password" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-4 col-sm-offset-4 col-xs-8 col-xs-offset-2">
                        <!--button type="submit" name="submit" class="btn btn-primary">登&emsp;录</button-->
                        <input type="submit" class="btn btn-primary" value="登&emsp;录"/>
                        <button type="button" class="col-sm-offset-2 col-xs-offset-2 btn btn-primary" id="resetBtn">重&emsp;置</button>
                    </div>
                </div>
            </form>
        </section>
        <footer class="main-footer">
		<strong>Copyright &copy; 学生管理系统  丨 <a href="http://www.miitbeian.gov.cn/" target="_blank" rel="nofollow noopener noreferrer">赣ICP备18001002号 </a></strong>
		</footer>
        </div>
    </div>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery-3.2.0.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrapValidator.js"></script>
<script>
    $(function() {
        $('#formbody').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                username: {
                    message: '学号验证失败',
                    validators: {
                        notEmpty: {
                            message: '学号不能为空'
                        },
                        stringLength: {
                            min: 8,
                            max: 8,
                            message: '学号长度必须为8'
                        }
                    }
                },
                pwd: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        }
                    }
                }
            }
        });
    });
</script>
<script>
    $('#resetBtn').click(function() {
        $('#login').data('bootstrapValidator').resetForm(true);
    });
</script>
</body>
</html>
