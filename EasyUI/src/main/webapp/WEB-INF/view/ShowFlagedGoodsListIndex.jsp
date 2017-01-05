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
    <link rel="stylesheet" type="text/css" href="/static/easyui.css">
    <link rel="stylesheet" type="text/css" href="/static/icon.css">
    <script type="text/javascript" src="/static/js/jquery.js"></script>
    <script type="text/javascript" src="/static/jquery.easyui.min.js"></script>
    <script>
        //弹出窗口
        function showWindow(options){
            jQuery("#MyPopWindow").window(options);
        }
        //关闭弹出窗口
        function closeWindow(){
            $("#MyPopWindow").window('close');
        }
    </script>
    <style type="text/css">
    </style>
</head>
<body>
<div class="easyui-layout" style="width:100%;height:100%">
    <div style="display: none" class="msg">${msg}</div>
    <div style="display: none" class="msg2">${error}</div>
    <div data-options="region:'north'" style="height:50px;border-bottom:2px solid #e0ecff">
        <form id="QueryFlagedForm" style="margin: 10px;">
            <span style="display: inline-block;height:30px;line-height:30px;text-align: center;margin-left: 30px;">商品名:</span>
            <input name="name" type="text" style="width:200px;display: inline-block"/>
            <span style="display: inline-block;height:30px;line-height:30px;text-align: center;margin-left: 30px;" >类型:</span>
            <select name="type" style="width:150px;height:23px;display: inline-block">
                <option value="1">学习用品</option>
                <option value="2">生活用品</option>
                <option value="3">电子设备</option>
                <option value="4">其他</option>
                <option value="0" selected>全部</option>
            </select>
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width:80px;margin-left: 20px;" onclick="SearchFlagedGoods()">Search</a>
        </form>
    </div>
    <div data-options="region:'south'" style="height:500px;">
        <table id="FlagedGoodsTable">

        </table>
    </div>
</div>
<div id="MyPopWindow" modal="true" shadow="false" minimizable="false" cache="false" maximizable="false" collapsible="false" resizable="false" style="margin: 0px;padding: 0px; overflow: hidden;"></div>
<script>
    $(document).ready(function () {
        $("#FlagedGoodsTable").datagrid({
            title:"我的商品",
            method:'post',
            singleSelect:false,
            height:500,
            fitColumns:true,
            striped:true,
            url:"../goods/queryflagedgoodslist",
            idFiled:'goods.id',
            sortName:'goods.num',
            sortOrder:'desc',
            queryParams:{},
            pagination:true,
            rownumbers:true,
            columns:[[
                {field:'ck',checkbox:true,width:10},
                {field:'goods.name',title:'商品名',width:100,
                    formatter:function(value,row,index){return row.name;}
                },
                {field:'goods.num',title:'库存',width:60,
                    formatter:function(value,row,index){return row.num;}
                },
                {field:'goods.price',title:'价格',width:80,
                    formatter:function(value,row,index){return row.price;}
                },
                {field:'goods.type',title:'类型',width:100,
                    formatter:function(value,row,index){
                        if(row.type==1){
                            return "学习用品";
                        }else if(row.type==2){
                            return "生活用品";
                        }
                        else if(row.type==3){
                            return "电子设备";
                        }
                        else if(row.type==4){
                            return "其他";
                        }
                    }
                },
                {
                    field:'opt',title:'操作',width:100,align:'center',
                    formatter:function (value,row,index) {
                            var btn = '<a class="editcls"  onclick="Buy('+index+')" href="javascript:void(0)">购买</a>';
                            return btn;
                    }
                },
            ]],
            onLoadSuccess:function () {
                $("#FlagedGoodsTable").datagrid('clearSelections');
            }
        });
    });

    function Buy(index) {
        $("#FlagedGoodsTable").datagrid('selectRow',index);
        console.info(index);
        var rows = $("#FlagedGoodsTable").datagrid("getSelections");
        showWindow({
            title:"商品购买",
            href:"../goods/BuyGoods",
            width:250,
            height:380,
            onLoad:function () {
                $("#BuyForm").form('load',rows[0]);
            }
        })
    }
    function SearchFlagedGoods(){
        console.info("asd");
        var params=$("#FlagedGoodsTable").datagrid('options').queryParams;
        var fields=$("#QueryFlagedForm").serializeArray();
        console.info(fields+"===="+params)
        $.each(fields,function (i,field) {
            params[field.name]=field.value;
        });
        $("#FlagedGoodsTable").datagrid('reload');
    }
    var msg=$(".msg").text();
    console.info(msg);
    if(msg=="success"){
        $.messager.show({
            title:'温馨提示',
            msg:'商品购买成功',
            timeout:1000,
            style:{
                right:'',
                left:40,
                top:document.body.scrollTop+document.documentElement.scrollTop,
                bottom:''
            },
            showType:'slide'
        });
    }
    if(msg=="fail"){
        $.messager.show({
            title:'温馨提示',
            msg:'商品库存不足,购买失败',
            timeout:1000,
            style:{
                right:'',
                left:40,
                top:document.body.scrollTop+document.documentElement.scrollTop,
                bottom:''
            },
            showType:'slide'
        });
    }
    var msg2=$(".msg2").text();
    console.info(msg2);
    if(msg2=="success"){
        $.messager.show({
            title:'温馨提示',
            msg:'商品修改成功',
            timeout:1500,
            style:{
                right:'',
                left:40,
                top:document.body.scrollTop+document.documentElement.scrollTop,
                bottom:''
            },
            showType:'slide'
        });
    }
</script>
</body>
</html>
