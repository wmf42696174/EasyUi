<<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<head>
    <title>用户注册</title>
    <script src="https://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
    <script src="https://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <script src="https://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
    <script>
        $(function () {
            $("#MyForm").validate({
                rules:{
                    userName:"required",
                    password:"required",
                    v_password:{
                        required:true,
                        equalTo:"#password"
                    },
                    age:{
                        required:true,
                        digits:true
                    },
                    email:{
                        required:true,
                        email:true
                    },
                    phone:{
                        required:true,
                        digits:true
                    },
                    address:"required"
                },
                messages:{
                    userName:"请输入用户民",
                    password:"请输入密码",
                    v_password:{
                        required:"请输入验证密码",
                        equalTo:"两次密码要一致"
                    },
                    age:{
                        required:"请输入年龄",
                        digits:"请输入整数"
                    },
                    email:{
                        required:"请输入邮箱",
                        email:"请输入正确的邮箱格式"
                    },
                    phone:{
                        required:"请输入电话号码",
                        digits:"请输入正确格式电话号码"
                    },
                    address:"请输入家庭住址"
                }
            })
        });

    </script>
    <style type="text/css">
        body{background: url("../../static/img/bg.jpg") no-repeat;background-size:cover;}
        html{overflow:hidden;}
        *{margin:0px;padding:0px;font-family:"幼圆"}
        .box{width:300px;height:500px;padding-top:10px;border-radius:4px;box-shadow:0px 0px 2px 2px #fff;margin:100px auto;background:rgba(120, 170, 189,.5)}
        .box h1{ text-shadow:4px 2px 3px #000;width:100%;height:30px;line-height: 30px;text-align: center;font-size: 22px;color:#fff;}
        .box p{position:relative;width:100%;height:35px;margin-top: 5px;}
        .box p span{display:inline-block;width:100px;height: 35px;text-align: center;float:left;line-height: 35px;color:#fff;}
        .box p input{display: inline-block;width:160px;height:26px;float:left;border: 0px;margin-top: 5px;background:rgba(120, 170, 189,.4);color:#fff;padding-left:4px;border-radius: 3px;}
        .box p select{width:100px;height:26px;float:left;margin-top:5px;border-radius:4px;background:rgba(120, 170, 189,.4);color:#fff;}
        .box p input.submit{width:100px;height:30px;text-align: center;line-height: 30px;margin-left: 30px;cursor:pointer;background:rgba(120, 170, 189,.8);}
          .error{color:#fff;font-size: 12px;position: absolute;margin-top: 10px;margin-left: 5px;}
        .tip{display:none;width:300px;height:120px;position:absolute;top:0px;left:530px;background:#fff;}
        .tip .t_title{width:100%;height:30px;background:#131231;color:#fff;line-height:30px;}
        .tip .t_title p{color:#000;width:100%;height:30px;font-size:16px;letter-spacing:4px;margin-top:10px;}
    </style>
</head>
   <div class="box">
       <h1>用户注册</h1>
       <div style="display: none;" class="msg">${error}</div>
       <form method="post" action="../user/AddUser" id="MyForm">
       <p>
           <span>用户名:</span>
           <input type="text" name="userName" id="userName" />
       </p>
       <p>
           <span>密码:</span>
           <input type="password" name="password" id="password" />
       </p>
       <p>
           <span>验证密码:</span>
           <input type="password" name="v_password" id="v_password"/>
       </p>
       <p>
           <span>年龄:</span>
           <input type="text" name="age" id="age" />
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
           <input type="text" name="email" id="email" />
       </p>
       <p>
           <span>电话:</span>
           <input type="text" name="phone" id="phone"/>
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
           <input type="text" name="address" id="address" />
       </p>
       <p>
           <input type="submit" value="注册" class="submit"/>
           <input type="button" value="重置" class="submit clean"/>
       </p>
       </form>
       <div class="tip animated bounceInDown">
           <div class="t_title">温馨提示
               <p id="tishi">你输入的账号已存，请重新输入</p>
           </div>
       </div>
   </div>
<script>
    $(".clean").click(function () {
        window.location.reload();//刷新当前页面.
    });
    var msg=$(".msg").text();
    if(msg=="fail"){
        $(".tip").show();
        setTimeout(function(){
            $(".tip").slideUp();
        },2500);
    }
</script>
</body>
</html>
