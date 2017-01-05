<<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/static/easyui.css">
    <link rel="stylesheet" type="text/css" href="/static/icon.css">
    <script type="text/javascript" src="/static/js/jquery.js"></script>
    <script type="text/javascript" src="/static/jquery.easyui.min.js"></script>
    <script>
        function err(target, message){
            var t = $(target);
            if (t.hasClass('textbox-text')){
                t = t.parent();
            }
            var m = t.next('.error-message');
            if (!m.length){
                m = $('<div class="error-message"></div>').insertAfter(t);
            }
            m.html(message);
        }
    </script>
    <style type="text/css">
        *{margin:0px;padding:0px;font-family:"幼圆"}
        .box{width:300px;height:500px;border-radius:4px;margin-top:-20px;box-shadow:0px 0px 2px 2px #fff;background:rgba(120, 170, 189,.5)}
        .box h1{ text-shadow:4px 2px 3px #000;width:100%;height:30px;line-height: 30px;text-align: center;font-size: 22px;color:#000;}
        .box p{position:relative;width:100%;height:35px;margin-top: 5px;}
        .box p span{display:inline-block;width:100px;height: 35px;text-align: center;float:left;line-height: 35px;color:#000;}
        .box p input{display: inline-block;width:160px;height:26px;float:left;border: 0px;margin-top: 5px;background:rgba(120, 170, 189,.4);color:#000;border-radius: 3px;}
        .box p select{width:100px;height:26px;float:left;margin-top:5px;border-radius:4px;background:rgba(120, 170, 189,.4);color:#000;}

        .box p input.submit{width:100px;height:30px;text-align: center;line-height: 30px;margin-left: 30px;cursor:pointer;background:rgba(120, 170, 189,.8);}

    </style>
    <style scoped="scoped">
        .tb{
            width:100%;
            margin:0;
            padding:5px 4px;
            border:1px solid #ccc;
            box-sizing:border-box;
        }
        .error-message{
            margin: 4px 0 0 0;
            padding: 0;
            color: red;
        }
    </style>
</head>
<div class="box">
    <form method="post" action="../user/AddUser" id="userForm">
        <p>
            <span>用户名:</span>
            <input type="text" name="userName" id="userName" class="easyui-validatebox tb"
                   data-options="required:true,validType:'length[3,10]',validateOnCreate:false,err:err"/>
        </p>
        <p>
            <span>密码:</span>
            <input type="password" name="password" id="password" class="easyui-validatebox tb"
                   data-options="required:true,validType:'length[3,10]',validateOnCreate:false,err:err"/>
        </p>
        <p>
            <span>验证密码:</span>
            <input type="password" name="v_password" id="v_password" class="easyui-validatebox tb"
                   data-options="required:true,validType:'length[3,10]',validateOnCreate:false,err:err"/>
        </p>
        <p>
            <span>年龄:</span>
            <input type="text" name="age" id="age" class="easyui-validatebox tb"
                   data-options="required:true,validateOnCreate:false,err:err"/>
        </p>
        <p>
            <span>性别:</span>
            <select name="sex" id="sex">
                <option value="1">男</option>
                <option value="2">女</option>
            </select>
        </p>
        <p>
            <span>邮箱:</span>
            <input type="text" name="email" id="email" class="easyui-validatebox tb"
                   data-options="required:true,validType:'email',validateOnCreate:false,err:err"/>
        </p>
        <p>
            <span>电话:</span>
            <input type="text" name="phone" id="phone" class="easyui-validatebox tb"
                   data-options="required:true,validateOnCreate:false,err:err"/>
        </p>
        <p>
            <span>类型:</span>
            <select name="type" id="type">
                <option value="卖方">卖方</option>
                <option value="买方">买方</option>
            </select>
        </p>
        <p>
            <span>住址:</span>
            <input type="text" name="address" id="address" class="easyui-validatebox tb"
                   data-options="required:true,validateOnCreate:false,err:err"/>
        </p>
        <p>
            <input type="submit" value="注册" class="submit"/>
            <input type="button" value="重置" class="submit clean"/>
        </p>
    </form>
</div>
</body>
</html>
