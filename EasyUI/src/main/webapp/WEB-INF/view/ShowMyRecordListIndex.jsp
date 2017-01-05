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
    <div style="display: none" class="msg">${error}</div>
    <div style="display: none" class="msg2">${msg}</div>
    <div data-options="region:'north'" style="height:50px;border-bottom:2px solid #e0ecff">
        <form id="QueryRecordForm" style="margin: 10px;">
            <span style="display: inline-block;height:30px;line-height:30px;text-align: center;margin-left: 30px;">开始时间:</span>
            <input name="begintime" class="easyui-datetimebox" style="width:200px;display: inline-block"/>
            <span style="display: inline-block;height:30px;line-height:30px;text-align: center;margin-left: 30px;" >截止时间:</span>
            <input name="endtime" class="easyui-datetimebox" style="width:200px;display: inline-block"/>
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width:80px;margin-left: 20px;" onclick="SearchRecord()">Search</a>
        </form>
    </div>
    <div data-options="region:'south'" style="height:500px;">
        <table id="RecordTable">

        </table>
    </div>
</div>
<div id="MyPopWindow" modal="true" shadow="false" minimizable="false" cache="false" maximizable="false" collapsible="false" resizable="false" style="margin: 0px;padding: 0px; overflow: hidden;"></div>
<script>
    $(document).ready(function () {
        $("#RecordTable").datagrid({
            title:"购买记录",
            method:'post',
            singleSelect:false,
            height:500,
            fitColumns:true,
            striped:true,
            url:"../record/querymyrecordlist",
            idFiled:'record.id',
            sortName:'record.gnum',
            sortOrder:'desc',
            queryParams:{},
            pagination:true,
            rownumbers:true,
            columns:[[
                {field:'ck',checkbox:true,width:10},
                {field:'record.gname',title:'商品名',width:100,
                    formatter:function(value,row,index){return row.gname;}
                },
                {field:'user.gnum',title:'数量',width:60,
                    formatter:function(value,row,index){return row.gnum;}
                },
                {field:'record.gprice',title:'价格',width:80,
                    formatter:function(value,row,index){return row.gprice;}
                },
                {field:'record.salename',title:'卖家',width:100,
                    formatter:function(value,row,index){return row.salename;}
                },
                {field:'record.times',title:'交易时间',width:100,
                    formatter:function(value,row,index){
                        console.info(row.times);
                        return formattime(row.times);
                    }
                },

            ]],
            onLoadSuccess:function () {
                $("#RecordTable").datagrid('clearSelections');
            }
        });
    });
    function formattime(val){
        var year=parseInt(val.year)+1900;
        var month=(parseInt(val.month)+1);
        month=month>9?month:('0'+month);
        var date=parseInt(val.date);
        date=date>9?date:('0'+date);
        var hours=parseInt(val.hours);
        hours=hours>9?hours:('0'+hours);
        var minutes=parseInt(val.minutes);
        minutes=minutes>9?minutes:('0'+minutes);
        var seconds=parseInt(val.seconds);
        seconds=seconds>9?seconds:('0'+seconds);
        var time=year+'-'+month+'-'+date+' '+hours+':'+minutes+':'+seconds;
        return time;
    }

    function SearchRecord(){
        console.info("asd");
        var params=$("#RecordTable").datagrid('options').queryParams;
        var fields=$("#QueryRecordForm").serializeArray();
        console.info(fields+"===="+params)
        $.each(fields,function (i,field) {
            params[field.name]=field.value;
        });
        $("#RecordTable").datagrid('reload');
    }
    var msg=$(".msg").text();
    console.info(msg);
    if(msg=="success"){
        $.messager.show({
            title:'温馨提示',
            msg:'用户添加成功',
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
            msg:'用户修改成功',
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
    if(msg=="fail"){
        $.messager.show({
            title:'温馨提示',
            msg:'用户名存在,添加失败',
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
