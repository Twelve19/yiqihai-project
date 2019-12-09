<%--
  Created by IntelliJ IDEA.
  User: 李威
  Date: 2019/12/8
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>用户信息完善</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css"  media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
    <script src="/static/jq/jquery-3.4.1.js"></script>
    <style>
        div{
            border: 1px solid red;
        }
        #div_all{
            width:1350px;
            height: 630px;
        }
        #div_tips{
            width: 100%;
            height: 100%;
            background-color: #00BFFF;
            text-align: center;
            position: fixed;
            z-index: 30;

        }
        .div_tipstop{
            margin-top: 10%;
        }
        #div_tipsbtn{
            width: 216px;
            margin-left: 580px;
            margin-top: 100px;
        }
    </style>
</head>
<body>
<div id="div_all">
    <!-- 提示信息！ -->
    <div id="div_tips">
        <div class="div_tipstop">
            <h1>使用条例需知</h1>
            <p>根据网络安全管理条例法，用户必须进行实名认证。</p>
            <p>您当前正在使用一起嗨租车公司的服务，请按照指引完成认证</p>
        </div>

        <div id="div_tipsbtn" >
            <input type="button" class="layui-btn layui-btn-fluid" value="我已同意并阅读条例" id="tips_btn">
        </div>
    </div>

    <!-- 用户信息 -->
    <div id="div_customer">
        <form class="layui-form" action="">
            <h1>个人信息如下</h1>
            <div class="layui-form-item">
                <label class="layui-form-label">账号</label>
                <div class="layui-input-inline">
                    <input type="text" id="cNumber" name="cNumber" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" readonly="readonly" value="">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">身份证</label>
                <div class="layui-input-inline">
                    <input type="text" id="cCard" name="cCard" lay-verify="identity" placeholder="请输入身份证号码" autocomplete="off" class="layui-input" >
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">驾驶证</label>
                <div class="layui-input-inline">
                    <input type="text" id="cDriving" name="cDriving" lay-verify="driving" placeholder="请输入驾驶证号码" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">手机号码</label>
                <div class="layui-input-inline">
                    <input type="text" id="cPhone" name="cPhone" lay-verify="required|phone" placeholder="请输入手机号码" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-inline">
                    <input type="text" id="cName" name="cName" lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-block">
                    <input type="radio" id="man" name="sex" value="男" title="男" checked="">
                    <input type="radio" id="men" name="sex" value="女" title="女">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <input type="button" class="layui-btn" lay-submit lay-filter="formDemo" value="保存修改"></input>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>


<script src="/static/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>

    //浏览器初始化时
    $(function () {
        queryCustomer();
    })

    //查询数据
    function queryCustomer(){
        $.ajax({
            method:'get',
            url:'/customer/queryCustomer',
            dataType:'json'
        }).done(function (response) {
            if(response.code === "200"){

                //身份证号填写了
                if(response.data.ccard != null){
                    $("#div_tips").hide();
                }

                //绑定数据
                $("#cNumber").val(response.data.cnumber);
                $("#cCard").val(response.data.ccard);
                $("#cDriving").val(response.data.cdriving);
                $("#cPhone").val(response.data.cphone);
                $("#cName").val(response.data.cname);
                if(response.data.csex === "男"){
                    $("#man").checked()
                }
                if(response.data.csex === "女"){
                    $("#men").checked()
                }
            }else {
                alert(response.msg);
            }
        }) .fail(function () {
            alert("fail失败");
        })
    }

    //同意协议
    $("#tips_btn").on('click',function(){
        $("#div_tips").hide();
    })


    layui.use('form', function(){
        var form = layui.form;
        //verify表单验证
        form.verify({

            //驾驶证12位数字
            driving:function (value,itme) {

                if(! new RegExp(/^[0-9]{12}$/).test(value)){
                    return "驾驶证不符合要求";
                }
            }
        });

    });

</script>
</body>
</html>