<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page isELIgnored="false" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>LowDog</title><link rel="stylesheet" type="text/css" href="/static/css/animate.css">
    <style type="text/css">
        *{margin:0px;padding:0px;color:#FFF;}
        .navi{
            height:68px;
            width:1145px;
            margin:0px 100px;
            border-bottom:white 2px solid;
        }
        .navi .logo{
            height:60px;
            width:45px;
            margin:0px 15px;
            margin-top:2px;
            background-image:url(/static/img/logo.png);
            background-size:45px 60px;
            float:left;
        }
        .navi .name{
            height:60px;
            width:100px;
            margin:5px 0px;
            float:left;
        }
        .navi .name .cnname{
            height:30px;
            width:auto;
            margin:0px;
            font-size:30px;
        }
        .navi .name .enname{
            height:30px;
            width:auto;
            margin:0px;
            font-size:24px;
        }
        .navi .login{
            height:50px;
            width:auto;
            margin-top:20px;
            margin-right:35px;
            text-decoration:none;
            display:block;
            float:right;
        }
        .navi .allavatar{
            height:40px;
            width:40px;
            margin-right:5px;
            margin-top:3px;
            background-image:url(/static/img/allavatar.png);
            float:left;
        }
        .navi .link{
            height:50px;
            width:auto;
            font-size:24px;
            line-height:50px;
            text-decoration:none;
            float:left;
        }
        .navi .link:hover{
            text-decoration:underline;
        }
        .content{
            height:500px;
            width:1145px;
            margin:20px 100px;
            margin-bottom:15px;
        }
        .content .lcontent{
            height:500px;
            width:490px;
            margin:0px 0px;
            float:left;
        }
        .content .lcontent .info{
            height:246px;
            width:500px;
            border:white 2px solid;
        }
        .content .lcontent .info .title{
            height:46px;
            width:490px;
            margin:0px;
        }
        .content .lcontent .info .title .txt{
            margin:2px 0px;
            font-size:36px;
            float:left;
        }
        .content .lcontent .info .title .change{
            height:20px;
            width:75px;
            margin:0px;
            margin-top:20px;
            float:right;
        }
        .content .lcontent .info .title .change .ctxt{
            margin:0px;
            font-size:18px;
            float:right;
            cursor: pointer;
        }
        .content .lcontent .info .title .change .refresh{
            height:20px;
            width:20px;
            margin:0px;
            float:right;
            background-image:url(/static/img/Refresh.png);
        }
        .content .lcontent .info .title .change:hover .ctxt{
            color:#999;
            text-decoration:underline;
            transition:0.2s;
        }
        .content .lcontent .info .title .change:hover .refresh{
            background-image:url(/static/img/Refresh_h.png);
            transition:0.2s;
        }
        .content .lcontent .keys{
            height:34px;
            width:490px;
            font-size:20px;
        }
        .buyer{
            float:left;
            width:160px;
            margin-left:15px;
        }
        .detail{
            float:left;
            width:220px;
        }
        .neednum{
            float:right;
            width:40px;
            margin-right: 10px;
            text-align:center;
        }
        .seller{
            float:left;
            width:160px;
            margin-left:15px;
        }
        .price{
            float:left;
            width:220px;
            text-align:center;
        }
        .applynum{
            float:right;
            width:40px;
            text-align:center;
            margin-right: 15px;
        }
        .content .lcontent .info .inner{
            height:170px;
            width:490px;
            margin:0px;
            padding:0px;
            list-style:none;
        }
        .content .lcontent .info .inner li{
            height:34px;
            width:490px;
        }
        .content .lcontent .need .inner li{
        }
        .content .rcontent{
            height:500px;
            width:610px;
            margin:0px 20px;
            float:right;
        }
        .content .rcontent .title{
            height:170px;
            width:48px;
            border-left:white 2px solid;
            margin-top:2px;
            font-size:36px;
            float:left;
            display:block;
        }
        .content .rcontent .inner{
            height:500px;
            width:560px;
            margin:0px;
            float:left;
            overflow:hidden;
        }
        .content .rcontent .inner .imgs{
            height:500px;
            width:2800px;
            margin:0px;
            padding:0px;
            position:relative;
            left:0px;
        }
        .content .rcontent .inner .imgs li{
            height:500px;
            width:560px;
            float:left;
            list-style:none;
        }
        .content .rcontent .btn{
            height:100px;
            width:560px;
            position:relative;
            top:200px;
            left:25px;
            list-style:none;
        }
        .content .rcontent .btn .lbtn{
            height:100px;
            width:100px;
            position:absolute;
            left:-35px;
            float:left;
            display:none;
            background-image:url(/static/img/LeftBtn.png);
        }
        .content .rcontent .btn .rbtn{
            height:100px;
            width:100px;
            position:absolute;
            right:-85px;
            float:right;
            background-image:url(/static/img/RightBtn.png);
        }
        .footer{
            height:63px;
            width:1045px;
            border-top:white 2px solid;
            margin:0px 150px;
            list-style:none;
        }
        .footer li{
            height:65px;
            width:209px;
            float:left;
        }
        .footer li:nth-child(3){
            margin:13px 0px;
            text-align:center;
        }
        .footer li .img{
            height:56px;
            width:56px;
            margin:0px;
            margin-top:8px;
            margin-left:16px;
            float:left;
        }
        .footer li .txt{
            height:56px;
            width:105px;
            margin:0px;
            margin-top:8px;
            margin-right:16px;
            float:right;
        }
        .footer li .txt .big{
            height:28px;
            width:105px;
            font-size:20px;
            line-height:40px;
            display:block;
        }
        .footer li .txt .small{
            height:28px;
            width:105px;
            font-size:12px;
            line-height:18px;
            color:#999;
            display:block;
        }
    </style>
</head>

<body style="background-color:#1B3050">
<div class="navi">
    <div class="logo">
    </div>
    <div class="name">
        <p class="cnname">Fleaer</p>
        <p class="enname">Low Dog</p>
    </div>
    <div class="login" style="display: none;">
        <div class="allavatar"></div>
        <a href="/sys/user/login" class="link">登录</a>
    </div>
</div>
<div class="content">
    <div class="lcontent">
        <div class="info need">
            <div class="title">
                <p class="txt">我想买</p>
                <div class="change">
                    <div class="refresh"></div>
                    <p class="ctxt" id="changebuy">换一批</p>
                </div>
            </div>
            <div class="keys">
                <p class="buyer">商品名</p>
                <p class="detail">商品描述</p>
                <p class="neednum">数量</p>
            </div>
            <ul class="inner">
                <c:forEach items="${showWantList}" var="Want">
                    <li>
                        <p class="buyer">${Want.goodname}</p>
                        <p class="detail">${Want.description}</p>
                        <p class="neednum">${Want.wantnum}</p>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="info apply">
            <div class="title">
                <p class="txt">我想卖</p>
                <div class="change">
                    <div class="refresh"></div>
                    <p class="ctxt">换一批</p>
                </div>
            </div>
            <div class="keys">
                <p class="seller">商品</p>
                <p class="price">商品描述</p>
                <p class="applynum">价格</p>
            </div>
            <ul class="inner">
                <c:forEach items="${showGoodsList}" var="Goods">
                    <li>
                        <p class="seller">${Goods.name}</p>
                        <p class="price">${Goods.mark}</p>
                        <p class="applynum">${Goods.price}</p>
                    </li>
                </c:forEach>

            </ul>
        </div>
    </div>
    <div class="rcontent">
        <p class="title">商品推荐</p>
        <div class="inner">
            <ul class="imgs" id="imgs">
                <li class="img1" style="background:url(/static/img/001.jpg)"></li>
                <li class="img2" style="background:url(/static/img/002.jpg)"></li>
                <li class="img3" style="background:url(/static/img/003.jpg)"></li>
                <li class="img4" style="background:url(/static/img/004.jpg)"></li>
                <li class="img5" style="background:url(/static/img/005.jpg)"></li>
            </ul>
        </div>
        <ul class="btn">
            <li class="lbtn"></li>
            <li class="rbtn"></li>
        </ul>
    </div>
</div>
<ul class="footer">
    <li>
        <div class="img" style="background-image:url(/static/img/f1.png);background-size:56px"></div>
        <p class="txt">
            <span class="big">品质保障</span>
            <span class="small">严格审核 放心选购</span>
        </p>
    </li>
    <li>
        <div class="img" style="background-image:url(/static/img/f2.png);background-size:56px"></div>
        <p class="txt">
            <span class="big">全场包邮</span>
            <span class="small">多家快递 保驾护航</span>
        </p>
    </li>
    <li>Copyright© 低购网交易平台 2016-∞，All Rights Reserved</li>
    <li>
        <div class="img" style="background-image:url(/static/img/f3.png);background-size:56px"></div>
        <p class="txt">
            <span class="big">售后无忧</span>
            <span class="small">7天无理由退货</span>
        </p>
    </li>
    <li>
        <div class="img" style="background-image:url(/static/img/f4.png);background-size:56px"></div>
        <p class="txt">
            <span class="big">准时送达</span>
            <span class="small">收货时间由你做主</span>
        </p>
    </li>
</ul>
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script>
    var imgIndex=1;
    $(".content .rcontent .btn .lbtn").click(function(){
        if(imgIndex<6&&imgIndex>1){
            imgIndex=imgIndex-1;
            $(".content .rcontent .inner .imgs").animate({left:-560*(imgIndex-1)},500);
            if(imgIndex==4){
                $(".content .rcontent .btn .rbtn").show();
            }
            if(imgIndex==1){
                $(this).hide();
            }
        }
    });
    $(".content .rcontent .btn .rbtn").click(function(){
        if(imgIndex<5&&imgIndex>0){
            $(".content .rcontent .inner .imgs").animate({left:-560*imgIndex},500);
            if(imgIndex==4){
                $(this).hide();
            }
            if(imgIndex==1){
                $(".content .rcontent .btn .lbtn").show();
            }
            imgIndex=imgIndex+1;
        }
    });
    $(".ctxt").click(function(){
        window.location.reload();
    })
</script>
</body>
</html>
