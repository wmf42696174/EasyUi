<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
</head>
<body>
    <div class="C_Box" style="box-shadow:0px 0px 23px 2px #fff;width: 260px;height:400px;border-radius:4px;margin-top:-20px;background: #333762;">
        <form action="../goods/changegoodsinfo" method="post" id="GoodsForm">
            <h1 style="width:100%;height:40px;color:#fff;text-align: center;line-height: 40px;font-size: 22px;">修改商品</h1>
            <input type="hidden" name="id" id="id" />
            <p><span style="display: inline-block;height:30px;color:#fff;text-align:center;width:80px;line-height: 30px;">商品名:</span><input style="padding-left:4px;background:#525898;color:#fff;display:inline-block;width:140px;height:22px;border-radius: 4px;border:none;" type="text" name="name" id="name" /></p>
            <p><span style="display: inline-block;height:30px;color:#fff;text-align:center;width:80px;line-height: 30px;">价格:</span><input style="padding-left:4px;background:#525898;color:#fff;display:inline-block;width:140px;height:22px;border-radius: 4px;border:none;" type="text" name="price" id="price" /></p>
            <p>
                <span style="display: inline-block;height:30px;color:#fff;text-align:center;width:80px;line-height: 30px;">数量:</span>
                <input type="text" name="num" id="num" style="padding-left:4px;background:#525898;color:#fff;display:inline-block;width:140px;height:22px;border-radius: 4px;border:none;"/>
            </p>
            <p>
                <span style="display: inline-block;height:30px;color:#fff;text-align:center;width:80px;line-height: 30px;">类型</span>
                <select name="type" id="type" style="padding-left:4px;width:100px;color:#fff;height:22px;border-radius: 2px;background:#525898;">
                    <option value="1">学习用品</option>
                    <option value="2">生活用品</option>
                    <option value="3">电子设备</option>
                    <option value="4">其他</option>
                </select>
            </p>
            <p>
                <span style="display: inline-block;height:30px;color:#fff;text-align:center;width:80px;line-height: 30px;">说明:</span>
                <input id="mark" name="mark" style="padding-left:4px;background:#525898;color:#fff;display:inline-block;width:140px;height:22px;border-radius: 4px;border:none;"/>
            </p>
            <p style="padding-left: 30px;">
                <input type="submit" value="修改" class="change" style="width:100px;background: #525891;cursor: pointer;padding-left:4px;color:#fff;display:inline-block;height:22px;border-radius: 4px;border:none;"/>
                <a href="../goods/Return" style="border-radius:4px;width:100px;height:22px;display:inline-block;background: #525898;text-decoration: none;color:#fff;text-align: center;line-height: 22px;">取消</a>
            </p>
        </form>
    </div>
</body>
</html>
