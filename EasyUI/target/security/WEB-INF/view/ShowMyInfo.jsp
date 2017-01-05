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
    <div data-options="region:'center',fit:true" style="height:500px;">
        <table id="UserTable">

        </table>
    </div>
</div>
<div id="MyPopWindow" modal="true" shadow="false" minimizable="false" cache="false" maximizable="false" collapsible="false" resizable="false" style="margin: 0px;padding: 0px; overflow: hidden;"></div>
<script>
    $(document).ready(function () {
        $("#UserTable").datagrid({
            title:"个人管理",
            method:'post',
            singleSelect:false,
            height:500,
            fitColumns:true,
            striped:true,
            url:"../user/QueryMyInfo",
            idFiled:'user.id',
            sortName:'user.age',
            sortOrder:'desc',
            queryParams:{},
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
    var msg=$(".msg").text();
    console.info(msg);
    if(msg=="success"){
        $.messager.show({
            title:'温馨提示',
            msg:'用户修改成功',
            timeout:3000,
            style:{
                right:'',
                left:40,
                top:document.body.scrollTop+document.documentElement.scrollTop,
                bottom:''
            },
            showType:'slide'
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
</script>
</body>
</html>
