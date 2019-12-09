<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <link href="/static/layui/css/layui.css" type="text/css" rel="stylesheet" media="all"/>
    <script src="/static/jq/jquery-3.4.1.js"></script>
    <style type="text/css">
        img{
            width: 100%;
            height: 100%;
        }
        /* div{
            border:1px solid red;
        } */
    </style>
</head>
<body background="http://localhost:88/zhuche2.jpg">
<div class="layui-col-md6 layui-col-md-offset3" style="height: 430px;background-color: rgba(173 ,216 ,230,0.5);margin-top: 60px;">
    <div class="layui-col-md6 layui-col-md-offset3" >
        <form class="layui-form" action="/registered/customer" method="post">
            <h1 align="center">用户注册</h1>
            <div class="layui-col-md12" style="margin-top: 30px">
                <div class="layui-form-item">
                    <label class="layui-form-label"><i class="layui-icon layui-icon-cellphone" style="font-size: 30px; color: #1E9FFF;"></i> </label>
                    <div class="layui-input-block">
                        <input type="text" id="phoneNumber" name="cPhone" required  lay-verify="required" placeholder="请输入手机号码" autocomplete="off" class="layui-input" style="width: 200px;">
                    </div>
                </div>
            </div>

            <div class="layui-col-md12">
                <div class="layui-form-item">
                    <label class="layui-form-label">
                        <input type="button" class="layui-btn layui-btn-sm layui-btn-normal" id="get_code" value="获取验证码"/>
                    </label>
                    <div class="layui-input-block">
                        <input type="text" name="phoneCode" required  lay-verify="required" placeholder="请输入验证码" autocomplete="off" class="layui-input" style="width: 200px;">
                    </div>
                </div>
            </div>

            <div class="layui-col-md12">
                <div class="layui-form-item">
                    <label class="layui-form-label"><i class="layui-icon layui-icon-password" style="font-size: 30px; color: #1E9FFF;"></i> </label>
                    <div class="layui-input-block">
                        <input type="password" id="cPassword1" name="cPassword" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input" style="width: 200px;">
                    </div>
                </div>
            </div>

            <div class="layui-col-md12">
                <div class="layui-form-item">
                    <label class="layui-form-label"><i class="layui-icon layui-icon-password" style="font-size: 30px; color: #1E9FFF;"></i> </label>
                    <div class="layui-input-block">
                        <input type="password" id="cPassword2" name="cPassword2" required  lay-verify="required" placeholder="请再次输入密码" autocomplete="off" class="layui-input" style="width: 200px;">
                        <span style="color: red">${err}</span>
                    </div>
                </div>
            </div>

            <div class="layui-col-md12">
                <div class="layui-form-item" style="margin-left: 95px;">
                    <label class="layui-form-label">
                        <button type="submit" id="btn_zhuche" class="layui-btn layui-btn-sm layui-btn-normal" style="width: 200px;">注&nbsp;&nbsp;册</button>
                    </label>
                </div>
            </div>

        </form>
    </div>

</div>
</body>
<script src="/static/layui/layui.js"></script>
<script>

    //获取验证码
    //倒计时
    var wait=60;
    function time(o) {
        if (wait == 0) {
            o.removeAttribute("disabled");
            o.value="获取验证码";
            wait = 60;
        } else {

            o.setAttribute("disabled", true);
            o.value="重新发送(" + wait + ")";
            wait--;
            setTimeout(function() {
                    time(o)
                },
                1000)
        }
    }
    //发送短信
    function sendSms(){
        var phone = $("#phoneNumber").val();
        $.ajax({
            method:'get',
            url:"/customer/getcode?phone="+phone,
            dataType:'JSON'
        }).done(function (response) {
            alert(response.getData());
        })
    }
    //获取验证码
    $("#get_code").on('click',function(){
        time(this);
        sendSms();
    })



</script>

</html>
