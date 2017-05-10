<%@ page language="java"
	import="java.util.*,com.zhang.model.*,com.zhang.util.*,com.zhang.dao.*"
	pageEncoding="GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
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
	$(function() {
		$(".datepicker").datepicker();

		$('#list').hide();
		$('#find').click(function() {
			$('#list').show();
		})
	})
</script>
<title>后台新闻添加</title>
</head>

<%
	int type_id = Integer.parseInt(request.getParameter("id"));
	TYPE type = new TYPE();
	type = new TYPEDao().getTypeById(type_id);
%>

<body>
	<div class="alert alert-info">添加类型</div>
	<div class="formbody">
		<div id="usual1" class="usual">
			<div id="tab1" class="tabson">

				<form id="xx" name="xx" method="post" action="UpdateTYPEServlet">
					<ul class="forminfo">
						<input type="hidden" name="type_id" value="<%=type.getType_id()%>" />
						<li><label>类型编号<b>*</b> </label><input name="type_bh"
							type="text" class="dfinput" style="width:518px;"
							value="<%=type.getType_bh()%>" />
						</li>
						<li><label>类型名称<b>*</b> </label><input
							name="type_name" type="text" class="dfinput" style="width:200px;"
							value="<%=type.getType_name()%>" />
						</li>
						<li><label>&nbsp;</label><input name="" type="submit"
							class="btn" value="修改" />
						</li>
					</ul>
				</form>
			</div>
		</div>

	</div>
</body>
</html>
