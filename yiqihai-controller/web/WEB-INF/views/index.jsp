<%--
  Created by IntelliJ IDEA.
  User: 李威
  Date: 2019/12/2
  Time: 20:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="static/layui/css/layui.css"  media="all">
    <script src="static/jq/jquery-3.4.1.js"></script>
    <style>
        /*div{ border: 1px solid red;}*/

        img{
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>

<%--登录模块--%>
<div id="login" style="width: 400px;height: 330px;position: fixed;margin-top: 200px;margin-left: 500px;z-index: 30;background: #FCF8E3;">

    <form class="layui-form" id="login_form1">
        <h2 align="right"><i class="layui-icon layui-icon-close" style="font-size: 30px; color: #1E9FFF;" id="close_login"></i> &nbsp;</h2>
        <h2 align="center">手机号码登录</h2>
        <div class="layui-col-md12" style="margin-top: 30px">
            <div class="layui-form-item">
                <label class="layui-form-label"><i class="layui-icon layui-icon-cellphone" style="font-size: 30px; color: #1E9FFF;"></i> </label>
                <div class="layui-input-block">
                    <input type="text" id="phoneNumber" name="phoneNumber" required  lay-verify="required" placeholder="请输入手机号码" autocomplete="off" class="layui-input" style="width: 200px;">
                    <span id="phonenumber_err" style="color: red"></span>
                </div>
            </div>
        </div>

        <div class="layui-col-md12" style="margin-top: 10px;">
            <div class="layui-form-item">
                <label class="layui-form-label">
                    <input type="button" class="layui-btn layui-btn-sm layui-btn-normal" id="get_code" value="获取验证码"/>
                </label>
                <div class="layui-input-block">
                    <input type="text" name="phoneCode" required  lay-verify="required" placeholder="请输入验证码" autocomplete="off" class="layui-input" style="width: 200px;">
                    <span id="phonecode_err" style="color: red"></span>
                </div>
            </div>
        </div>
        <div class="layui-col-md12" style="margin-top: 10px;">
            <div class="layui-col-md5 layui-col-md-offset1">
                <span><a href="javascript:;" id="a_number">使用账号密码登录</a></span>
            </div>
            <div class="layui-col-md5 ">
                <span><a href="javascript:;">还没有账号？立即注册</a></span>
            </div>
        </div>

        <div class="layui-col-md12">
            <div class="layui-form-item" style="margin-left: 95px;margin-top: 10px;">
                <label class="layui-form-label">
                    <button type="button"  class="layui-btn layui-btn-sm layui-btn-normal" style="width: 200px;" id="phoneLogin">登&nbsp;&nbsp;录</button>
                </label>
            </div>
        </div>
    </form>
</div>

<!-- 账号密码登录 -->
<div id="login2" style="width: 400px;height: 330px;position: fixed;margin-top: 200px;margin-left: 500px;z-index: 30;background: #FCF8E3;">

    <form class="layui-form" id="loginForm2">
        <h2 align="right"><i class="layui-icon layui-icon-close" style="font-size: 30px; color: #1E9FFF;" id="close_login2"></i> &nbsp;</h2>
        <h2 align="center">账号密码登录</h2>
        <div class="layui-col-md12" style="margin-top: 30px">
            <div class="layui-form-item">
                <label class="layui-form-label"><i class="layui-icon layui-icon-username" style="font-size: 30px; color: #1E9FFF;"></i> </label>
                <div class="layui-input-block">
                    <input type="text" name="cNumber" required  lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input" style="width: 200px;">
                </div>
            </div>
        </div>

        <div class="layui-col-md12" style="margin-top: 10px;">
            <div class="layui-form-item">
                <label class="layui-form-label"><i class="layui-icon layui-icon-password" style="font-size: 30px; color: #1E9FFF;"></i> </label>
                <div class="layui-input-block">
                    <input type="password" name="cPassword" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input" style="width: 200px;">
                    <span id="numberErr" style="color: red"></span>
                </div>
            </div>
        </div>
        <div class="layui-col-md12" style="margin-top: 10px;">
            <div class="layui-col-md5 layui-col-md-offset1">
                <span><a href="javascript:;" id="a_phone">使用手机号码登录</a></span>
            </div>
            <div class="layui-col-md5 ">
                <span><a href="javascript:;">还没有账号？立即注册</a></span>
            </div>
        </div>

        <div class="layui-col-md12">
            <div class="layui-form-item" style="margin-left: 95px;margin-top: 10px;">
                <label class="layui-form-label">
                    <button type="button" id="numberLogin" class="layui-btn layui-btn-sm layui-btn-normal" style="width: 200px;">登&nbsp;&nbsp;录</button>
                </label>
            </div>
        </div>
    </form>
</div>

<div class="layui-container">
    <!-- 导航 -->
    <div class="layui-row">
        <!-- 登录注册 -->
        <div class="layui-col-md5">
            <div>
						<span class="layui-breadcrumb" lay-separator="|">
							<a href="javascript:;" id="a_login">登录</a>
							<a href="/loadCustomerAdd">注册</a>
							<a href="">查看积分</a>
						</span>
            </div>
        </div>
        <!-- 其它 -->
        <div class="layui-col-md5 layui-col-md-offset2">
            <div class="layui-col-md5">
                <div>
							<span class="layui-breadcrumb" lay-separator="|">
								<a href="">其它1</a>
								<a href="">其它2</a>
								<a href="">其它3</a>
							</span>
                </div>
            </div>
        </div>
    </div>
    <!-- 中间大模块1+2+1 -->
    <div class="layui-row" style="height: 500px;margin-top: 50px;">
        <!-- 品牌3/12 -->
        <div class="layui-col-md3 " style="height: 100%;">
            <div class="layui-col-md12" style="height: 30%;">
                <img src="/download?filename=yiqihai/hezuo1.jpg" id="hezuo"/>
            </div>
            <div class="layui-col-md12" style="height: 70%;">

                <div class="layui-col-md6" style="height:25%;">
                    <img src="/download?filename=yiqihai/icon/bwmIcon1.jpg"/>
                </div>

                <div class="layui-col-md6" style="height:25%;">
                    <img src="/download?filename=yiqihai/icon/bl.jpg"/>
                </div>

                <div class="layui-col-md6" style="height:25%;">
                    <img src="/download?filename=yiqihai/icon/bc.jpg"/>
                </div>

                <div class="layui-col-md6" style="height:25%;">
                    <img src="/download?filename=yiqihai/icon/bt.jpg"/>
                </div>

                <div class="layui-col-md6" style="height:25%;">
                    <img src="/download?filename=yiqihai/icon/dz.jpg"/>
                </div>

                <div class="layui-col-md6" style="height:25%;">
                    <img src="/download?filename=yiqihai/icon/lh.jpg"/>
                </div>

                <div class="layui-col-md6" style="height:25%;">
                    <img src="/download?filename=/yiqihai/icon/fll.jpg"/>
                </div>

                <div class="layui-col-md6" style="height:25%;">
                    <img src="/download?filename=yiqihai/icon/ft.jpg"/>
                </div>
            </div>
        </div>
        <!-- 主要位置 -->
        <div class="layui-col-md9 layui-col-space10" style="height: 100%;">
            <!-- 中间导航栏 -->
            <div class="layui-col-md12" style="height: 12.5%;">
                <div id="center_Navigation">
                    <ul class="layui-nav layui-bg-orange">
                        <li class="layui-nav-item layui-this"><a href="">首页</a></li>
                        <li class="layui-nav-item "><a href="">自驾租车</a></li>
                        <li class="layui-nav-item"><a href="javascript:;">车型查询</a></li>
                        <li class="layui-nav-item"><a href="">接送服务</a></li>
                        <li class="layui-nav-item"><a href="">热门活动</a></li>
                    </ul>
                </div>
            </div>
            <!-- 图片轮播 -->
            <div class="layui-col-md12">
                <div class="layui-carousel" id="test10">
                    <div carousel-item="">
                        <div><img src="/download?filename=yiqihai/bwm1.jpg" class="showlunbo"></div>
                        <div><img src="/download?filename=yiqihai/lh1.jpg" class="showlunbo"></div>
                        <div><img src="/download?filename=yiqihai/hm1.jpg" class="showlunbo"></div>
                        <div><img src="/download?filename=yiqihai/ym1.jpg" class="showlunbo"></div>
                        <div><img src="/download?filename=yiqihai/hc1.jpg" class="showlunbo"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 热租车型 -->
    <div class="layui-col-md12" style="margin-top:50px ;">

        <div class="layui-col-md5">
            <div class="layui-col-md12">
                <span style="font-size: 30px;">热租车型   </span><span style="color: red;">百余款车型</span><span>任你选择！劲爆优惠天天推荐</span>
            </div>
            <div class="layui-col-md12" style="height: 421px">
                <img src="/download?filename=yiqihai/lf1.jpg" />
            </div>
        </div>

        <div class="layui-col-md7">
            <div class="layui-tab layui-tab-card" style="margin-top: 0px;">
                <ul class="layui-tab-title">
                    <li class="layui-this">家庭型</li>
                    <li>豪华型</li>
                    <li>越野型</li>
                    <li>舒适型</li>
                    <li>团聚型</li>
                    <li>动力型</li>
                    <li>新能源</li>
                </ul>
                <div class="layui-tab-content" style="height: 400px;">
                    <div class="layui-tab-item layui-show" style="height: 100%;">1家庭型，数据库查询图片</div>
                    <div class="layui-tab-item" style="height: 100%;">2豪华型，数据库查询图片</div>
                    <div class="layui-tab-item" style="height: 100%;">3越野型，数据库查询图片</div>
                    <div class="layui-tab-item" style="height: 100%;">4舒适型，数据库查询图片</div>
                    <div class="layui-tab-item" style="height: 100%;">5团聚型，数据库查询图片</div>
                    <div class="layui-tab-item" style="height: 100%;">6动力型，数据库查询图片</div>
                    <div class="layui-tab-item" style="height: 100%;">7新能源，数据库查询图片</div>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
<script src="static/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>

    $(function(){
        //刚开始不显示登录界面
        $("#login").hide();
        $("#login2").hide();
    })
    //点击登录
    $("#a_login").on('click',function(){
        $("#login").show();
    })
    //登录界面点击关闭
    $("#close_login").on('click',function(){
        $("#login").hide();
    })
    $("#close_login2").on('click',function(){
        $("#login2").hide();
    })
    //点击账号密码登录
    $("#a_number").on('click',function(){
        $("#login").hide();
        $("#login2").show();
    })
    //点击手机号码登录
    $("#a_phone").on('click',function(){
        $("#login2").hide();
        $("#login").show();
    })

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
        time(this);//倒计时
        sendSms();//发送验证码
    })
    //手机号码登录
    $("#phoneLogin").on('click',function () {
        //清空异常消息
        $("#phonenumber_err").html('');
        $("#phonecode_err").html('');
        //获取表单
        var form1 = $("#login_form1").serialize();
        $.ajax({
            method:'post',
            url:'/customer/loginforPhone',
            data:form1,
            dataType:'JSON'
        }).done(function (response) {
            if(response.code === '200'){
                //成功
                $("#login").hide();
            }
            if(response.code === '500'){
                //数据库没有这条数据
                $("#phonenumber_err").html(response.msg);
            }
            if (response.code === '400'){
                //验证码错误
                $("#phonecode_err").html(response.msg);
            }
        }).file(function () {
            alert("登录失败");
        })
    })

    //账号密码登录
    $("#numberLogin").on('click',function () {
        //清除异常消息
        $("#numberErr").html('');
        //获取表单
        var form2 = $("#loginForm2").serialize();
        alert(form2)
        $.ajax({
            method:'post',
            url:'/customer/loginforNumber',
            data:form2,
            dataType:'JSON'
        }).done(function (response) {
            if(response.code === '200'){
                //成功
                $("#login2").hide();
            }
            if(response.code === '500'){
                //数据库没有这条数据
               $("#numberErr").html(response.msg);
            }
        }).file(function () {
            alert("登录失败");
        })
    })

    layui.use(['carousel', 'form'], function(){
        var carousel = layui.carousel
            ,form = layui.form;

        //图片轮播
        carousel.render({
            elem: '#test10'
            ,width: '845px'
            ,height: '430px'
            ,interval: 5000
        });


        var $ = layui.$, active = {
            set: function(othis){
                var THIS = 'layui-bg-normal'
                    ,key = othis.data('key')
                    ,options = {};

                othis.css('background-color', '#5FB878').siblings().removeAttr('style');
                options[key] = othis.data('value');
                ins3.reload(options);
            }
        };

        layui.use('element', function(){
            var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

            //监听导航点击
            element.on('nav(demo)', function(elem){
                //console.log(elem)
                layer.msg(elem.text());
            });
        });

    });
</script>
</html>
