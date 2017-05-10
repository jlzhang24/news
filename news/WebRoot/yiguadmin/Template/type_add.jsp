<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
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
<body>

	<div class="alert alert-info">
		当前位置<b class="tip"></b>查询界面<b class="tip"></b>表单样式
	</div>
	<div class="formbody">
		<div id="usual1" class="usual">
			<div id="tab1" class="tabson">

				<form name="form" id="form" method="post" action="InsertTYPEServlet">
					<ul class="forminfo">
						<li><label>类型编号<b>*</b> </label><input
							name="typebh" type="text" class="dfinput" style="width:200px;" />
						</li>
						<li><label>类型名称<b>*</b> </label><input
							name="typename" type="text" class="dfinput" style="width:200px;" />
						</li>
						<li><label>&nbsp;</label><input name="" type="submit"
							class="btn" value="添加" />
						</li>
					</ul>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
