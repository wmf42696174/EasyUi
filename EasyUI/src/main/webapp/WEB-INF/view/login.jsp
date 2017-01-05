<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>登陆</title>
    <style type="text/css">
        body{background: url("../../static/img/bg.jpg") no-repeat;background-size:cover;}
        html{overflow:hidden;}
        *{margin:0px;padding:0px;font-family:"幼圆"}
        h1{margin:0px auto;margin-top:200px;width:400px;height:50px;text-align:center;line-height:50px;color:#fff;
            text-shadow:4px 2px 3px #000;}
        /*login start*/
        .login{padding-top:50px;width:400px;height:350px;margin:10px auto;}
        .login p{background:rgba(16, 10, 28,.5);width:300px;height:40px;margin:10px auto;}
        .login p span{margin:4px 5px;width:32px;height:32px;display:block;float:left;}
        .login p span.l_id{background:url(/static/img/id.png) no-repeat 10px 4px;}
        .login p span.l_pass{background:url(/static/img/pass.png) no-repeat 10px 4px;}
        .login p input{border-radius:5px;color:#fff;float:right;background:rgba(16, 10, 28,.5);font-size:16px;padding-left:4px;outline:0;border:0;width:245px;height:32px;margin:4px 6px;}
        .login p input.btn{width:100%;height:40px;background:#110D24;margin:0px;cursor:pointer;border-radius:7px;}
        .login p input.btn:hover{background:#1A1939;}
        a.regit{margin-left:48px;color:#fff;text-decoration:none;}
        a.forgot{margin-left:200px;color:#fff;text-decoration:none;}
        /*login end*/
        .tip{display:none;width:300px;height:120px;position:absolute;top:0px;left:530px;background:#fff;}
        .tip .t_title{width:100%;height:30px;background:#131231;color:#fff;line-height:30px;}
        .tip .t_title p{color:#000;width:100%;height:30px;font-size:16px;letter-spacing:4px;margin-top:10px;}
    </style>
</head>
<body>
<h1>低购网登陆</h1>
<form action="j_spring_security_check" method="post">
    <div style="display: none;" class="msg">${error}</div>
    <div class="login">
        <p><span class="l_id"></span><input type="text" placeholder="账号" id="id" class="id" name="j_username" /></p>
        <p><span class="l_pass"></span><input type="password" placeholder="密码" id="password" class="password" name="j_password"/></p>
        <p><input type="submit" value="登录" class="btn"/></p>
        <a href="../user/regist"class="regit">注册</a><a href="../user/getback" class="forgot">忘记密码</a>
    </div>
</form>
<!-- login end -->
<div class="tip animated bounceInDown">
    <div class="t_title">温馨提示
        <p id="tishi">你输入的账号不存在或密码错误，请重新输入</p>
    </div>
</div>
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script>
    var msg=$(".msg").text();
    if(msg!="success"){
        $(".tip").show();
        setTimeout(function(){
            $(".tip").slideUp();
        },2500);
    }
</script>
</body>


</html>
