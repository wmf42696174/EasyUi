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
        <form id="QueryForm" style="margin: 10px;">
            <span style="display: inline-block;height:30px;line-height:30px;text-align: center;margin-left: 30px;">商品名:</span>
            <input name="name" type="text" style="width:200px;display: inline-block"/>
            <span style="display: inline-block;height:30px;line-height:30px;text-align: center;margin-left: 30px;" >审核结果:</span>
            <select name="flag" style="width:150px;height:23px;display: inline-block">
                <option value="1">通过</option>
                <option value="2">不通过</option>
                <option value="0" selected>全部</option>
            </select>
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width:80px;margin-left: 20px;" onclick="SearchGoods()">Search</a>
        </form>
    </div>
    <div data-options="region:'south'" style="height:500px;">
        <table id="GoodsTable">

        </table>
    </div>
</div>
<div id="MyPopWindow" modal="true" shadow="false" minimizable="false" cache="false" maximizable="false" collapsible="false" resizable="false" style="margin: 0px;padding: 0px; overflow: hidden;"></div>
<script>
    $(document).ready(function () {
        $("#GoodsTable").datagrid({
            title:"我的商品",
            method:'post',
            singleSelect:false,
            height:500,
            fitColumns:true,
            striped:true,
            url:"../goods/querygoodslist",
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
                {field:'goods.num',title:'数量',width:60,
                    formatter:function(value,row,index){return row.num;}
                },
                {field:'goods.price',title:'价格',width:80,
                    formatter:function(value,row,index){return row.price;}
                },
                {field:'goods.flag',title:'审核结果',width:80,
                    formatter:function(value,row,index){
                        if(row.flag==1){
                            return" 通过";
                        }else{
                            return "未通过";
                        }
                    }
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
            ]],
            toolbar:[{
                text:"发布",
                iconCls:'icon-add',
                handler:function () {
                    addRow();
                }
            },'-',{
                text:"下架",
                iconCls:'icon-remove',
                handler:function () {
                    deleteRow();
                }
            },'-',{
                text:"跟新",
                iconCls:'icon-edit',
                handler:function () {
                    updateGoods();
                }
            },'-'],
            onLoadSuccess:function () {
                $("#GoodsTable").datagrid('clearSelections');
            }
        });
    });

    function addRow() {
        showWindow({
            title:"发布商品",
            href:"../goods/goodsPopWindow",
            width:250,
            height:380,
            onLoad:function () {
                $('#goodsForm').form('clear');
            }
        });
    }
    function updateGoods(){
        var rows = $('#GoodsTable').datagrid('getSelections');
        if(rows.length==0){
            $.messager.alert('提示',"请选择你要更新的商品",'info');
            return;
        }
        if(rows.length > 1){
            $.messager.alert('提示',"只能选择一个商品进行更新",'info');
            return;
        }
        showWindow({
            title:"跟新商品",
            href:"../goods/UpdateGoodsWindow",
            width:260,
            height:400,
            onLoad:function () {
                $("#GoodsForm").form('load', rows[0]);
            }
        })
    }
    function deleteRow() {
        $.messager.confirm("温馨提示","确定要删除吗",function (result) {
            if(result){
                var rows=$('#GoodsTable').datagrid('getSelections');
                var ps="";
                $.each(rows,function (i,n) {
                    if(i==0){
                        ps+="?id="+n.id;
                    }
                    else{
                        ps+="&id="+n.id;
                    }
                });
                $.post('../goods/deletegoods'+ps,function (data) {
                    $("#GoodsTable").datagrid('reload');
                    $.messager.alert("提示",data.mes,'info');
                })
            }
        });
    }
    function SearchGoods(){
        console.info("asd");
        var params=$("#GoodsTable").datagrid('options').queryParams;
        var fields=$("#QueryForm").serializeArray();
        console.info(fields+"===="+params)
        $.each(fields,function (i,field) {
            params[field.name]=field.value;
        });
        $("#GoodsTable").datagrid('reload');
    }
    var msg=$(".msg").text();
    console.info(msg);
    if(msg=="success"){
        $.messager.show({
            title:'温馨提示',
            msg:'商品发布成功',
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
