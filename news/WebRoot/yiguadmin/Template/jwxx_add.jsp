<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
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
<!-- ���ر༭�������� -->
<script id="container" name="content" type="text/plain">
        ����д��ĳ�ʼ������
    </script>
<!-- �����ļ� -->
<script type="text/javascript"  src="../../ueditor/ueditor.config.js"></script>
<!-- �༭��Դ���ļ� -->
<script type="text/javascript"  src="../../ueditor/ueditor.all.js"></script>
<script type="text/javascript" charset="utf-8" src="../../ueditor/lang/zh-cn/zh-cn.js"></script>

<script language="javascript" type="text/javascript"
	src="My97DatePicker/WdatePicker.js"></script>
<title>��̨�������</title>
</head>
<body>

	<div class="alert alert-info">
		��ǰλ��<b class="tip"></b>��ѯ����<b class="tip"></b>����ʽ
	</div>
	<div class="formbody">
		<div id="usual1" class="usual">
			<div id="tab1" class="tabson">

				<form name="form" id="form" method="post" action="InsertXXServlet"
					enctype="multipart/form-data">
					<ul class="forminfo">
						<li><label>���ű���<b>*</b> </label><input name="title"
							type="text" class="dfinput" style="width:518px;" /></li>
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
							name="author" type="text" class="dfinput" style="width:200px;" />
						</li>
						<li><label>���ʱ��<b>*</b> </label><input name="time"
							type="text" class="Wdate" onClick="WdatePicker()"
							style="width:200px;height: 30px;" /></li>
						<li><label>֪ͨ����<b>*</b> </label><br> <br> <textarea
								id="content" name="content"></textarea> <script
								type="text/javascript">
									var ue = UE.getEditor('content');
								</script></li>
						<li><label>�ļ��ϴ�<b>*</b> </label><input type="file"
							class="dfinput" name="file"></li>
						<li><label>&nbsp;</label><input name="" type="submit"
							class="btn" value="���Ϸ���" /></li>
					</ul>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
