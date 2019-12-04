<%--
  Created by IntelliJ IDEA.
  User: 李威
  Date: 2019/12/2
  Time: 20:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加用户</title>
    <script src="/static/jq/jquery-3.4.1.js"></script>
    <link href="/static/layui/css/layui.css" rel="stylesheet" type="text/css" media="all"/>
    <script src="/static/layui.js"></script>
    <style>
        #div1{
            margin-top: 150px;
            margin-left: 400px;
        }
    </style>
</head>
<body>

    <div id="div1">
        <h1>用户注册</h1>
        <form class="layui-form" action="/customer/add" method="post">
            <div class="layui-form-item">
                <label class="layui-form-label">
                    <i class="layui-icon layui-icon-password" style="font-size: 30px; color: #1E9FFF;"></i>
                </label>
                <div class="layui-input-inline">
                    <input type="password" name="cPassword" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">密码等级：<span id="pwdgander"></span></div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">
                    <i class="layui-icon layui-icon-form" style="font-size: 30px; color: #1E9FFF;"></i>
                </label>
                <div class="layui-input-block" style="width: 300px">
                    <input type="text" name="cCard" required  lay-verify="required" placeholder="请输入身份证号码" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">
                    <i class="layui-icon layui-icon-edit" style="font-size: 30px; color: #1E9FFF;"></i>
                </label>
                <div class="layui-input-block" style="width: 300px">
                    <input type="text" name="cDriving" required  lay-verify="required" placeholder="请输入驾驶证号码" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">
                    <i class="layui-icon layui-icon-cellphone" style="font-size: 30px; color: #1E9FFF;"></i>
                </label>
                <div class="layui-input-block" style="width: 300px">
                    <input type="text" name="cPhone" required  lay-verify="required" placeholder="请输入手机号码" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">
                    <i class="layui-icon layui-icon-username" style="font-size: 30px; color: #1E9FFF;"></i>
                </label>
                <div class="layui-input-block" style="width: 300px">
                    <input type="text" name="cName" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">
                    <i class="layui-icon layui-icon-male" style="font-size: 30px; color: #1E9FFF;"></i>
                </label>
                <div class="layui-input-block">
                    <input type="radio" name="cSex" value="男">
                    <input type="radio" name="cSex" value="女" checked>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">添加</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>



<script>
    //Demo
    layui.use('form', function(){
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });
</script>
</body>
</html>
