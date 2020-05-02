<%@ page  language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>在线书城/登陆</title>
    <link rel="stylesheet" href="css/public.css">
    <script type="text/javascript"  language="javascript" src="js/jquery-1.11.3.min.js"></script>
    <style>
        .ld1{
            width: 100%;
            height: 670px;
            padding-top: 68px;
        }
        .ld1>div{
            width: 100%;
            height: 670px;
            background-image: url("image/logBg.png");
            background-repeat: no-repeat;
            background-size: cover;
        }
        .ld1>div>div{
            width: 100%;
            height: 346px;
            padding-top: 130px;
            margin: 0 auto;
        }
        .ld1 .ld11{
            width: 320px;
            height: 260px;
            padding: 30px 40px;
            margin: 0 auto;
            background-color: white;
            border-radius: 4px;
        }
        .ld11>p{
            width: 320px;
            height: 24px;
            margin-bottom: 24px;
            color: rgb(51,51,51);
            font-size: 18px;
        }
        .ld11 .zh{
            width: 320px;
            height: 42px;
            margin-bottom: 20px;
            position: relative;
        }
        .ld11 .zh input{
            outline: none;
            width: 318px;
            height: 38px;
            border: 1px solid rgb(213,213,213);
            border-radius: 5px;
            padding: 1px 0;
            text-indent: 1em;
        }
        .ld11 .zh div{
            width:125.672px;
            height: 40px;
            padding: 0 4px;
            position: absolute;
            top: 1px;
            bottom: 1px;
            left: 16px;
            font-size: 16px;
            color: rgb(170, 170, 170);
            line-height: 40px;
        }
        .ld11 .mm{
            width: 320px;
            height: 42px;
            margin-bottom: 20px;
            position: relative;
        }
        .ld11 .mm input{
            outline: none;
            width: 318px;
            height: 38px;
            border: 1px solid rgb(213,213,213);
            border-radius: 5px;
            padding: 1px 0;
            text-indent: 1em;
        }
        .ld11 .mm div{
            width:125.672px;
            height: 40px;
            padding: 0 4px;
            position: absolute;
            top: 1px;
            bottom: 1px;
            left: 16px;
            font-size: 16px;
            color: rgb(170, 170, 170);
            line-height: 40px;
        }
        .ld11 .zw{
            width: 320px;
            height: 16px;
            margin-bottom: 10px;
        }
        .ld11 .zw a{
            text-decoration: none;
            color: rgb(85,85,85);
            font-size: 12px;
            line-height: 16px;
        }
        .ld11 .zw .aw{
            float: right;
        }
        .ld11 .zw .az{
            float: left;
        }
        .ld11 form>input{
            font-size: 18px;
            color: white;
            background-color: #c78a49;
            display: block;
            width: 320px;
            height: 48px;
            padding: 0 60px;
            border: 1px solid rgba(0,0,0,0);
            border-radius: 4px;
        }
        .ldf{
            width: 320px;
            height: 70px;
            margin-top: 30px;
        }
        .ldf1{
            width: 320px;
            height: 0;
            border-top: 1px solid rgb(221, 221, 221);
            position: relative;
        }
        .ldf1>span{
            width: 72px;
            height: 16px;
            font-size: 12px;
            color: rgb(102,102,102);
            background-color: white;
            padding: 0 6px;
            position: absolute;
            top: -8px;
            left: 37%;
        }
        .ldf>.ldf2{
            width: 280px;
            height: 45px;
            margin: 24px 20px 0;
        }
        .ldf .ldf2>a{
            width: 34px;
            height: 34px;
            text-decoration: none;
            margin: 0 0 0 5px;
            position: relative;
        }
        .ldf2>a>.wx{
            position: absolute;
            left: 0;
            top: -18.5px;
            display: block;
        }
        .ldf2>a>.wx:hover{
            opacity: 0;
            transition: 0.2s linear;
        }
        .ldf2>a>.qq{
            position: absolute;
            left: 0;
            top: -19.5px;
            display: block;
        }
        .ldf2>a>.qq:hover{
            opacity: 0;
            transition: 0.2s linear;
        }
        .ldf2>a>.wy{
            position: absolute;
            left: 0;
            top: -19.5px;
            display: block;
        }
        .ldf2>a>.wy:hover{
            opacity: 0;
            transition: 0.2s linear;
        }
        .ldf2>a>.db{
            position: absolute;
            left: 0;
            top: -18.5px;
            display: block;
        }
        .ldf2>a>.db:hover{
            opacity: 0;
            transition: 0.2s linear;
        }
        .ldf2>a>.wb{
            position: absolute;
            left: 0;
            top: -18.5px;
            display: block;
        }
        .ldf2>a>.wb:hover{
            opacity: 0;
            transition: 0.2s linear;
        }
        .ldf2>a>.rr{
            position: absolute;
            left: 0;
            top: -19.5px;
            display: block;
        }
        .ldf2>a>.rr:hover{
            opacity: 0;
            transition: 0.2s linear;
        }
    </style>
</head>
<body id="body">
<%@ include file="head.jsp" %>
    <div class="ld1">
        <div>
            <div>
                <div class="ld11">
                    <p>登录</p>
                    <form action="/login.do" method="post">
                        <div class="zh">
                            <input type="text" name="username" id="zin" value="" />
                            <div id="zh1"  >手机/邮箱/用户名</div>
                        </div>
                        <div class="mm">
                            <input type="password" name="password" id="min" />
                            <div id="mm" >登录密码</div>
                        </div>
                        <div class="zw">
                            <a href="/register" class="az">注册</a>
                            <a href="" class="aw">忘记密码</a>
                        </div>
                        <input type="submit" value="登录" id="lg">
                    </form>
                </div>
            </div>
        </div>

    </div>
<%@ include file="foot.jsp" %>
     <script src="js/leibie.js"></script>
     <script src="js/login.js"></script>
</body>
</html>