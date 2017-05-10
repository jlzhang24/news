<%@ page language="java"
	import="java.util.*,com.zhang.util.*,java.sql.*,com.zhang.dao.*"
	pageEncoding="utf-8"%>
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
	TYPEDao dboper = new TYPEDao();
	ResultSet rs = null;
	int count = 0;
	count = dboper.getAllTypeCount();
	String pageStr = request.getParameter("page");
	int currentPage = 1;
	if (pageStr != null) {
		currentPage = Integer.parseInt(pageStr);
	}
	Page pagemodel = new Page(5, count, currentPage);
	int fromIndex = pagemodel.getFromIndex();
	int pageSize = pagemodel.getPageSize();
	String sql = "select * from tb_type order by type_id limit ?,?";
	Connection conn = new DBHelper().getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, fromIndex);
	pstmt.setInt(2, pageSize);
	rs = pstmt.executeQuery();
%>

<body>
	<div class="alert alert-info">类型管理</div>
	<table class="tablelist">
		<thead>
			<tr>
				<th width="10%">类型id</th>
				<th width="10%">类型编号</th>
				<th width="10%">类型名称</th>
				<th width="10%">操作</th>
			</tr>
		</thead>
		<tbody>
			<%
				while (rs.next()) {
			%>

			<tr>
				<td><%=rs.getInt("type_id")%></td>
				<td><%=rs.getString("type_bh")%></td>
				<td><%=rs.getString("type_name")%></td>
				<td><a href="type_update.jsp?id=<%=rs.getInt("type_id")%>"
					class="tablelink">修改</a> <a
					href="type_del.jsp?id=<%=rs.getInt("type_id")%>" class="tablelink"
					onclick="return confirm('确定要删除吗？')"> 删除</a>
				</td>
			</tr>

			<%
				}
			%>
		</tbody>
	</table>

	<div class="pagin">
		<div class="message">
			共<i class="blue"><%=count%></i>条记录，当前显示第&nbsp;<i class="blue"><%=currentPage%>&nbsp;</i>页
		</div>
		<ul class="paginList">
			<li class="paginItem"><a href="right_type.jsp?page=1">首页</a>
			</li>
			<%
				if ((currentPage - 1) <= 0) {
			%>
			<li class="paginItem"><a href="right_type.jsp?page=1">上一页</a>
			</li>
			<%
				} else {
			%>
			<li class="paginItem"><a
				href="right_type.jsp?page=<%=currentPage - 1%>">上一页</a>
			</li>
			<%
				}
			%>
			<%
				if ((currentPage + 1) >= pagemodel.getPageCount()) {
			%>
			<li class="paginItem"><a
				href="right_type.jsp?page=<%=pagemodel.getPageCount()%>">下一页</a>
			</li>
			<%
				} else {
			%>
			<li class="paginItem"><a
				href="right_type.jsp?page=<%=currentPage + 1%>">下一页</a>
			</li>
			<%
				}
			%>
			<li class="paginItem"><a
				href="right_type.jsp?page=<%=pagemodel.getPageCount()%>">末页</a>
			</li>
		</ul>
	</div>
</body>
</html>
