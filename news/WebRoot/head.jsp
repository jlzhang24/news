<%@ page language="java"
	import="java.util.*,java.sql.*,com.zhang.util.*,com.zhang.model.*,com.zhang.dao.*"
	pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="./css/nav.css" rel="stylesheet" type="text/css" />


<body>
	<div class="top">
		<div class="header">
			<div class="frame">
				<div class="frame_inner">
					<div class="logo" onmousemove="this.style.cursor='pointer'"
						onclick="window.location='http://www.lut.cn'">
						<img src="images/lut_logo.jpg" style="width:100%; height: 100%;">
					</div>
					<div class="banner">
						<img src="images/bg_logo.jpg">
					</div>
				</div>
				<div class="logo_daohang">
					<a href="">学校校历</a>&nbsp;<a href="http://jiaowu.lut.cn/webwww/" target="_blank">旧版回顾</a>&nbsp;<a href="./yiguadmin/login.jsp" target="_blank">管理入口</a>
				</div>
			</div>
		</div>
	</div>
	<div class="guide">
		<ul>
			<li><a href="index.jsp">首页</a></li>
			<li><a href="">机构设置</a>
				<ul>
					<li><a href="index_jgsz.jsp?type=ldjs" target="_blank">领导介绍</a></li>
					<li><a href="index_jgsz.jsp?type=ksjs" target="_blank">科室介绍</a></li>
					<li><a href="index_jgsz.jsp?type=bmjs" target="_blank">工作职责</a></li>
				</ul>
			</li>
			<li><a href="#">质量管理</a>
				<ul>
					<li><a href="#">教学动态</a></li>
					<li><a href="#">教学评估</a></li>
					<li><a href="#">教师评奖</a></li>
				</ul>
			</li>
			<li><a href="">教务运行</a>
				<ul>
					<li><a href="#">成绩管理</a></li>
					<li><a href="#">考务管理</a></li>
					<li><a href="#">课程调度</a></li>
					<li><a href="#">学籍管理</a></li>
				</ul>
			</li>
			<li><a href="">综合管理</a>
				<ul>
					<li><a href="#">教材建设</a></li>
					<li><a href="#">管理文件</a></li>
				</ul>
			</li>
			<li><a href="">教学研究</a>
				<ul>
					<li><a href="#">教学成果</a></li>
					<li><a href="#">教研立项</a></li>
				</ul>
			</li>
			<li><a href="">规章制度</a></li>
			<li><a href="http://202.201.32.4:9600/" target="_blank">教师教学发展</a></li>
		</ul>
	</div>
</body>
</html>