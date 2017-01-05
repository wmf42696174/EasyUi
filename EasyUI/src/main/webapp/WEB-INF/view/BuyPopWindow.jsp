<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/static/easyui.css">
    <link rel="stylesheet" type="text/css" href="/static/icon.css">
    <script type="text/javascript" src="/static/js/jquery.js"></script>
    <script type="text/javascript" src="/static/jquery.easyui.min.js"></script>
</head>
<body>
<div class="AddCenter" style="box-shadow:0px 0px 23px 2px #fff;margin-top:-20px;width: 240px;height:380px;border-radius:4px;background: #333762;">
    <form action="../record/AddRecord" method="post" id="BuyForm">
        <h1 style="width:100%;height:40px;color:#fff;text-align: center;line-height: 40px;font-size: 22px;">购买商品</h1>
        <input type="hidden" name="id" id="id" />
        <p><span style="display: inline-block;height:30px;color:#fff;text-align:center;width:80px;line-height: 30px;">商品名:</span><input readonly="true" style="padding-left:4px;background:#525898;color:#fff;display:inline-block;width:140px;height:22px;border-radius: 4px;border:none;" type="text" name="name" id="name" required/></p>
        <p><span style="display: inline-block;height:30px;color:#fff;text-align:center;width:80px;line-height: 30px;">价格:</span><input readonly="true" style="padding-left:4px;background:#525898;color:#fff;display:inline-block;width:140px;height:22px;border-radius: 4px;border:none;" type="text" name="price" id="price" onkeyup="value=value.replace(/[^\d.]/g,'')" required/></p>
        <p>
            <span style="display: inline-block;height:30px;color:#fff;text-align:center;width:80px;line-height: 30px;">购买数量:</span>
            <input style="padding-left:4px;background:#525898;color:#fff;display:inline-block;width:140px;height:22px;border-radius: 4px;border:none;" name="gnum" id="gnum" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" required oninput="change(event)" onporpertychange="change(event)"/>
        </p>
        <p>
            <span style="display: inline-block;height:30px;color:#fff;text-align:center;width:80px;line-height: 30px;">应支付:</span>
            <input id="gsum" readonly="true" value=" " style="padding-left:4px;background:#525898;color:#fff;display:inline-block;width:140px;height:22px;border-radius: 4px;border:none;" name="gsum" required/>
        </p>
        <p style="padding-left: 20px;margin-top: 10px;">
            <input type="submit" value="购买" class="change" style="border:none;color:#fff;display:inline-block;width:100px;background: #525891;cursor: pointer;border-radius: 4px;border:none;"/>
            <a href="<%=basePath%>/goods/Return" style="border-radius:4px;width:100px;height:22px;display:inline-block;background: #525898;text-decoration: none;color:#fff;text-align: center;line-height: 22px;">取消</a>
        </p>
    </form>
</div>
<script>
    $("#gnum").numberspinner({
        min:1,
        editable:false,
        onChange:function (newValue,oldValue) {
            var price=document.getElementById("price").value;
            console.info(newValue*price);
            $("#gsum").val(newValue*price);
        }
    })
</script>
</body>
</html>
