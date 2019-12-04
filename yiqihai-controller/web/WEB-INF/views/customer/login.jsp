<%--
  Created by IntelliJ IDEA.
  User: 李威
  Date: 2019/12/3
  Time: 9:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录</title>
    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }
        body {



            background-image: linear-gradient(120deg, skyblue, pink);
            display: flex;
            justify-content: center;
            flex-direction: column;
        }
        form {
            width: 320px;
            height: 350px;
            background: #f1f1f1;
            border-radius: 5px;
            padding: 30px;
            margin: 10px auto;
        }
        form h3 {
            text-align: center;
            margin-bottom: 10px;
        }
        #UserLogin{
            margin-left: 120px;
            text-align: right;
        }
        #UserLogin:link{
            text-decoration: none;
        }
        .ib {
            position: relative;
            margin: 30px 0;
            border-bottom: 2px solid #d1d1d1;
        }
        .ib input {
            border: none;
            background: none;
            outline: none;
            height: 40px;
            width: 100%;
            padding: 5px 10px;
        }
        .ib span::before {
            content: attr(data-placeholder);
            position: absolute;
            left: 0;
            top: 50%;
            transform: translate(0, -50%);
            z-index: 0;
            color: gray;
            font-size: 0.8em;
            transition: 0.8s;
        }
        .ib span::after {
            content: "";
            height: 2px;
            width: 0;
            position: absolute;
            margin-top: 40px;
            margin-left: -260px;

            background-image: linear-gradient(100deg, red, yellow, darkblue);
            transition: 0.5s;
        }
        .focus + span::before {
            top: -5px;
        }
        .focus + span::after {
            width: 100%;
        }
        #btn {
            display: block;
            width: 100%;
            height: 40px;
            background-color: deepskyblue;
            background-size: 200%;
            color: white;
            border: none;
            cursor: pointer;
            transition: 0.5s;
            margin-top: 30px;
        }
        #btn:hover {
            background-position: right;
        }
        .rg {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<form  action="/customer/login" method="post">
    <h2 align="center">一起嗨租车</h2>
    <div class="ib">
        <input name="cNumber" />
        <span data-placeholder="Please Enter Administrator ID"></span>
    </div>
    <div class="ib">
        <input name="cPassword" type="password" />
        <span data-placeholder="Please Enter Your Password"></span>
    </div>
    <input id="btn" type="submit" value="点击登录" />

    <div class="rg">
        <a href="/loadCustomerAdd" id="UserLogin">用户注册>></a>
    </div>
</form>



<script>

    window.onload = function (ev) {
        var nodeListOf = document.querySelectorAll("input");
        nodeListOf.forEach(function (o) {
            o.onfocus = function (ev) {
                ev.target.classList.add("focus");
            };
            o.onblur = function (ev) {
                if (!ev.target.value) {
                    ev.target.classList.remove("focus");
                }
            }
        });
    };
</script>

</body>
</html>
