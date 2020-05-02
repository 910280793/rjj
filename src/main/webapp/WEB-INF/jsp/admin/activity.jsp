<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>在线书城后台-活动管理</title>
    <link rel="stylesheet" href="css/public2.css">
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        ul{
            list-style: none;
        }
        .navigation{
            z-index: 100;
            width: 100%;
            height: 68px;
            background-color: white;
            position: fixed;
            top:0;
            right: 0;
            border-bottom: 1px solid #ededed;
            box-shadow: 0 0.1px 10px -4px #999999;
        }
        .wrap{
            z-index: 100;
            width: 1140px;
            margin: 0 auto;
        }
        .navigation li{
            z-index: 100;
            display: block;
        }
        .navigation .logo,.ul-bar-left li{
            float: left;
            display: block;
            padding: 0 30px;
        }
        .navigation .ul-bar-left li:hover{
            background-color: rgb(230,214,198);
        }
        .navigation .ul-bar-right li{
            float: right;
            padding: 0 7px;
        }
        .img2{
            margin-top: 23px;
            margin-right: -13px;
        }
        .img3{
            margin-right: 105px;
            margin-top: 22px;
        }
        .logo{
            margin: 20.6px 14px 0 -14px;
        }
        .logoi{
            width: 110px;
            height: 27.88px;
        }
        .a0{
            font-weight: bold;
            margin-right: -7px;
        }
        .navigation .word{
            text-decoration: none;
            color: #000000;
            display: block;
            font-size: 14px;
            line-height: 68px;
        }
        .navigation .img2,.img3{
            vertical-align: middle;
            text-align: center;
        }
        .wrap2{
            width: 100%;
            height: auto;
            position: absolute;
            top: 68px;
            background-color: white;
            display: none;
        }
        .wrap2>ul>li>a{
            text-decoration: none;
            color: rgb(31, 31, 31);
            font-size: 14px;
            line-height: 38px;
        }
        .wrap2>ul>li>a:hover{
            color: rgb(227,190,150);
        }
        .wrap2>ul{
            float: left;
            margin: 40px 0 0 305px;
        }
        .wrap2 .wA1{
            margin-left: 137px;
        }
        .wrap2>div{
            float: left;
            width: 248px;
            height: 339px;
            margin: 0 auto;
            text-align: center;
        }
        .w2I{
            width: 200px;
            height: 200px;
            padding: 24px;
            display: block;
        }
        .w2I img{
            width: 200px;
            height: 200px;
        }
        .w2P1{
            display: block;
            width: 198px;
            height: 30px;
            padding: 0 25px;
            text-decoration: none;
            color: rgb(51,51,51);
            font-size: 12px;
            font-weight: bold;
            line-height: 14px;
            margin-top: 10px;
        }
        .w2P2{
            width: 223px;
            height: 44px;
            padding-left: 25px;
            margin-top: 5px;
            font-size: 14px;
            color: red;
        }
        .d6{
            width: 100%;
            height: 390px;
            background-color: #faf8f8;
        }
        .d61{
            width: 1140px;
            height: 168px;
            padding-top: 60px;
            margin: 0 104.5px;

        }
        .d62{
            width: 1349px;
            height: 111px;
            border-top: 1px solid #e6e6e6;
            margin: 50px 0 0;
        }
        .d611{
            width: 307px;
            height: 165px;
        }
        .d611 img{
            width: 110px;
            height: 27.875px;
        }
        .d611 p{
            width: 307px;
            height: 85px;
            margin: 12px 0 40px;
            font-size: 12px;
            color: rgb(133, 92, 49);
        }
        .d611 p:hover{
            color: #c78a49;
        }
        .d612 :hover{
            color: #c78a49;
        }
        .d613 p:hover{
            color: #c78a49;
        }
        .d612{
            width: 470px;
            height: 168px;
            margin: 0 0 0 60px;
        }
        .d612 ul{
            float: left;
        }
        .li61{
            width: 152.75px;
            height: 36px;
        }
        .li62{
            width: 152.75px;
            height: 30px;
        }
        .li61 a{
            font-size: 14px;
            color: rgb(51, 51, 51);
            line-height: 36px;
            text-decoration: none;
        }
        .li62 a{
            font-size: 12px;
            color: rgb(51, 51, 51);
            line-height: 30px;
            text-decoration: none;
        }
        .weixin,.weibo{
            width: 120px;
            height: 140px;
            margin: 0 0 0 17px;
        }
        .d613 img{
            width: 120px;
            height: 120px;
        }
        .d613 p{
            width: 120px;
            height: 20px;
            font-size: 14px;
            text-align: center;
        }
        .d613>div{
            float: right;
        }
        .d611,.d612{
            float: left;
        }
        .d613{
            float: right;
        }
        .d621{
            width: 1140px;
            height: 71px;
            padding: 20px 0;
            margin: 0 auto;
            position: relative;
        }
        .p61{
            font-size: 12px;
            color: rgb(145, 145, 145);
            width: 570px;
            height: 19px;
            padding-bottom: 10px;
            margin: 10px 0 6px 0;
        }
        .p621{
            width: 39px;
            height: 36px;
            /*overflow: hidden;*/
            position: relative;
        }
        .p622{
            width: 50px;
            height: 36px;
            color: rgb(145, 145, 145);
            font-size: 12px;
            padding-left: 5px;
        }
        .img61{
            z-index: 10;
            position: absolute;
            top:0;
            left:0;
        }
        .img61:hover{
            opacity: 0;
            transition: 0.2s linear;
        }
        .d622 li{
            float: right;
            width: 112px;
            height: 36px;
        }
        .d622 li p{
            float: left;
        }
        .d622 ul{
            position: absolute;
            top: 38px;
            right: -18px;
        }
        .d7{
            width: 100%;
            height: 18px;
            padding: 30px 0;
            border-top: 2px solid rgb(217, 217, 217);
            background-color: rgb(238, 238, 238);
            margin: 0 auto;
            text-align: center;
            position: relative;
        }
        .s71{
            position: absolute;
            top: 33px;
            left: 574px;
        }
        .s71 a{
            width: 16px;
            height: 15px;
            overflow: hidden;
        }
        .s72{
            color: rgb(221, 221, 221);
            height: 18px;
            margin-left: 23px;
        }
        .s73 a{
            color: rgb(165, 165, 165);
            font-size: 12px;
            height: 12px;
            text-decoration: none;
        }
        .nav .nav1 .activity{
            background-color: #F55D54;
            color: white;
        }
        .main{
            margin: 100px 10px 20px 20px;
            width: 80%;
            float: left;
        }
        .main .set>p{
            width: 100%;
            height: 80px;
            line-height: 80px;
            color: #706F6F;
            background-color: #E0E0E0;
            font-size: 20px;
            padding-left: 15px;
            font-weight: bold;
        }
        .main .set p a{
            margin-left: 15px;
            font-size: 18px;
            color: #F55D54;
            text-decoration:none;
            font-weight: normal;
        }
        .List{
            width: 100%;
            height: 670px;
            background-color: white;
            padding-left: 15px;
        }
        .main .set .List>table{
            width: 100%;
            padding: 0 15px;
        }
        .main .set .List table td{
            border-bottom: 1px solid #dddddd;
        }
        .main .set .List .num{
            height: 40px;
            line-height: 40px;
            width: 10%;
            text-align: center;
        }
        .main .set .List .name{
            width: 15%;
            text-align: center;
        }
        .main .set .List .state{
            width: 15%;
            text-align: center;
        }
        .main .set .List .operation{
            text-align: center;
        }
        .first{
            font-size: 18px;
            font-weight: bolder;

        }
        .main .set .userList>p{
            font-size: 20px;
            text-align: left;
            line-height: 40px;
            height: 40px;
            font-weight: bolder;
        }
        .operation button{
            height: 30px;
            line-height: 30px;
            border: none;
            background-color: transparent;
            color:#F55D54 ;
            outline:none;
        }
        .operation .change{
            color: #259B24;
        }
    </style>
</head>
<body>
<%@ include file="head.jsp" %>
<div class="nav">
    <div class="nav1">
        <ul>
            <p>管理</p>
            <li><a class="users" href="allUser">用户管理</a></li>
            <li><a class="activity" href="getAllact">活动管理</a></li>
            <li><a class="type" href="get_categoryManage2.do">类型管理</a></li>
            <li><a class="comm" href="listProductManage.do">商品管理</a></li>
            <li><a class="order" href="listOrderManage.do">订单管理</a></li>
            <hr/>

        </ul>
    </div>
</div>
<div class="main">
    <div class="set">
        <p>商城活动设置<a href="editPage">新增</a></p>
        <div class="List">
            <table>
                <tr>
                    <td class="num first" >序号</td>
                    <td class="name first" >活动名称</td>
                    <td class="state first" >状态</td>
                    <td class="operation first" >商品管理</td>
                    <td class="operation first" >操作</td>
                </tr>
                <c:forEach items="${list}" var="a">
                    <tr>
                        <td class="num">${a.id}</td>
                        <td class="name">${a.activityName}</td>
                        <td class="state">${a.state}</td>
                        <td class="operation">
                            <a href="/addActProductPage?actId=${a.id}">添加商品</a><br>
                            <a href="/delActProductPage?actId=${a.id}">删除商品</a><br></td>
                        <td class="operation">
                            <a href="/udateStateAct?id=${a.id}&state=进行中">开始</a><br>
                            <a href="/udateStateAct?id=${a.id}&state=已结束">停止</a><br>
                            <a href="/delAct?id=${a.id}">删除</a><br>
                            <a href="/editPage?id=${a.id}"class="change">修改</a>
                        </td>
                    </tr>

                </c:forEach>

            </table>
        </div>
    </div>
</div>
</body>
</html>