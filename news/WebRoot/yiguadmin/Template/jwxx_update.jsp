<%@ page language="java"
	import="java.util.*,com.zhang.model.*,com.zhang.util.*,com.zhang.dao.*"
	pageEncoding="GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
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
<script language="javascript" type="text/javascript"
	src="My97DatePicker/WdatePicker.js"></script>
<!-- �����ļ� -->
<script type="text/javascript" src="../../ueditor/ueditor.config.js"></script>
<!-- �༭��Դ���ļ� -->
<script type="text/javascript" src="../../ueditor/ueditor.all.js"></script>
<title>��̨�������</title>
</head>

<%
	int jwxx_id = Integer.parseInt(request.getParameter("id"));
	JWXX jwxx = new JWXX();
	jwxx = new JWXXDao().getJwxxById(jwxx_id);
%>

<body>
	<div class="alert alert-info">�������</div>
	<div class="formbody">
		<div id="usual1" class="usual">
			<div id="tab1" class="tabson">

				<form id="xx" name="xx" method="post" action="UpdateXXServlet"
					enctype="multipart/form-data">
					<ul class="forminfo">
						<input type="hidden" name="jwxx_id" value="<%=jwxx.getJwxx_id()%>" />
						<li><label>���ű���<b>*</b> </label><input name="title"
							type="text" class="dfinput" style="width:518px;"
							value="<%=jwxx.getJwxx_title()%>" /></li>
						<li><label>��������<b>*</b> </label><select name="list"
							style="width: 200px;height: 30px;border: 1px solid ;">
								<option value="jwxw" selected="selected">��������</option>
								<option value="jwgg">���񹫸�</option>
								<option value="guide">����ָ��</option>
								<option value="form">�������</option>
								<option value="bmjs">���Ž���</option>
								<option value="ldjs">�쵼����</option>
								<option value="ksjs">���ҽ���</option>
						</select></li>
						<li><label>��&nbsp;&nbsp;&nbsp;&nbsp;��<b>*</b> </label><input
							name="author" type="text" class="dfinput" style="width:200px;"
							value="<%=jwxx.getJwxx_author()%>" /></li>
						<li><label>���ʱ��<b>*</b> </label><input name="time"
							type="text" class="Wdate" onClick="WdatePicker()"
							style="width:200px;" value="<%=jwxx.getJwxx_date()%>" /></li>
						<li><label>֪ͨ����<b>*</b> </label><br> <br> <textarea
								id="content" name="content" value=<%=jwxx.getJwxx_content()%>></textarea>
							<script type="text/javascript">
								var ue = UE.getEditor('content');
							</script></li>
						<li><label>�ļ��ϴ�<b>*</b> </label><input type="file"
							class="dfinput" name="file"></li>
						<li><label>&nbsp;</label><input name="" type="submit"
							class="btn" value="�޸Ĺ���" /></li>
					</ul>
				</form>
			</div>
		</div>

	</div>
</body>
</html>
