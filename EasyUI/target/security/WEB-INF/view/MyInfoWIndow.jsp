<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="CM_box" style="width: 300px;height:500px;border-radius:4px;background: #333762;margin-top:-20px;">
        <form action="../user/ChangeUser" method="post" id="myForm">
            <h1 style="width:100%;height:40px;color:#fff;text-align: center;line-height: 40px;font-size: 22px;">修改信息</h1>
            <input type="hidden" name="id" id="id" style="padding-left:4px;background:#525898;color:#fff;display:inline-block;width:140px;height:22px;border-radius: 4px;border:none;"/>
            <p><span style="display: inline-block;height:30px;color:#fff;text-align:center;width:80px;line-height: 30px;">手机号:</span><input style="padding-left:4px;background:#525898;color:#fff;display:inline-block;width:140px;height:22px;border-radius: 4px;border:none;" type="text" name="phone" id="phone"  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/></p>
            <p><span style="display: inline-block;height:30px;color:#fff;text-align:center;width:80px;line-height: 30px;">年龄:</span><input style="padding-left:4px;background:#525898;color:#fff;display:inline-block;width:140px;height:22px;border-radius: 4px;border:none;" type="text" name="age" id="age"  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/></p>
            <p><span style="display: inline-block;height:30px;color:#fff;text-align:center;width:80px;line-height: 30px;">密码:</span><input style="padding-left:4px;background:#525898;color:#fff;display:inline-block;width:140px;height:22px;border-radius: 4px;border:none;" type="text" name="password" id="password" /></p>
            <p>
                <span style="display: inline-block;height:30px;color:#fff;text-align:center;width:80px;line-height: 30px;">性别:</span>
                <select name="sex" id="sex" style="padding-left:4px;width:100px;color:#fff;height:22px;border-radius: 2px;background:#525898;">
                        <option value="1">男</option>
                        <option value="2">女</option>
                </select>
            </p>
            <p>
                <span style="display: inline-block;height:30px;color:#fff;text-align:center;width:80px;line-height: 30px;">email:</span>
                <input style="padding-left:4px;background:#525898;color:#fff;display:inline-block;width:140px;height:22px;border-radius: 4px;border:none;" type="text" name="email" id="email" />
            </p>
            <p>
                <span style="display: inline-block;height:30px;color:#fff;text-align:center;width:80px;line-height: 30px;">地址:</span>
                <input style="padding-left:4px;background:#525898;color:#fff;display:inline-block;width:140px;height:22px;border-radius: 4px;border:none;" id="address" name="address"/>
            </p>
            <p style="padding-left: 30px;">
                <input style="padding-left:4px;background:#525898;color:#fff;display:inline-block;width:140px;height:22px;border-radius: 4px;border:none;" type="submit" value="修改" class="change" style="width:100px;background: #525891;cursor: pointer"/>
                <a href="" style="border-radius:4px;width:100px;height:22px;display:inline-block;background: #525898;text-decoration: none;color:#fff;text-align: center;line-height: 22px;">取消</a>
            </p>
        </form>
 </div>
</body>
</html>
