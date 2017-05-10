<%@ page language="java"
	import="java.util.*,java.sql.*,com.zhang.util.*,com.zhang.model.*,com.zhang.dao.*"
	pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0069)http://zjxc.cy.ncss.org.cn/eweb/jyb/xx/cntnews.so?type=view&mtjj=mtjj -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<%
	String jwxx_type = request.getParameter("type");
	JWXX jwxx = new JWXX();
	ResultSet rs = null;
	rs = new JWXXDao().getAllJwxx(jwxx_type);
	if(rs.next()){
		jwxx.setJwxx_id(rs.getInt("jwxx_id"));
		jwxx.setJwxx_title(rs.getString("jwxx_title"));
		jwxx.setJwxx_content(rs.getString("jwxx_content"));
	}
%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title><%=jwxx.getJwxx_title()%></title>
	<link rel="stylesheet" type="text/css" href="./css/css_news.css">
	<link rel="stylesheet" type="text/css" href="./css/css.css">
		<link rel="stylesheet" type="text/css" href="./css/detailpage.css">
</head>

<body>
	<div class="container">
		<!-- 页面头部开始 -->
		<div>
			<jsp:include page="head.jsp" />
		</div>
		<!-- 页面头部结束 -->

		<!-- 页面正文开始 -->
		<div class="content_news_detail">
			<div class="leftnews">
				<ul>
					<h3>栏目导航</h3>
					<li><a href="index_jgsz.jsp?type=ldjs">领导介绍</a></li>
					<li><a href="index_jgsz.jsp?type=ksjs">科室介绍</a></li>
					<li><a href="index_jgsz.jsp?type=bmjs">工作职责</a></li>
				</ul>
			</div>
			<div class="rightnews_detail" id="right_news_detail">
				<div class="rightnews_title_detail">
					<h3></>首页&nbsp;&gt;&nbsp;<%=jwxx.getJwxx_title()%></h3>
				</div>
				<div class="xiangqing_content">
					<%=jwxx.getJwxx_content()%>
				</div>
			</div>
		</div>
		<!-- 页面正文结束-->

		<!--脚部信息-->
		<div class="foot_copyright">
			<div id="footer" style="color: #fff;">
				<p>通信地址：兰州市七里河区兰工坪路287号 邮政编码：730050</p>
				<p>兰州理工大学教务处教务科</p>
			</div>
		</div>
		<!--脚部信息  END-->

	</div>
</body>
</html>