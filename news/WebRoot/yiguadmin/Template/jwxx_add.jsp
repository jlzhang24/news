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
<!-- 加载编辑器的容器 -->
<script id="container" name="content" type="text/plain">
        这里写你的初始化内容
    </script>
<!-- 配置文件 -->
<script type="text/javascript"  src="../../ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript"  src="../../ueditor/ueditor.all.js"></script>
<script type="text/javascript" charset="utf-8" src="../../ueditor/lang/zh-cn/zh-cn.js"></script>

<script language="javascript" type="text/javascript"
	src="My97DatePicker/WdatePicker.js"></script>
<title>后台新闻添加</title>
</head>
<body>

	<div class="alert alert-info">
		当前位置<b class="tip"></b>查询界面<b class="tip"></b>表单样式
	</div>
	<div class="formbody">
		<div id="usual1" class="usual">
			<div id="tab1" class="tabson">

				<form name="form" id="form" method="post" action="InsertXXServlet"
					enctype="multipart/form-data">
					<ul class="forminfo">
						<li><label>新闻标题<b>*</b> </label><input name="title"
							type="text" class="dfinput" style="width:518px;" /></li>
						<li><label>新闻类型<b>*</b> </label><select name="list"
							style="width: 200px;height: 30px;border: 1px solid ;">
								<option value="jwxw" selected="selected">教务新闻</option>
								<option value="jwgg">教务公告</option>
								<option value="guide">办事指南</option>
								<option value="form">表格下载</option>
								<option value="bmjs">部门介绍</option>
								<option value="ldjs">领导介绍</option>
								<option value="ksjs">科室介绍</option>
						</select></li>
						<li><label>作&nbsp;&nbsp;&nbsp;&nbsp;者<b>*</b> </label><input
							name="author" type="text" class="dfinput" style="width:200px;" />
						</li>
						<li><label>添加时间<b>*</b> </label><input name="time"
							type="text" class="Wdate" onClick="WdatePicker()"
							style="width:200px;height: 30px;" /></li>
						<li><label>通知内容<b>*</b> </label><br> <br> <textarea
								id="content" name="content"></textarea> <script
								type="text/javascript">
									var ue = UE.getEditor('content');
								</script></li>
						<li><label>文件上传<b>*</b> </label><input type="file"
							class="dfinput" name="file"></li>
						<li><label>&nbsp;</label><input name="" type="submit"
							class="btn" value="马上发布" /></li>
					</ul>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
