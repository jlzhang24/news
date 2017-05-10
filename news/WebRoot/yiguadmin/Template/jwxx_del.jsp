<%@ page language="java" import="java.util.*,com.zhang.model.*,com.zhang.util.*,com.zhang.dao.*" pageEncoding="GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<title>后台新闻添加</title>
</head>
<%
	int jwxx_id = Integer.parseInt(request.getParameter("id"));
	JWXX jwxx = new JWXX();
	int temp = new JWXXDao().deleteJWXXById(jwxx_id);
	if(temp == 1)
	{
		out.print("<script>alert('删除成功');window.location.href='/news/yiguadmin/Template/right_jwxx.jsp'</script>");
	}
%>

<body>

</body>
</html>
