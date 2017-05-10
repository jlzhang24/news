<%@ page language="java"
	import="java.util.*,java.sql.*,com.zhang.util.*,com.zhang.model.*,com.zhang.dao.*"
	pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0069)http://zjxc.cy.ncss.org.cn/eweb/jyb/xx/cntnews.so?type=view&mtjj=mtjj -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>教务新闻</title>
	<link rel="stylesheet" type="text/css" href="./css/css_news.css">
	<link rel="stylesheet" type="text/css" href="./css/css.css">
</head>
<%
	ResultSet rs = null;
	String jwxx_type = request.getParameter("type");
	String type = new TYPEDao().getTypeName(jwxx_type);
	rs = new JWXXDao().getAllJwxx(jwxx_type);
	int count = 0;
	count = new JWXXDao().getJwxxCount(jwxx_type);
	String pageStr = request.getParameter("page");
	int currentPage = 1;
	if (pageStr != null) {
		currentPage = Integer.parseInt(pageStr);
	}
	Page pagemodel = new Page(3, count, currentPage);
	int fromIndex = pagemodel.getFromIndex();
	int pageSize = pagemodel.getPageSize();
	String sql = "select * from tb_jwxx where jwxx_type=? order by jwxx_date desc limit ?,?";
	Connection conn = new DBHelper().getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, jwxx_type);
	pstmt.setInt(2, fromIndex);
	pstmt.setInt(3, pageSize);
	rs = pstmt.executeQuery();
%>

<body>
	<div class="container">
		<!-- 页面头部开始 -->
		<div>
			<jsp:include page="head.jsp" />
		</div>
		<!-- 页面头部结束 -->

		<!-- 页面正文开始 -->
		<div class="content_news">
			<div class="leftnews">
				<ul>
					<h3>栏目导航</h3>
					<li><a href="index_jwxx.jsp?page=1&type=jwxw">教务新闻</a>
					</li>
					<li><a href="index_jwxx.jsp?page=1&type=jwgg">教务公告</a>
					</li>
					<li><a href="index_jwxx.jsp?page=1&type=guide">办事指南</a>
					</li>
					<li><a href="index_jwxx.jsp?page=1&type=form">下载中心</a>
					</li>
				</ul>
			</div>
			<div class="rightnews" id="right_news">
				<div class="rightnews_title">
					<h3>首页&nbsp;&gt;&nbsp;<%=type %></h3>
				</div>
				<div class="newslist">
					<ul>
						<%
							while (rs.next()) {
						%>
						<li><a
							href="index_xxdetail.jsp?id=<%=rs.getInt("jwxx_id")%>"
							target="_blank"><%=rs.getString("jwxx_title")%></a><span><%=rs.getString("jwxx_date")%></span>
						</li>
						<%
							}
						%>
					</ul>
				</div>

				<div class="fanye">
					<div class="pagin">
						<div class="message">
							共<i class="blue"><%=count%></i>条记录，当前第&nbsp;<i class="blue"><%=currentPage%>&nbsp;</i>页
						</div>
						<ul class="paginList">
							<li class="paginItem"><a href="index_jwxx.jsp?page=1&type=<%=jwxx_type %>">首  页</a>
							</li>
							<%
								if ((currentPage - 1) <= 0) {
							%>
							<li class="paginItem"><a href="index_jwxx.jsp?page=1&type=<%=jwxx_type %>">上一页</a>
							</li>
							<%
								} else {
							%>
							<li class="paginItem"><a href="index_jwxx.jsp?page=<%=currentPage - 1%>&type=<%=jwxx_type %>">上一页</a>
							</li>
							<%
								}
							%>
							<%
								if ((currentPage + 1) >= pagemodel.getPageCount()) {
							%>
							<li class="paginItem"><a
								href="index_jwxx.jsp?page=<%=pagemodel.getPageCount()%>&type=<%=jwxx_type %>">下一页</a>
							</li>
							<%
								} else {
							%>
							<li class="paginItem"><a
								href="index_jwxx.jsp?page=<%=currentPage + 1%>&type=<%=jwxx_type %>">下一页</a>
							</li>
							<%
								}
							%>
							<li class="paginItem"><a
								href="index_jwxx.jsp?page=<%=pagemodel.getPageCount()%>&type=<%=jwxx_type %>">末  页</a>
							</li>
						</ul>
					</div>
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