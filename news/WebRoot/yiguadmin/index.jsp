<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8" />
    <title>教务处后台管理</title>
    <link rel="stylesheet" type="text/css" href="Styles/admin-all.css" />
    <link rel="stylesheet" type="text/css" href="Styles/base.css" />
    <link rel="stylesheet" type="text/css" href="Styles/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="Styles/ui-lightness/jquery-ui-1.8.22.custom.css" />
    <script type="text/javascript" src="Scripts/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="Scripts/jquery-ui-1.8.22.custom.min.js"></script>
    <script type="text/javascript" src="Scripts/index.js"></script>
</head>
<body>
    <div class="warp">
        <!--头部开始-->
        <div class="top_c">
            <div class="top-nav">登录成功！&nbsp;&nbsp; | <a href="login.jsp">安全退出</a></div>
        </div>
        <!--头部结束-->
        <!--左边菜单开始-->
        <div class="left_c left">
            <h1>教务处后台管理</h1>
            <div class="acc">
                <div>
                    <a class="one">内容管理</a>
                    <ul class="kid">
                        <li><b class="tip"></b><a target="Conframe" href="Template/jwxx_add.jsp">内容添加</a></li>
                        <li><b class="tip"></b><a target="Conframe" href="Template/right_jwxx.jsp">内容管理</a></li>
                    </ul>
                </div>
                <div>
                    <a class="one">类型管理</a>
                    <ul class="kid">
                        <li><b class="tip"></b><a target="Conframe" href="Template/type_add.jsp">类型添加</a></li>
                        <li><b class="tip"></b><a target="Conframe" href="Template/right_type.jsp">类型管理</a></li>
                    </ul>
                </div>
               <!--  <div id="datepicker"></div> -->
            </div>

        </div>
        <!--左边菜单结束-->
        <!--右边框架开始-->
        <div class="right_c">
            <div class="nav-tip" onclick="javascript:void(0)">&nbsp;</div>

        </div>
        <div class="Conframe">
            <iframe name="Conframe" id="Conframe"></iframe>
        </div>
        <!--右边框架结束-->

        <!--底部开始-->
        <div class="bottom_c">Copyright &copy;2005-2011 深圳艺谷发展科技有限公司 版权所有</div>
        <!--底部结束-->
    </div>
</body>
</html>
