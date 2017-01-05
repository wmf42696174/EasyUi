<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="keywords" content="jquery,ui,easy,easyui,web">
    <meta name="description" content="easyui help you build your web page easily!">
    <title>首页</title>
    <style type="text/css">
          *{margin:0px;padding:0px;}
          .header{width:1200px;height:40px;margin:0 auto;}
          .header .person{display:block;width:150px;height:35px;font-size:14px;
            text-align: center;line-height: 35px;color:#fff;float:left}
         .header .type{display:block;width:150px;height:35px; text-align: center;line-height: 35px;
            color:#fff;float:right;}
         .header .quit{text-decoration:none;color:#fff;float:right;margin-right:-200px;display:inline-block;width:60px;line-height:40px;text-align:center;height:40px;}
    </style>
    <link rel="stylesheet" type="text/css" href="/static/easyui.css">
    <link rel="stylesheet" type="text/css" href="/static/icon.css">
    <script type="text/javascript" src="/static/js/jquery.js"></script>
    <script type="text/javascript" src="/static/jquery.easyui.min.js"></script>

</head>
<%
    HttpSession session1=request.getSession();
    String Name=(String) session1.getAttribute("username");
    String type=(String)session1.getAttribute("type");

%>
<body class="easyui-layout" style="width:100%;height:100%;background:#436;">
<div data-options="region:'north',split:true" style="height:60px;background:rgb(143, 154, 193);">
    <div class="header">
        <span class="person">欢迎<%=Name%>登陆</span>
        <span class="type"><%=type%></span>
        <a class="quit" href="../user/login">注销</a>
    </div>
</div>
<div data-options="region:'center'">
    <div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'west',split:true" title="导航菜单" style="width:150px;overflow:hidden;">
            <div class="easyui-accordion" style="width:150px;height:100%;" id="west" >
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                <div title="用户管理" data-options="iconCls:'icon-manager'"style="padding:10px;overflow:auto;position:relative">
                   <p style="width:100%;display:block;height:20px;line-height:20px;text-align: center;
                   background:url(/static/icons/manager.png) no-repeat 18px;cursor: pointer;" >
                       <a class="jump" rel="../user/list?index=index&pagenum=1" href="#" style="text-decoration: none;" >用户管理</a>
                   </p>
                </div>
                 </sec:authorize>
                <sec:authorize access="hasAnyRole('ROLE_USER','ROLE_SALE')">
                <div title="个人管理" data-options="iconCls:'icon-grgl'"style="padding:10px;overflow:auto;position:relative">
                    <p style="width:100%;display:block;height:20px;line-height:20px;text-align: center;
                   background:url(/static/icons/grgl.png) no-repeat 18px;cursor: pointer;" >
                        <a class="jump" rel="../user/MyInfo" href="#" style="text-decoration: none;" >个人管理</a>
                    </p>
                </div>
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_USER')">
                    <div title="我的商品" data-options="iconCls:'icon-wdsp'"style="padding:10px;overflow:auto;position:relative">
                        <p style="width:100%;display:block;height:20px;line-height:20px;text-align: center;
                   background:url(/static/icons/wdsp.png) no-repeat 18px;cursor: pointer;" >
                            <a class="jump" rel="../goods/showmygoodslist" href="#" style="text-decoration: none;" >我的商品</a>
                        </p>
                    </div>
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                <div title="商品审核"  data-options="iconCls:'icon-spsh'"style="padding:10px;">
                    <p style="width:100%;display:block;height:20px;line-height:20px;text-align: center;
                   background:url(/static/icons/spsh.png) no-repeat 18px;cursor: pointer;">
                        <a class="jump" rel="../goods/checkgoods" style="text-decoration: none;">商品审核</a>
                    </p>
                </div>
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                <div title="交易记录"  data-options="iconCls:'icon-jyjl'"style="padding:10px;">
                    <p style="width:100%;display:block;height:20px;line-height:20px;text-align: center;
                   background:url(/static/icons/jyjl.png) no-repeat 18px;cursor: pointer;">
                        <a class="jump" rel="../record/showallrecordlist" style="text-decoration: none;">交易记录</a>
                    </p>
                </div>
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_SALE')">
                    <div title="购买记录"  data-options="iconCls:'icon-jyjl'"style="padding:10px;">
                        <p style="width:100%;display:block;height:20px;line-height:20px;text-align: center;
                   background:url(/static/icons/jyjl.png) no-repeat 18px;cursor: pointer;">
                            <a class="jump" rel="../record/showmyrecord" style="text-decoration: none;">购买记录</a>
                        </p>
                    </div>
                </sec:authorize>
                <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
                <div title="用户需求"  data-options="iconCls:'icon-khxq'"style="padding:10px;">
                    <p style="width:100%;display:block;height:20px;line-height:20px;text-align: center;
                   background:url(/static/icons/khxq.png) no-repeat 18px;cursor: pointer;">
                        <a class="jump" rel="../want/showwantlist" style="text-decoration: none;">用户需求</a>
                    </p>
                </div>
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_SALE')">
                    <div title="我的需求"  data-options="iconCls:'icon-khxq'"style="padding:10px;">
                        <p style="width:100%;display:block;height:20px;line-height:20px;text-align: center;
                   background:url(/static/icons/khxq.png) no-repeat 18px;cursor: pointer;">
                            <a class="jump" rel="../want/showmywantlist" style="text-decoration: none;">我的需求</a>
                        </p>
                    </div>
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_SALE')">
                <div title="商品列表"  data-options="iconCls:'icon-khxq'"style="padding:10px;">
                    <p style="width:100%;display:block;height:20px;line-height:20px;text-align: center;
                   background:url(/static/icons/splb.png) no-repeat 18px;cursor: pointer;">
                        <a class="jump" rel="../goods/showallgoods" style="text-decoration: none;">商品列表</a>
                    </p>
                </div>
                </sec:authorize>
            </div>
        </div>
        <div class="easyui-tabs" id="tt" data-options="region:'center',fit:true,border:false,closable:true">
           <div title="首页">
               <iframe style="width: 100%; height: 100%;" frameborder="0"
                       src="../user/show"></iframe>
           </div>
        </div>

    </div>
</div>
<script type="text/javascript">
    $(".jump").click(function(){
        var url=$(this).attr('rel');
        var title=$(this).html();
        $('#tt').tabs('add',{
            title:title,
            content:'<iframe style="width: 100%; height: 100%;" frameborder="0" src="' + url + '"></iframe>',
            closable:true
        });
    });

</script>
</body>
</html>