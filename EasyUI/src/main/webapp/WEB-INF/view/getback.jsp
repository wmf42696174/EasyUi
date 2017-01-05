<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>找回密码</title>
    <style type="text/css">
        body{background:url("/static/img/bg.jpg") no-repeat;background-size:cover;}
        html{overflow:hidden;}
        .box{width:400px;height:400px;margin:200px auto;}
        .box h1{margin:0px auto;width:400px;height:50px;text-align:center;line-height:50px;color:#fff;
            text-shadow:4px 2px 3px #000;}
        .box p{height:40px;margin-top:40px;}
        .box p.password{display:none;line-height:40px;margin-top:-10px;text-align: center;font-size:20px;color: #fff;}
        .box p input{width:200px;border-radius:4px;height:30px;border:none;outline: none;float:left;margin:5px 40px;}
        .box p a{width:70px;height:30px;border-radius:3px;float:left;color:#fff;margin:4px 1px;text-decoration:none;background:#503CAD;line-height: 30px;text-align: center;}
        .box p a.login{width:300px;margin-left: 50px;}
    </style>
</head>
<body>
<div class="box">
    <h1>找回密码</h1>
    <p><input type="text" placeholder="请输入查询账号" id="id"/><a href="javascript:void(0)" class="yes">确认</a></p>
    <p><input type="text" placeholder="请输入验证码" id="yan"/><a href="javascript:void(0)" class="get">找回</a></p>
    <p class="password tishi">您的密码为</p>
    <p class="password pass">20144596</p>
    <p class="password"><a href="/sys/log/back" class="login">返回登陆</a></p>
</div>
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script>
    $(".yes").click(function(){
        var id=$("#id").val();
        $.ajax({
            type:"post",
            url:"../user/yanzheng",
            data:{id:id},
            success:function () {
                
            }
        })
    });
    $(".get").click(function () {
        var yan=$("#yan").val();
        $.ajax({
            type:"post",
            url:"../user/he",
            data:{yan:yan},
            success:function (user) {
                if(user.password==null){
                    $(".tishi").show();
                    $(".tishi").html("验证码有误")
                }
                else{
                    $(".password").show();
                    $(".tishi").html("您的密码为")
                    $(".pass").html(user.password);
                }

            }
        })
    })
</script>
</body>
</html>
