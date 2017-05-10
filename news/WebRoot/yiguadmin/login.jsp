<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>教务处后台管理系统</title>
    <link rel="stylesheet" type="text/css" href="Styles/base.css" />
    <link rel="stylesheet" type="text/css" href="Styles/admin-all.css" />
    <link rel="stylesheet" type="text/css" href="Styles/bootstrap.min.css" />
    <script type="text/javascript" src="Scripts/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="Scripts/jquery.spritely-0.6.js"></script>
    <script type="text/javascript" src="Scripts/chur.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Styles/login.css" />
    <script language="javaScript">
	function userLogin() {
		var userName = document.form1.username.value;
		var userPwd = document.form1.password.value;
		var flag = true;
		if (userName == "") {
			alert("用户名不能为空");
			flag = false;
			document.form1.username.focus();
			return;
		}
		if (userPwd == "") {
			alert("用户密码不能为空");
			flag = false;
			document.form1.password.focus();
			return;
		}
		if (flag) {
			document.form1.action = "UserVerifyServlet";
			document.form1.submit();
		}
	}
</script>
</head>
<body>
    <div id="clouds" class="stage"></div>
    <div class="loginmain">
    </div>
	<form id="form1" name="form1" action="">
    <div class="row-fluid">
        <h1>教务处后台管理系统</h1>
        <p>
            <label>帐&nbsp;&nbsp;&nbsp;号：<input type="text" name="username" id="uid" /></label>
        </p><br/>
        <p>
            <label>密&nbsp;&nbsp;&nbsp;码：<input type="password" name="password" id="pwd" /></label>
        </p>
        <p class="tip">&nbsp;</p>
        <hr />
        <input type="submit" value=" 登 录 " onclick="userLogin()" class="btn btn-primary btn-large login" />
        &nbsp;&nbsp;&nbsp;<input type="reset" value=" 取 消 " class="btn btn-large" />
    </div>
    </form>
</body>
</html>
