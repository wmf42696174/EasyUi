<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
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
</head>
<body>
<div class="easyui-layout" style="width:100%;height:100%">
    <div style="display: none" class="msg">${msg}</div>
    <div data-options="region:'north'" style="height:50px;border-bottom:2px solid #e0ecff">
        <form id="QueryForm" style="margin: 10px;">
            <span style="display: inline-block;height:30px;line-height:30px;text-align: center;margin-left: 30px;" >最低价格:</span>
            <input name="minprice" type="text" style="width:200px;display: inline-block"/>
            <span style="display: inline-block;height:30px;line-height:30px;text-align: center;margin-left: 30px;" >最高价格:</span>
            <input name="maxprice" type="text" style="width:200px;display: inline-block"/>
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width:80px;margin-left: 20px;" onclick="SearchWant()">Search</a>
        </form>
    </div>
    <div data-options="region:'south'" style="height:500px;">
        <table id="WantTable">

        </table>
    </div>
</div>
<div id="MyPopWindow" modal="true" shadow="false" minimizable="false" cache="false" maximizable="false" collapsible="false" resizable="false" style="margin: 0px;padding: 0px; overflow: hidden;"></div>
<script>
    $(document).ready(function () {
        $("#WantTable").datagrid({
            title:"我的需求",
            method:'post',
            singleSelect:false,
            height:500,
            fitColumns:true,
            striped:true,
            url:"../want/querymywantlist",
            idFiled:'want.id',
            sortName:'want.wantnum',
            sortOrder:'desc',
            queryParams:{},
            pagination:true,
            rownumbers:true,
            columns:[[
                {field:'ck',checkbox:true,width:10},
                {field:'want.goodname',title:'商品名',width:100,
                    formatter:function(value,row,index){return row.goodname;}
                },
                {field:'want.wantnum',title:'商品数量',width:60,
                    formatter:function(value,row,index){return row.wantnum;}
                },
                {field:'want.price',title:'接受价格',width:80,
                    formatter:function(value,row,index){return row.price;}
                },
                {field:'want.description',title:'商品说明',width:100,
                    formatter:function(value,row,index){return row.description;}
                },
            ]],
            toolbar:[{
                text:"发布",
                iconCls:'icon-add',
                handler:function () {
                    addWant();
                }
            },'-',{
                text:"取消",
                iconCls:'icon-remove',
                handler:function () {
                    deleteWant();
                }
            },'-',{
                text:"跟新",
                iconCls:'icon-edit',
                handler:function () {
                    updateWant();
                }
            },'-'],
            onLoadSuccess:function () {
                $("#WantTable").datagrid('clearSelections');
            }
        });
    });
    function addWant() {
        showWindow({
            title:"发布需求",
            href:"../want/addwant",
            width:250,
            height:380,
            onLoad:function () {
                $('#wantForm').form('clear');
            }
        })
    }
    function deleteWant() {
        $.messager.confirm("温馨提示","确定要删除吗",function (result) {
            if(result){
                var rows=$('#WantTable').datagrid('getSelections');
                var ps="";
                $.each(rows,function (i,n) {
                    if(i==0){
                        ps+="?id="+n.id;
                    }
                    else{
                        ps+="&id="+n.id;
                    }
                });
                $.post('../want/deletewants'+ps,function (data) {
                    $("#WantTable").datagrid('reload');
                    $.messager.alert("提示",data.mes,'info');
                })
            }
        });
    }
    function updateWant() {
        var rows = $('#WantTable').datagrid('getSelections');
        if(rows.length==0){
            $.messager.alert('提示',"请选择你要更新的需求",'info');
            return;
        }
        if(rows.length > 1){
            $.messager.alert('提示',"只能选择一条进行更新",'info');
            return;
        }
        showWindow({
            title:"跟新需求",
            href:"../want/updateWant",
            width:250,
            height:380,
            onLoad:function () {
                $("#myForm").form('load', rows[0]);
            }
        })
    }
    function SearchWant(){
        console.info("asd");
        var params=$("#WantTable").datagrid('options').queryParams;
        var fields=$("#QueryForm").serializeArray();
        console.info(fields+"===="+params)
        $.each(fields,function (i,field) {
            params[field.name]=field.value;
        });
        $("#WantTable").datagrid('reload');
    }
    var msg=$(".msg").text();
    console.info(msg);
    if(msg=="success"){
        $.messager.show({
            title:'温馨提示',
            msg:'需求修改成功',
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
</script>
</body>
</html>
