<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        .box{width:80%;float:right;height:550px;border: 1px solid #fff;margin-right: 15px;}
        .box .b_title{width:100%;height:30px;border:2px solid #f318f7;border-top:none;background: #333762;}
        .box .b_title span{font-size:14px;display: inline-block; height:30px;text-align: center;color:#fff;line-height: 30px;}
        .box .b_title span.s1{width:100px;margin-left: 20px;}
        .box .b_title span.s2{width:60px;margin-left: 20px;}
        .box .b_title span.s3{width:50px;margin-left: 20px;}
        .box .b_title span.s4{width: 150px;margin-left: 40px;}
        .box .b_title span.s6{width:100px;margin-left: 20px;}
        .box .b_title span.s5{width:250px;margin-left: 20px;}
        .box .b_content{width:100%;height: 490px;}
        .box .b_content p{display: block;width:100%;height:30px;border-bottom: 1px solid #fff;}
        .box .b_content span{font-size:14px;display: inline-block; height:30px;text-align: center;color:#fff;line-height: 30px;}
        .box .b_content span a{text-decoration: none;color:#fff;margin-left: 20px;}
        .box .b_content span.c1{width:100px;margin-left: 20px;}
        .box .b_content span.c2{width:60px;margin-left: 20px;}
        .box .b_content span.c3{width:50px;margin-left: 20px;}
        .box .b_content span.c4{width: 150px;margin-left: 20px;}
        .box .b_content span.c5{width:250px;margin-left: 20px;}
        .box .b_content span.c6{width: 150px;margin-left: 40px;}
        .box .fenye{width:100%;height:30px;}
        .box .fenye p{display: block;width:100%;height:100%;background:#7a43c3;}
        .box .fenye p span{margin-left:20px;display:inline-block;width:60px;height:30px;text-align: center;line-height: 30px;color:#fff;font-size: 14px;}
    </style>
</head>
<body>
<div class="box">
    <div class="b_title">
        <span class="s1">商品名</span>
        <span class="s2">数量</span>
        <span class="s3">价格</span>
        <span class="s4">卖家</span>
        <span class="s5">交易时间</span>
    </div>
    <div class="b_content">
        <c:forEach items="${RecordList}" var="Record">
            <p>
                <span class="c1">${Record.gname}</span>
                <span class="c2">${Record.gnum}</span>
                <span class="c3">${Record.gprice}</span>
                <span class="c6">${Record.salename}</span>
                <span class="c5">${Record.time.toLocaleString()}</span>
            </p>
        </c:forEach>
    </div>
    <div class="fenye">
        <form name="MyForm" method="post">
            <input type="hidden" id="_time" name="time"/>
            <p style="color:#fff;">
                <span>共     <i id="count">${count}</i>       页</span>
                <input type="button" value="上一页" onclick="prea()" style="display:inline-block;width:80px;height:20px;text-align:center;line-height:20px;background:#333762;border-radius:3px;border: none;cursor:pointer;color:#fff;"/>
                第<input type="text" id="pagenum" name="pagenum" value="${currentpagenum}" style="width:40px;background:#fff;border-radius:3px;text-align:center;border:none;"/>页
                <input type="button" value="下一页" onclick="next()" style="display:inline-block;width:80px;height:20px;text-align:center;line-height:20px;background:#333762;border-radius:3px;border: none;cursor:pointer;color:#fff;"/>
            </p>
        </form>
    </div>
</div>
<script>
    function next(){
        var pagenum=$("#pagenum").val();
        var count=$("#count").html();
        $("#_time").val($("#time").val());
        if(pagenum<count){
            var p=Number(pagenum)+1;
            $("#pagenum").val(p);
        }
        document.MyForm.action="<%=basePath%>/record/showmyrecord";
        document.MyForm.submit();
    }

    function prea(){
        var pagenum=$("#pagenum").val();
        var count=$("#count").html();
        $("#_time").val($("#time").val());
        if(pagenum>1){
            var p=Number(pagenum)-1;
            $("#pagenum").val(p);
        }
        document.MyForm.action="<%=basePath%>/record/showmyrecord";
        document.MyForm.submit();
    }
</script>
</body>
</html>
