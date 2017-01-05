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
<div data-options="region:'north'" style="height:50px;border-bottom:2px solid #e0ecff">
    <form id="QueryForm" style="margin: 10px;">
        <span style="display: inline-block;height:30px;line-height:30px;text-align: center;margin-left: 30px;">需求人:</span>
        <input name="buyername" class="easyui-combobox"
               data-options="
					url:'../want/queryname',
					method:'get',
					valueField:'id',
					textField:'text',
					panelHeight:'auto'
			"/>
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
            title:"需求列表",
            method:'post',
            singleSelect:false,
            height:500,
            fitColumns:true,
            striped:true,
            url:"../want/querywantlist",
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
                {field:'want.buyername',title:'需方',width:100,
                    formatter:function(value,row,index){return row.buyername;}
                },
                {field:'want.description',title:'商品说明',width:100,
                    formatter:function(value,row,index){return row.description;}
                },

            ]],
            onLoadSuccess:function () {
                $("#WantTable").datagrid('clearSelections');
            }
        });
    });
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
</script>
</body>
</html>
