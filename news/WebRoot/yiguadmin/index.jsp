<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8" />
    <title>���񴦺�̨����</title>
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
        <!--ͷ����ʼ-->
        <div class="top_c">
            <div class="top-nav">��¼�ɹ���&nbsp;&nbsp; | <a href="login.jsp">��ȫ�˳�</a></div>
        </div>
        <!--ͷ������-->
        <!--��߲˵���ʼ-->
        <div class="left_c left">
            <h1>���񴦺�̨����</h1>
            <div class="acc">
                <div>
                    <a class="one">���ݹ���</a>
                    <ul class="kid">
                        <li><b class="tip"></b><a target="Conframe" href="Template/jwxx_add.jsp">�������</a></li>
                        <li><b class="tip"></b><a target="Conframe" href="Template/right_jwxx.jsp">���ݹ���</a></li>
                    </ul>
                </div>
                <div>
                    <a class="one">���͹���</a>
                    <ul class="kid">
                        <li><b class="tip"></b><a target="Conframe" href="Template/type_add.jsp">�������</a></li>
                        <li><b class="tip"></b><a target="Conframe" href="Template/right_type.jsp">���͹���</a></li>
                    </ul>
                </div>
               <!--  <div id="datepicker"></div> -->
            </div>

        </div>
        <!--��߲˵�����-->
        <!--�ұ߿�ܿ�ʼ-->
        <div class="right_c">
            <div class="nav-tip" onclick="javascript:void(0)">&nbsp;</div>

        </div>
        <div class="Conframe">
            <iframe name="Conframe" id="Conframe"></iframe>
        </div>
        <!--�ұ߿�ܽ���-->

        <!--�ײ���ʼ-->
        <div class="bottom_c">Copyright &copy;2005-2011 �����չȷ�չ�Ƽ����޹�˾ ��Ȩ����</div>
        <!--�ײ�����-->
    </div>
</body>
</html>
