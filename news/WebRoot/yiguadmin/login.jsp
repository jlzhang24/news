<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>���񴦺�̨����ϵͳ</title>
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
			alert("�û�������Ϊ��");
			flag = false;
			document.form1.username.focus();
			return;
		}
		if (userPwd == "") {
			alert("�û����벻��Ϊ��");
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
        <h1>���񴦺�̨����ϵͳ</h1>
        <p>
            <label>��&nbsp;&nbsp;&nbsp;�ţ�<input type="text" name="username" id="uid" /></label>
        </p><br/>
        <p>
            <label>��&nbsp;&nbsp;&nbsp;�룺<input type="password" name="password" id="pwd" /></label>
        </p>
        <p class="tip">&nbsp;</p>
        <hr />
        <input type="submit" value=" �� ¼ " onclick="userLogin()" class="btn btn-primary btn-large login" />
        &nbsp;&nbsp;&nbsp;<input type="reset" value=" ȡ �� " class="btn btn-large" />
    </div>
    </form>
</body>
</html>
