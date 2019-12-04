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
    <style>
        /*div{ border: 1px solid red;}*/

        img{
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>


<div class="layui-container">
    <!-- 导航 -->
    <div class="layui-row">
        <!-- 登录注册 -->
        <div class="layui-col-md5">
            <div>
						<span class="layui-breadcrumb" lay-separator="|">
							<a href="/load/Customer/login">登录</a>
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

    <div class="layui-col-md12">

    </div>
</div>


</body>
<script src="static/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
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
