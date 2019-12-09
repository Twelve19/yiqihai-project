
$(function(){
    //刚开始不显示登录界面
    $("#login_all").hide();
    $("#login").hide();
    $("#login2").hide();
})
//点击登录
$("#a_login").on('click',function(){
    $("#login_all").show();
    $("#login").show();
})
//登录界面点击关闭
$("#close_login").on('click',function(){
    $("#login_all").hide();
    $("#login").hide();
})
$("#close_login2").on('click',function(){
    $("#login_all").hide();
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
            $("#login_all").hide();
        }
        if(response.code === '500'){
            //数据库没有这条数据
            $("#phonenumber_err").html(response.msg);
        }
        if (response.code === '400'){
            //验证码错误
            $("#phonecode_err").html(response.msg);
        }
    }).fail(function () {
        alert("登录失败");
    })
})

//账号密码登录
$("#numberLogin").on('click',function () {
    //清除异常消息
    $("#numberErr").html('');
    //获取表单
    var form2 = $("#loginForm2").serialize();
    $.ajax({
        method:'post',
        url:'/customer/loginforNumber',
        data:form2,
        dataType:"json"
    }).done(function (response) {
        console.log(response)
        if(response.code === '200'){
            //成功
            $("#huanyin").html('欢迎登录，'+response.data.cnumber);
            $("#login2").hide();
            $("#login_all").hide();

        }
        if(response.code === '500'){
            //数据库没有这条数据
            $("#numberErr").html(response.msg);
        }
    }).fail(function () {
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