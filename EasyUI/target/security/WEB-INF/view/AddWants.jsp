<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@include file="main.jsp"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/static/css/animate.css">
    <style type="text/css">
        *{margin:0px;padding: 0px;font-family:"幼圆"}
        .AddBox{width:100%;height:100%;position: absolute;background: rgba(0,0,0,.5);}
        .AddBox .AddCenter{padding-top:20px;box-shadow:0px 0px 23px 2px #fff;width: 240px;height:380px;border-radius:4px;margin:20px auto;background: #333762;}
        .AddBox .AddCenter h1{width:100%;height:40px;color:#fff;text-align: center;line-height: 40px;font-size: 22px; }
        .AddBox .AddCenter p{width: 100%;height:40px;display:block;margin-top:10px;}
        .AddBox .AddCenter p span{display: inline-block;height:30px;color:#fff;text-align:center;width:80px;line-height: 30px;}
        .AddBox .AddCenter p input{padding-left:4px;background:#525898;color:#fff;display:inline-block;width:140px;height:22px;border-radius: 4px;border:none;}
        .AddBox .AddCenter p a{border-radius:4px;width:100px;height:22px;display:inline-block;background: #525898;text-decoration: none;color:#fff;text-align: center;line-height: 22px;}
    </style>
</head>
<body>
<div class="AddBox">
    <div class="AddCenter">
        <form action="<%=basePath%>/want/add" method="post" id="MyForm">
            <h1>需求发布</h1>
            <p><span>商品名:</span><input type="text" name="goodname" id="goodname" required/></p>
            <p><span>接受价格:</span><input type="text" name="price" id="price" onkeyup="value=value.replace(/[^\d.]/g,'')" required/></p>
            <p>
                <span>需求数量:</span>
                <input type="text" name="wantnum" id="wantnum" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" required/>
            </p>
            <p>
                <span>商品说明:</span>
                <input id="description" name="description" required/>
            </p>
            <p style="padding-left: 20px;margin-top: 10px;">
                <input type="submit" value="发布" class="change" style="width:100px;background: #525891;cursor: pointer;"/>
                <a href="<%=basePath%>/want/return">取消</a>
            </p>
        </form>
    </div>
</div>
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/jquery.validate.min.js"/>
<script>
    $.validator.setDefaults({
        submitHandler:function () {
            alert("提交")
        }

    });

    $().ready(function() {
        $("#MyForm").validate();
    });

</script>
</body>
</html>
