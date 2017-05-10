<%@ page contentType="text/html;charset=utf-8"
	import="java.util.*,java.net.*,com.zhang.model.*,com.zhang.dao.*,java.sql.*,com.jspsmart.upload.SmartUpload,java.io.*;"
	pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>教务新闻</title>
</head>
<%
	response.setCharacterEncoding("utf-8");
	JWXX jwxx = new JWXX();
	int jwxx_id = Integer.parseInt(request.getParameter("id"));
	jwxx = new JWXXDao().getJwxxById(jwxx_id);
	String fileName = jwxx.getJwxx_attachment();
	//System.out.println(fileName);
	String path = "F:/upload/" + fileName;

	File file = new File(path);// path是根据日志路径和文件名拼接出来的
	String filename = file.getName();// 获取日志文件名称
	InputStream fis = new BufferedInputStream(new FileInputStream(path));
	byte[] buffer = new byte[fis.available()];
	fis.read(buffer);
	fis.close();
	response.reset();
	// 先去掉文件名称中的空格,然后转换编码格式为utf-8,保证不出现乱码,这个文件名称用于浏览器的下载框中自动显示的文件名
	response.addHeader("Content-Disposition", "attachment;filename="
			+ new String(
					filename.replaceAll(" ", "").getBytes("utf-8"),
					"iso8859-1"));
	response.addHeader("Content-Length", "" + file.length());
	OutputStream os = new BufferedOutputStream(
			response.getOutputStream());
	response.setContentType("application/octet-stream");
	os.write(buffer);// 输出文件
	os.flush();
	os.close();
	out.clear();
	out = pageContext.pushBody();
%>

</html>
