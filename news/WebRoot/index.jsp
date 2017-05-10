<%@ page language="java"
	import="java.util.*,java.sql.*,com.zhang.util.*,com.zhang.model.*,com.zhang.dao.*"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0032)http://zjxc.cy.ncss.org.cn/eweb/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title>兰州理工大学教务处</title> <!-- js设置 -->
	<link rel="stylesheet" type="text/css" href="./css/css.css">
		<link rel="stylesheet" type="text/css" href="./css/changepic.css">
</head>
<script type="text/javascript" src="http://www.itxueyuan.org/uploads/javascript/jquery.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	$(".imageRotation").each(function(){
		// 获取有关参数
		var imageRotation = this,  // 取得 图片轮换容器
			imageBox = $(imageRotation).children(".imageBox")[0],  // 取得 图片容器
			icoBox = $(imageRotation).children(".icoBox")[0],  // 取得 图标容器
			icoArr = $(icoBox).children(),  // 取得所有图标，并保存为数组
			imageWidth = $(imageRotation).width(),  // 图片宽度
			imageNum = $(imageBox).children().size(),  // 图片数量
			imageReelWidth = imageWidth*imageNum,  // 图片容器宽度
			activeID = parseInt($($(icoBox).children(".active")[0]).attr("rel")),  // 当前图片ID
			nextID = 0,  // 下张图片ID
			setIntervalID,  // setInterval() 函数ID
			intervalTime = 4000,  // 间隔时间
			speed =500;  // 执行速度
		
		// 设置 图片容器 的宽度
		$(imageBox).css({'width' : imageReelWidth + "px"});
		
		// 图片轮换函数
		var rotate=function(clickID){
			if(clickID){ nextID = clickID; }
			else{ nextID=activeID<=3 ? activeID+1 : 1; }
			
			$(icoArr[activeID-1]).removeClass("active");
			$(icoArr[nextID-1]).addClass("active");
			$(imageBox).animate({left:"-"+(nextID-1)*imageWidth+"px"} , speed);
			
			activeID = nextID;
		}
		setIntervalID=setInterval(rotate,intervalTime);
		
		$(imageBox).hover(
			function(){ clearInterval(setIntervalID); },
			function(){ setIntervalID=setInterval(rotate,intervalTime); }
		);	
		
		$(icoArr).click(function(){
			clearInterval(setIntervalID);
			var clickID = parseInt($(this).attr("rel"));
			rotate(clickID);
			setIntervalID=setInterval(rotate,intervalTime);
		});
	});
});
</script>
<%
	JWXX jwnews = new JWXX();
	ResultSet rs_news = new JWXXDao().getAllJwxx("jwxw",7);
	ResultSet rs_jwgg = new JWXXDao().getAllJwxx("jwgg",7);
	ResultSet rs_form = new JWXXDao().getAllJwxx("form",7);
	ResultSet rs_guide = new JWXXDao().getAllJwxx("guide",7);
%>
<body>
	<div class="container">
		<div style="z-index: 2">
			<jsp:include page="head.jsp" />
		</div>
		<div class="content">
			<div class="picture">
				<div class="imageRotation">
					<div class="imageBox">
						<a href=""><img
							src="images/tp1.jpg" />
						</a> <a href=""><img
							src="images/tp2.jpg" />
						</a> <a href=""><img
							src="images/tp3.jpg" />
						</a> <a href=""><img
							src="images/tp4.jpg" />
						</a> <a href=""><img
							src="images/5.jpg" />
						</a>
					</div>
					<div class="icoBox">
						<span class="active" rel="1">1</span> <span rel="2">2</span> <span
							rel="3">3</span> <span rel="4">4</span> <span rel="5">5</span>
					</div>
				</div>
			</div>
			<div class="main" align="center">
				<div class="left">
					<div class="box_1">
						<div class="left_title">
							<a href="index_jwxx.jsp?page=1&type=guide" target="_blank"
								style="color:#FFF;">办事指南</a>
						</div>
						<div class="left_nr">
							<ul>
								<%
									while (rs_guide.next()) {
										String guide_title = rs_guide.getString("jwxx_title");
										if (guide_title.length() > 12) {
											guide_title = guide_title.substring(0, 12);
										}
								%>
								<li><a
									href="index_xxdetail.jsp?id=<%=rs_guide.getInt("jwxx_id")%>"
									target="_blank"><%=guide_title%></a>
								</li>
								<%
									}
								%>

							</ul>
						</div>
					</div>
					<div class="box_1">
						<div class="left_title">
							<a href="index_jwxx.jsp?page=1&type=form" target="_blank"
								style="color:#FFF">表格下载</a>
						</div>
						<div class="left_nr">
							<ul>
								<%
									while (rs_form.next()) {
										String form_title = rs_form.getString("jwxx_title");
										if (form_title.length() > 12) {
											form_title = form_title.substring(0, 12);
										}
								%>
								<li><a
									href="index_xxdetail.jsp?id=<%=rs_form.getInt("jwxx_id")%>"
									target="_blank"><%=form_title%></a>
								</li>
								<%
									}
								%>
							</ul>
						</div>
					</div>
					<div class="box_1" style="margin:0px;">
						<div class="left_title" style="color:#FFF;">友情链接</div>
						<div class="left_nr">
							<ul>
								<li><select
									onchange="if(this.selectedIndex &amp;&amp this.selectedIndex!=0){window.open(this.value);}this.selectedIndex=0;">
										<option selected="" value="0">教育部门</option>
										<option value="http://www.moe.edu.cn/">国家教育部</option>
										<option value="http://www.chsi.com.cn/">高等教育学生信息网</option>
										<option value="http://www.gsedu.gov.cn/">甘肃省教育厅</option>
										<option value="http://www.gsedu.com.cn/">甘肃教育网</option>
								</select></li>
								<li><select
									onchange="if(this.selectedIndex &amp;&amp; this.selectedIndex!=0){window.open(this.value);}this.selectedIndex=0;">
										<option selected="" value="0">教学资源网</option>
										<option value="http://www.jingpinke.com/">国家精品课程资源网</option>
										<option value="http://www.icourses.cn/home/">爱课程网</option>
										<option value="http://open.163.com/ocw/">网易公开课</option>
										<option value="http://mooc.guokr.com/">MOOC学院</option>
								</select></li>
								<li><select
									onchange="if(this.selectedIndex &amp;&amp; this.selectedIndex!=0){window.open(this.value);}this.selectedIndex=0;">
										<option selected="" value="0">友情链接</option>
										<option value="http://jwc.lzu.edu.cn/">兰州大学教务处</option>
										<option value="http://www.nwnu.edu.cn/cate.do?dept=0032">西北师范大学教务处</option>
										<option value="http://jiaowu.lzjtu.edu.cn/">兰州交通大学教务处</option>
										<option value="http://jwc.xbmu.edu.cn/">西北民族大学教务处</option>
										<option value="http://jwgl.lzcc.edu.cn/jwweb/">兰州财经大学教务处</option>
								</select></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="content" id="content">
					<div class="right">
							<div class="news">
								<div class="news_title">
									<div align="center">
										<span>教务公告</span><a href="index_jwxx.jsp?page=1&type=jwgg" target="_blank"><img
											src="images/more.jpg" /> </a>
									</div>
								</div>
								<div align="center">
									<table width="101%" border="0" cellspacing="0" cellpadding="0">
										<%
											while (rs_jwgg.next()) {
												String title = rs_jwgg.getString("jwxx_title");
												if (title.length() > 23) {
													title = title.substring(0, 23);
												}
										%>
										<tr>
											<td width="75%" height="30" align="left"><a
												href="index_xxdetail.jsp?id=<%=rs_jwgg.getInt("jwxx_id")%>"
												target="_blank"><%=title%></a></td>
											<td width="25%" height="30" align="center"><div
													align="right"><%=rs_jwgg.getString("jwxx_date")%></div>
											</td>
										</tr>
										<%
											}
										%>
									</table>
								</div>
							</div>
							<br><br />
							<div class="news">
							<div class="news_title">
								<div align="center">
									<span>教务新闻</span><a href="index_jwxx.jsp?page=1&type=jwxw" target="_blank"><img
										src="images/more.jpg" /> </a>
								</div>
							</div>
							<div align="center">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<%
										while (rs_news.next()) {
											String title = rs_news.getString("jwxx_title");
											if (title.length() > 23) {
												title = title.substring(0, 23);
											}
									%>
									<tr>
										<td width="75%" height="30" align="left"><a
											href="index_xxdetail.jsp?id=<%=rs_news.getInt("jwxx_id")%>"
											target="_blank"><%=title%></a></td>
										<td width="25%" height="30" align="center"><div
												align="right" class="STYLE4"><%=rs_news.getString("jwxx_date")%></div>
										</td>
									</tr>
									<%
										}
									%>
								</table>
							</div>
						</div>
					</div>

					<div class="righttoleft">
						<div class="box_daohang">
							<div class="left_title STYLE2">
								<div align="center" style="color:#FFF">快速导航</div>
							</div>
							<div class="left_title_site">
								<div class="daohang" align="center">
									<a href="http://jiaowu.lut.cn/www/HdAbout.asp?ClassId=72"
										target="_blank">> 教务管理系统</a>
								</div>
							</div>
							<div class="left_title_site">
								<div class="daohang" align="center">
									<a href="http://202.201.34.46/eol/homepage/common/"
										target="_blank">> 网络教学平台</a>
								</div>
							</div>
							<div class="left_title_site">
								<div class="daohang" align="center">
									<a href="http://202.201.33.27:8090/cxcy/front/home/index.jsp"
										target="_blank">> 大创计划管理平台</a>
								</div>
							</div>
							<div class="left_title_site">
								<div class="daohang" align="center">
									<a href="http://jiaowu.lut.cn/www/default.asp" target="_blank">> 本科生教育</a>
								</div>
							</div>
							<div class="left_title_site">
								<div class="daohang" align="center">
									<a href="http://202.201.32.4:8080/" target="_blank">> 教风学风建设</a>
								</div>
							</div>
							<div class="left_title_site">
								<div class="daohang" align="center">
									<a href="http://zhaosheng.lut.cn/" target="_blank">> 本科生招生网</a>
								</div>
							</div>
							<div class="left_title_site">
								<div class="daohang" align="center">
									<a href="http://202.201.32.4:9600/" target="_blank">> 教师发展中心</a>
								</div>
							</div>
							<div class="left_title_site">
								<div class="daohang" align="center">
									<a href="http://202.201.32.4:8088/" target="_blank">> 教师评学系统</a>
								</div>
							</div>
							<div class="left_title_site">
								<div class="daohang" align="center">
									<a href="http://202.201.32.4:8089/" target="_blank">> 实习评价系统</a>
								</div>
							</div>
						</div>
						<div class="box_1" style="margin:0px;">
							<div class="left_title">
								<div align="center" style="color:#FFF">上课时间表</div>
							</div>
							<div class="left_nr">
								<table width="220">
									<tr>
										<td><div align="center">大节</div></td>
										<td><div align="center">小节</div></td>
										<td>
											<div align="center">时间</div></td>
									</tr>
									<tr>
										<td rowspan="2"><div align="center">一</div></td>
										<td><div align="center">1</div></td>
										<td><div align="center">8:00-8:50</div></td>
									</tr>
									<tr>
										<td><div align="center">2</div></td>
										<td><div align="center">9:00-9:50</div></td>
									</tr>
									<tr>
										<td rowspan="2"><div align="center">二</div></td>
										<td><div align="center">3</div></td>
										<td><div align="center">10:10-11:00</div></td>
									</tr>
									<tr>
										<td><div align="center">4</div></td>
										<td><div align="center">11:10-12:00</div></td>
									</tr>
									<tr>
										<td rowspan="2"><div align="center">三</div></td>
										<td><div align="center">5</div></td>
										<td><div align="center">14:30-15:20</div></td>
									</tr>
									<tr>
										<td><div align="center">6</div></td>
										<td><div align="center">15:30-16:20</div></td>
									</tr>
									<tr>
										<td rowspan="2"><div align="center">四</div></td>
										<td><div align="center">7</div></td>
										<td><div align="center">16:30-17:20</div></td>
									</tr>
									<tr>
										<td><div align="center">8</div></td>
										<td><div align="center">17:30-18:20</div></td>
									</tr>
									<tr>
										<td rowspan="2"><div align="center">五</div></td>
										<td><div align="center">9</div></td>
										<td><div align="center">19:30-20:20</div></td>
									</tr>
									<tr>
										<td><div align="center">10</div></td>
										<td><div align="center">20:30-21:20</div></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="foot_copyright">
			<div id="footer" style="color: #fff;">
				<p>通信地址：兰州市七里河区兰工坪路287号 邮政编码：730050</p>
				<p>兰州理工大学教务处教务科</p>
			</div>
		</div>
	</div>
</body>
</html>



