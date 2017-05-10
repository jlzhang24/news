<%@ page language="java"
	import="java.util.*,com.zhang.util.*,java.sql.*,com.zhang.dao.*"
	pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<link rel="stylesheet" type="text/css" href="../Styles/base.css" />
<script type="text/javascript" src="../Scripts/jquery-1.7.2.js"></script>
<script type="text/javascript"
	src="../Scripts/jquery-ui-1.8.22.custom.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="../Styles/ui-lightness/jquery-ui-1.8.22.custom.css" />
<link rel="stylesheet" type="text/css" href="../Styles/formui.css" />
<link href="../Styles/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../Scripts/tb.js"></script>
<script type="text/javascript">
        $(function () {
            $(".datepicker").datepicker();

            $('#list').hide();
            $('#find').click(function () {
                $('#list').show();
            })
        })

    </script>
</head>

<%
	JWXXDao dboper = new JWXXDao();
	ResultSet rs = null;
	int count = 0;
	String pageStr = request.getParameter("page");
	String jwxx_type = request.getParameter("type");
	int currentPage = 1;
	if (pageStr != null) {
		currentPage = Integer.parseInt(pageStr);
	}
	Page pagemodel = null;
	if (jwxx_type == null) {
		count = dboper.getAllJwxxCount();
		pagemodel = new Page(8, count, currentPage);
		int fromIndex = pagemodel.getFromIndex();
		int pageSize = pagemodel.getPageSize();
		String sql = "select * from tb_jwxx order by jwxx_date desc limit ?,?";
		Connection conn = new DBHelper().getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, fromIndex);
		pstmt.setInt(2, pageSize);
		rs = pstmt.executeQuery();
		count = dboper.getAllJwxxCount();
	} else {
		count = dboper.getJwxxCount(jwxx_type);
		pagemodel = new Page(8, count, currentPage);
		int fromIndex = pagemodel.getFromIndex();
		int pageSize = pagemodel.getPageSize();
		String sql = "select * from tb_jwxx where jwxx_type=? order by jwxx_date desc limit ?,?";
		Connection conn = new DBHelper().getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, jwxx_type);
		pstmt.setInt(2, fromIndex);
		pstmt.setInt(3, pageSize);
		rs = pstmt.executeQuery();
		count = dboper.getJwxxCount(jwxx_type);
	}
%>

<body>
	<div class="alert alert-info">
		<a href="right_jwxx.jsp?page=1&type=jwxw">教务新闻 <a /> | <a
			href="right_jwxx.jsp?page=1&type=jwgg">教务公告 <a /> | <a
				href="right_jwxx.jsp?page=1&type=guide">办事指南 <a />| <a
					href="right_jwxx.jsp?page=1&type=form">表格下载 <a />| <a
						href="right_jwxx.jsp?page=1&type=ldjs">领导介绍<a />| <a
							href="right_jwxx.jsp?page=1&type=ksjs">科室介绍<a />| <a
								href="right_jwxx.jsp?page=1&type=bmjs">部门介绍<a />
	</div>
	<table class="tablelist">
		<thead>
			<tr>
				<th width="5%"><input name="" type="checkbox" value=""
					checked="" /></th>
				<th width="46%">标题</th>
				<th width="10%">用户</th>
				<th width="10%">发布单位</th>
				<th width="16%">发布时间</th>
				<th width="13%">操作</th>
			</tr>
		</thead>
		<tbody>
			<%
				while (rs.next()) {
			%>

			<tr>
				<td><input name="" type="checkbox" value="" /></td>
				<td><%=rs.getString("jwxx_title")%></td>
				<td><%=rs.getString("jwxx_author")%></td>
				<td>江苏南京</td>
				<td><%=rs.getString("jwxx_date")%></td>
				<td><a href="jwxx_update.jsp?id=<%=rs.getInt("jwxx_id")%>"
					class="tablelink">修改</a> <a
					href="jwxx_del.jsp?id=<%=rs.getInt("jwxx_id")%>" class="tablelink"
					onclick="return confirm('确定要删除吗？')"> 删除</a></td>
			</tr>

			<%
				}
			%>
		</tbody>
	</table>

	<%
		if (jwxx_type == null) {
	%>
	<div class="fanye">
		<div class="pagin">
			<div class="message">
				共<i class="blue"><%=count%></i>条记录，当前第&nbsp;<i class="blue"><%=currentPage%>&nbsp;</i>页
			</div>
			<ul class="paginList">
				<li class="paginItem"><a href="right_jwxx.jsp?page=1">首 页</a></li>
				<%
					if ((currentPage - 1) <= 0) {
				%>
				<li class="paginItem"><a href="right_jwxx.jsp?page=1">上一页</a></li>
				<%
					} else {
				%>
				<li class="paginItem"><a
					href="right_jwxx.jsp?page=<%=currentPage - 1%>">上一页</a></li>
				<%
					}
				%>
				<%
					if ((currentPage + 1) >= pagemodel.getPageCount()) {
				%>
				<li class="paginItem"><a
					href="right_jwxx.jsp?page=<%=pagemodel.getPageCount()%>">下一页</a></li>
				<%
					} else {
				%>
				<li class="paginItem"><a
					href="right_jwxx.jsp?page=<%=currentPage + 1%>">下一页</a></li>
				<%
					}
				%>
				<li class="paginItem"><a
					href="right_jwxx.jsp?page=<%=pagemodel.getPageCount()%>">末 页</a></li>
			</ul>
		</div>
	</div>

	<%
		} else {
	%>
	<div class="fanye">
		<div class="pagin">
			<div class="message">
				共<i class="blue"><%=count%></i>条记录，当前第&nbsp;<i class="blue"><%=currentPage%>&nbsp;</i>页
			</div>
			<ul class="paginList">
				<li class="paginItem"><a
					href="right_jwxx.jsp?page=1&type=<%=jwxx_type%>">首 页</a></li>
				<%
					if ((currentPage - 1) <= 0) {
				%>
				<li class="paginItem"><a
					href="right_jwxx.jsp?page=1&type=<%=jwxx_type%>">上一页</a></li>
				<%
					} else {
				%>
				<li class="paginItem"><a
					href="right_jwxx.jsp?page=<%=currentPage - 1%>&type=<%=jwxx_type%>">上一页</a>
				</li>
				<%
					}
				%>
				<%
					if ((currentPage + 1) >= pagemodel.getPageCount()) {
				%>
				<li class="paginItem"><a
					href="right_jwxx.jsp?page=<%=pagemodel.getPageCount()%>&type=<%=jwxx_type%>">下一页</a>
				</li>
				<%
					} else {
				%>
				<li class="paginItem"><a
					href="right_jwxx.jsp?page=<%=currentPage + 1%>&type=<%=jwxx_type%>">下一页</a>
				</li>
				<%
					}
				%>
				<li class="paginItem"><a
					href="right_jwxx.jsp?page=<%=pagemodel.getPageCount()%>&type=<%=jwxx_type%>">末
						页</a></li>
			</ul>
		</div>
	</div>
	<%
		}
	%>
</body>
</html>
