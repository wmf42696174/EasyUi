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
           <form id="QueryForm" style="margin: 10px;">
               <span style="display: inline-block;height:30px;line-height:30px;text-align: center;margin-left: 30px;">用户名:</span>
               <input name="userName" type="text" style="width:200px;display: inline-block"/>
                <span style="display: inline-block;height:30px;line-height:30px;text-align: center;margin-left: 30px;" >性别:</span>
               <select name="sex" style="width:150px;height:23px;display: inline-block">
                   <option value="1">男</option>
                   <option value="2">女</option>
                   <option value="0" selected>全部</option>
               </select>
               <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width:80px;margin-left: 20px;" onclick="SearchUser()">Search</a>
           </form>
        </div>
         <div data-options="region:'south'" style="height:500px;">
             <table id="UserTable">

             </table>
         </div>
 </div>
<div id="MyPopWindow" modal="true" shadow="false" minimizable="false" cache="false" maximizable="false" collapsible="false" resizable="false" style="margin: 0px;padding: 0px; overflow: hidden;"></div>
<script>
    $(document).ready(function () {
        $("#UserTable").datagrid({
            title:"用户列表",
            method:'post',
            singleSelect:false,
            height:500,
            fitColumns:true,
            striped:true,
            url:"../user/querylist",
            idFiled:'user.id',
            sortName:'user.age',
            sortOrder:'desc',
            queryParams:{},
            pagination:true,
            rownumbers:true,
            columns:[[
                {field:'ck',checkbox:true,width:10},
                {field:'user.userName',title:'用户名',width:100,
                    formatter:function(value,row,index){return row.userName;}
                },
                {field:'user.age',title:'年龄',width:60,
                    formatter:function(value,row,index){return row.age;}
                },
                {field:'user.type',title:'类型',width:80,
                    formatter:function(value,row,index){return row.type;}
                },
                {field:'user.sex',title:'类型',width:80,
                    formatter:function(value,row,index){

                       if(row.sex==1){
                           return"男";
                       }else{
                           return "女";
                       }
                    }
                },
                {field:'user.phone',title:'电话',width:100,
                    formatter:function(value,row,index){return row.phone;}
                },
                {field:'user.email',title:'邮箱',width:100,
                    formatter:function(value,row,index){return row.email;}
                },
                {field:'user.address',title:'地址',width:100,
                    formatter:function(value,row,index){return row.address;}
                },

            ]],
            toolbar:[{
                text:"增加",
                iconCls:'icon-add',
                handler:function () {
                      addRow();
                }
            },'-',{
                text:"删除",
                iconCls:'icon-remove',
                handler:function () {
                        deleteUser();
                }
            },'-',{
                text:"跟新",
                iconCls:'icon-edit',
                handler:function () {
                      updateUser();
                }
            },'-'],
            onLoadSuccess:function () {
                $("#UserTable").datagrid('clearSelections');
            }
        });
    });

    function addRow() {
        showWindow({
            title:"增加用户",
            href:"../user/popwindow",
            width:300,
            height:500,
            onLoad:function () {
                $('#userForm').form('clear');
            }
        });
    }
    function deleteUser(){
        $.messager.confirm("温馨提示","确定要删除吗",function (result) {
            if(result){
                var rows=$('#UserTable').datagrid('getSelections');
                var ps="";
                $.each(rows,function (i,n) {
                    if(i==0){
                        ps+="?id="+n.id;
                    }
                    else{
                        ps+="&id="+n.id;
                    }
                });
                $.post('../user/deleteuser'+ps,function (data) {
                    $("#UserTable").datagrid('reload');
                    $.messager.alert("提示",data.mes,'info');
                })
            }
        });
    }
    function updateUser(){
        var rows = $('#UserTable').datagrid('getSelections');
        if(rows.length==0){
            $.messager.alert('提示',"请选择你要更新的用户",'info');
            return;
        }
        if(rows.length > 1){
            $.messager.alert('提示',"只能选择一位用户进行更新",'info');
            return;
        }
        showWindow({
            title:"跟新用户",
            href:"../user/MyInfoWIndow",
            width:300,
            height:500,
            onLoad:function () {
                $("#myForm").form('load', rows[0]);
            }
        })
    }
    function SearchUser(){
        console.info("asd");
        var params=$("#UserTable").datagrid('options').queryParams;
        var fields=$("#QueryForm").serializeArray();
        console.info(fields+"===="+params)
        $.each(fields,function (i,field) {
            params[field.name]=field.value;
        });
        $("#UserTable").datagrid('reload');
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
