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
        <form action="<%=basePath%>/goods/add" method="post" id="goodsForm">
            <h1 style="width:100%;height:40px;color:#fff;text-align: center;line-height: 40px;font-size: 22px;">商品发布</h1>
            <p><span style="display: inline-block;height:30px;color:#fff;text-align:center;width:80px;line-height: 30px;">商品名:</span><input style="padding-left:4px;background:#525898;color:#fff;display:inline-block;width:140px;height:22px;border-radius: 4px;border:none;" type="text" name="name" id="name" required/></p>
            <p><span style="display: inline-block;height:30px;color:#fff;text-align:center;width:80px;line-height: 30px;">价格:</span><input style="padding-left:4px;background:#525898;color:#fff;display:inline-block;width:140px;height:22px;border-radius: 4px;border:none;" type="text" name="price" id="price" onkeyup="value=value.replace(/[^\d.]/g,'')" required/></p>
            <p>
                <span style="display: inline-block;height:30px;color:#fff;text-align:center;width:80px;line-height: 30px;">数量:</span>
                <input type="text" style="padding-left:4px;background:#525898;color:#fff;display:inline-block;width:140px;height:22px;border-radius: 4px;border:none;" name="num" id="num" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" required/>
            </p>
            <p>
                <span style="display: inline-block;height:30px;color:#fff;text-align:center;width:80px;line-height: 30px;">类型:</span>
                <select name="type" id="type" style="width:100px;background: #7288a9;border-radius: 3px;color:#fff;">
                    <option value="1">学习用品</option>
                    <option value="2">生活用品</option>
                    <option value="3">电子设备</option>
                    <option value="4">其他</option>
                </select>
            </p>
            <p>
                <span style="display: inline-block;height:30px;color:#fff;text-align:center;width:80px;line-height: 30px;">说明:</span>
                <input id="mark"  style="padding-left:4px;background:#525898;color:#fff;display:inline-block;width:140px;height:22px;border-radius: 4px;border:none;" name="mark" required/>
            </p>
            <p style="padding-left: 20px;margin-top: 10px;">
                <input type="submit" value="发布" class="change" style="border:none;color:#fff;display:inline-block;width:100px;background: #525891;cursor: pointer;border-radius: 4px;border:none;"/>
                <a href="<%=basePath%>/goods/Return" style="border-radius:4px;width:100px;height:22px;display:inline-block;background: #525898;text-decoration: none;color:#fff;text-align: center;line-height: 22px;">取消</a>
            </p>
        </form>
    </div>
</body>
</html>
