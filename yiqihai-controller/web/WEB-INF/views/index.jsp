<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="/static/layui/css/layui.css"  media="all">
    <script src="/static/jq/jquery-3.4.1.js"></script>
<%--    自定义样式--%>
    <link rel="stylesheet" href="/static/css/index.css" media="all">
    <link rel="stylesheet" href="/static/css/icon_color.css" media="all">
</head>
<body>


<div id="login_all">
    <%--登录模块--%>
    <div id="login" class="login_div">

        <form class="layui-form" id="login_form1">
            <h2 align="right"><i class="layui-icon layui-icon-close blue_icon" id="close_login"></i> &nbsp;</h2>
            <h2 align="center">手机号码登录</h2>
            <div class="layui-col-md12" style="margin-top: 30px">
                <div class="layui-form-item">
                    <label class="layui-form-label"><i class="layui-icon layui-icon-cellphone blue_icon"></i> </label>
                    <div class="layui-input-block">
                        <input type="text" id="phoneNumber" name="phoneNumber" required  lay-verify="required" placeholder="请输入手机号码" autocomplete="off" class="layui-input text_width">
                        <span id="phonenumber_err" class="err_color"></span>
                    </div>
                </div>
            </div>

            <div class="layui-col-md12" style="margin-top: 10px;">
                <div class="layui-form-item">
                    <label class="layui-form-label">
                        <input type="button" class="layui-btn layui-btn-sm layui-btn-normal" id="get_code" value="获取验证码"/>
                    </label>
                    <div class="layui-input-block">
                        <input type="text" name="phoneCode" required  lay-verify="required" placeholder="请输入验证码" autocomplete="off" class="layui-input text_width" >
                        <span id="phonecode_err" class="err_color"></span>
                    </div>
                </div>
            </div>
            <div class="layui-col-md12" style="margin-top: 10px;">
                <div class="layui-col-md5 layui-col-md-offset1">
                    <span><a href="javascript:;" id="a_number">使用账号密码登录</a></span>
                </div>
                <div class="layui-col-md5 ">
                    <span><a href="/load/customer/add">还没有账号？立即注册</a></span>
                </div>
            </div>

            <div class="layui-col-md12">
                <div class="layui-form-item" style="margin-left: 95px;margin-top: 10px;">
                    <label class="layui-form-label">
                        <button type="button"  class="layui-btn layui-btn-sm layui-btn-normal text_width" id="phoneLogin">登&nbsp;&nbsp;录</button>
                    </label>
                </div>
            </div>
        </form>
    </div>

    <!-- 账号密码登录 -->
    <div id="login2" class="login_div">

        <form class="layui-form" id="loginForm2">
            <h2 align="right"><i class="layui-icon layui-icon-close blue_icon"  id="close_login2"></i> &nbsp;</h2>
            <h2 align="center">账号密码登录</h2>
            <div class="layui-col-md12" style="margin-top: 30px">
                <div class="layui-form-item">
                    <label class="layui-form-label"><i class="layui-icon layui-icon-username blue_icon" ></i> </label>
                    <div class="layui-input-block">
                        <input type="text" name="cNumber" required  lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input text_width">
                    </div>
                </div>
            </div>

            <div class="layui-col-md12" style="margin-top: 10px;">
                <div class="layui-form-item">
                    <label class="layui-form-label"><i class="layui-icon layui-icon-password blue_icon" ></i> </label>
                    <div class="layui-input-block">
                        <input type="password" name="cPassword" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input text_width">
                        <span id="numberErr" class="err_color"></span>
                    </div>
                </div>
            </div>
            <div class="layui-col-md12" style="margin-top: 10px;">
                <div class="layui-col-md5 layui-col-md-offset1">
                    <span><a href="javascript:;" id="a_phone">使用手机号码登录</a></span>
                </div>
                <div class="layui-col-md5 ">
                    <span><a href="/load/customer/add;">还没有账号？立即注册</a></span>
                </div>
            </div>

            <div class="layui-col-md12">
                <div class="layui-form-item" style="margin-left: 95px;margin-top: 10px;">
                    <label class="layui-form-label">
<%--                        <button type="button" id="numberLogin" class="layui-btn layui-btn-sm layui-btn-normal" style="width: 200px;">登&nbsp;&nbsp;录</button>--%>
                             <input type="button" id="numberLogin" class="layui-btn layui-btn-sm layui-btn-normal text_width" value="登&nbsp;&nbsp;录">
                    </label>
                </div>
            </div>
        </form>
    </div>
</div>


<div id="all">
    <div class="layui-container">
        <!-- 导航 -->
        <div class="layui-row">
            <!-- 登录注册 -->
            <div class="layui-col-md5">
                <div>
						<span class="layui-breadcrumb" lay-separator="|">
							<a href="javascript:;" id="a_login">登录</a>
							<a href="/load/customer/add">注册</a>
							<a href="javascript:;" id="huanyin">欢迎登录，${sessionScope.cNumber}</a>
						</span>
                </div>
            </div>
            <!-- 其它 -->
            <div class="layui-col-md5 layui-col-md-offset2">
                <div class="layui-col-md5">
                    <div>
							<span class="layui-breadcrumb" lay-separator="|">
								<a href="/load/customer/update">完善信息</a>
								<a href="">查看消息</a>
								<a href="">我的订单</a>
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
</div>



</body>
<script src="/static/layui/layui.js" charset="utf-8"></script>
<script src="/static/js/index.js" charset="utf-8"></script>
</html>
