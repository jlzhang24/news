<%@ page language="java" import="java.util.*,com.zhang.model.*,com.zhang.util.*,com.zhang.dao.*" pageEncoding="GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<title>��̨�������</title>
</head>
<%
	int type_id = Integer.parseInt(request.getParameter("id"));
	TYPE type = new TYPE();
	int temp = new TYPEDao().deleteTYPEById(type_id);
	
	if(temp == 1)
	{
		out.print("<script>alert('ɾ���ɹ�');window.location.href='/news/yiguadmin/Template/right_type.jsp'</script>");
	}
%>

<body>

</body>
</html>
