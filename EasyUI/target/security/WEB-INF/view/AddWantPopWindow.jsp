<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="AddCenter" style="box-shadow:0px 0px 23px 2px #fff;margin-top:-20px;width: 240px;height:380px;border-radius:4px;background: #333762;">
    <form action="<%=basePath%>/want/add" method="post" id="wantForm">
        <h1 style="width:100%;height:40px;color:#fff;text-align: center;line-height: 40px;font-size: 22px;">需求发布</h1>
        <p><span style="display: inline-block;height:30px;color:#fff;text-align:center;width:80px;line-height: 30px;">商品名:</span><input style="padding-left:4px;background:#525898;color:#fff;display:inline-block;width:140px;height:22px;border-radius: 4px;border:none;" type="text" name="goodname" id="goodname" required/></p>
        <p><span style="display: inline-block;height:30px;color:#fff;text-align:center;width:80px;line-height: 30px;">接受价格:</span><input style="padding-left:4px;background:#525898;color:#fff;display:inline-block;width:140px;height:22px;border-radius: 4px;border:none;" type="text" name="price" id="price" onkeyup="value=value.replace(/[^\d.]/g,'')" required/></p>
        <p>
            <span style="display: inline-block;height:30px;color:#fff;text-align:center;width:80px;line-height: 30px;">需求数量:</span>
            <input type="text" style="padding-left:4px;background:#525898;color:#fff;display:inline-block;width:140px;height:22px;border-radius: 4px;border:none;" name="wantnum" id="wantnum" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" required/>
        </p>
        <p>
            <span style="display: inline-block;height:30px;color:#fff;text-align:center;width:80px;line-height: 30px;">商品说明:</span>
            <input id="description"  style="padding-left:4px;background:#525898;color:#fff;display:inline-block;width:140px;height:22px;border-radius: 4px;border:none;" name="description" required/>
        </p>
        <p style="padding-left: 20px;margin-top: 10px;">
            <input type="submit" value="发布" class="change" style="border:none;color:#fff;display:inline-block;width:100px;background: #525891;cursor: pointer;border-radius: 4px;border:none;"/>
            <a href="#" style="border-radius:4px;width:100px;height:22px;display:inline-block;background: #525898;text-decoration: none;color:#fff;text-align: center;line-height: 22px;">取消</a>
        </p>
    </form>
</div>
</body>
</html>
