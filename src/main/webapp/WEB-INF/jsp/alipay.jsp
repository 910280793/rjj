<%@ page  language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>在线书城/支付页面</title>
    <link rel="stylesheet" href="css/public.css">
    <style type="text/css">
        body{
            background: #f2f2f2
        }
        .content{
            width: 100%;
            padding-top: 68px;
        }
        .content .address{
            width: 80%;
            padding: 30px 40px;
            margin: auto;
            background-color: white;
            border-radius: 4px;
        }
        .address>p{
            width: 320px;
            height: 24px;
            margin-bottom: 20px;
            color: rgb(51,51,51);
            font-size: 18px;
        }
        .address .name,.address .phone,.address .city{
            width: 500px;
            height: 32px;
            padding-left: 20px;
            margin-bottom: 20px;
            position: relative;
        }
        .address .name span,.phone span,.city span,.addressDetail span{
            color: rgb(51,51,51);
            font-size: 16px;
            width: 50px;
        }
        .address .name input{
            outline: none;
            width: 100px;
            height: 30px;
            border: 1px solid rgb(213,213,213);
            border-radius: 5px;
            padding: 1px 0;
            text-indent: 1em;
        }
        .address .phone input{
            outline: none;
            width: 200px;
            height: 30px;
            border: 1px solid rgb(213,213,213);
            border-radius: 5px;
            padding: 1px 0;
            text-indent: 1em;
        }
        .address .city input{
            outline: none;
            width: 100px;
            height: 30px;
            border: 1px solid rgb(213,213,213);
            border-radius: 5px;
            padding: 1px 0;
            text-indent: 1em;
        }
        .address .addressDetail{
            width: 500px;
            height: 118px;
            padding-left: 20px;
            margin-bottom: 20px;
            position: relative;
        }
        .address .addressDetail span{
            color: rgb(51,51,51);
            font-size: 16px;
            width: 50px;
        }
        .address .addressDetail textarea{
            outline: none;
            width: 400px;
            height: 100px;
            border: 1px solid rgb(213,213,213);
            border-radius: 5px;
            padding: 1px 0px;
            margin-left: 50px;
            text-indent: 1em;
        }
        .content hr{
            width: 80%;
            height: 0.5px;
            border:0;
            background-color: #dddddd;
            padding: 0 40px;
            margin: auto;
        }
        .content .order{
            width: 80%;
            padding: 30px 40px;
            margin: auto;
            background-color: white;
            border-radius: 4px;
        }
        .order>p{
            width: 320px;
            height: 24px;
            margin-bottom: 20px;
            color: rgb(51,51,51);
            font-size: 18px;
        }
        .order table{
            width: 95%;
            margin:auto;
            border-collapse: collapse;
            /*border:1px solid #ccc;*/
        }
        .order tr{
            border:1px solid #ccc;
        }
        .order .pict{
            width: 15%;
        }
        .order .pict .pic{
            /*display: block;*/
            width: 100%;
            margin: 5px 5px;
        }
        .order .inf{
            padding-left: 10px;
            width: 55%;
        }
        .order .info{
            padding-left: 150px;
        }
        /*.order .inf span{*/
        /*position:absolute;*/
        /*!*left:35%;*!*/
        /*top:75%;*/
        /*}*/
        .order .price{
            padding-right: 10px;
            width: 10%;
        }
        .order .num{
            padding-right: 10px;
            width: 10%;
        }
        .order .total{
            padding-right: 10px;
            width: 10%;
        }
        .content .payWay{
            width: 80%;
            padding: 30px 40px;
            margin: auto;
            background-color: white;
            border-radius: 4px;
            text-align: right;
        }
        .content .payWay .pay{
            width: 97%;
        }
        .content .sub{
            width: 80%;
            padding: 15px 40px;
            margin: auto;
            background-color: white;
            border-radius: 4px;
            text-align: right;
        }
        .content .sub .to{
            width: 97%;
        }
        .to>p{
            color: rgb(51,51,51);
            font-size: 18px;
        }
        .to>p>b{
            color: red;
            font-size: 24px;
        }
        .sub .subm>a>input{
            font-size: 18px;
            color: white;
            background-color: #c78a49;
            /*display: block;*/
            width: 320px;
            height: 48px;
            padding: 0 60px;
            margin: 10px 40px;
            border: 1px solid rgba(0,0,0,0);
            border-radius: 4px;
        }
    </style>
</head>
<body>
<div class="navigation">
    <div class="wrap">
        <a href="#" class="logo"><img src="image/logo.png" alt="" class="logoi"></a>
        <ul class="ul-bar-left">
            <li><a href="" class="word chakan" id="chak">查看所有类别</a></li>
            <li><a href="/index" class="word">首页</a></li>
            <li><a href="" class="word">所有产品</a></li>
            <li><a href="/homepage" class="word">个人主页</a> </li>
        </ul>
        <ul class="ul-bar-right">
            <li class="word a0">0</li>
            <li class="img2"><a href="/shopcar"> <img src="image/0.png" alt=""></a></li>
            <li><a href="/register" class="word zhuc">注册</a></li>
            <li class="word ash">|</li>
            <li><a href="/login" class="word dengl">登录</a></li>
        </ul>
    </div>
    <div class="wrap2" id="lb">
        <ul>
            <li><a href="">不锈钢</a></li>
            <li><a href="">原料水泥</a></li>
            <li><a href="">塑料</a></li>
            <li><a href="">木制</a></li>
            <li><a href="">陶瓷</a></li>
        </ul>
        <div class="wA1">
            <a href="#" class="w2I">
                <img src="image/img101.png" alt="">
            </a>
            <a href="/proDetail" class="w2P1">
                <p>简约原木餐盘</p>
            </a>
            <p class="w2P2">￥300.00</p>
        </div>
        <div class="wA2">
            <a href="#" class="w2I">
                <img src="image/img102.png" alt="">
            </a>
            <a href="#" class="w2P1">
                <p>不锈钢时尚咖啡水壶</p>
            </a>
            <p class="w2P2">￥400.00</p>
        </div>
        <div class="wA3">
            <a href="#" class="w2I">
                <img src="image/img103.png" alt="">
            </a>
            <a href="#" class="w2P1">
                <p>经典系列红色时钟</p>
            </a>
            <p class="w2P2">￥580.00</p>
        </div>
    </div>
</div>
<div class="content">
    <form  action="/createOrder2.do">
        <hr/>
        <div class="order">
            <p>确认订单信息</p>
            <table>
                <tr>
                    <td class="info" colspan="2">商品信息</td>
                    <td class="price" align="right">单价</td>
                    <td class="num" align="right">商品数量</td>
                    <td class="total" align="right">金额</td>
                </tr>

                <c:forEach items="${order.orderItemVoList}" var="a">
                    <tr>
                        <td class="pict">
                            <img class="pic" src="upload/${a.productImage}">
                        </td>
                        <td class="inf">${a.productName}</td>
                        <td class="price" align="right">￥${a.currentUnitPrice}</td>
                        <td class="num" align="right">${a.quantity}</td>
                        <td class="total" align="right">￥${a.totalPrice}</td>

                    </tr>
                </c:forEach>


            </table>
        </div>
        <hr/>
        <div class="payWay">
            <div class="pay">
                支付方式：
                <input type="radio" value="支付宝" name="pa"> 支付宝
                <input type="radio" value="微信" name="pa"> 微信
            </div>
        </div>
        <div class="sub">
            <div class="to"><p>合计金额：<b>￥${order.productTotalPrice}</b></p></div>
            <div class="subm">
                <a href="/homepage">
                    <input type="submit" onclick="tj()" value="提交订单">
                </a>
            </div>
        </div>
    </form>
</div>


<%@ include file="foot.jsp" %>
<script>
    function tj() {
        var a=confirm("确认支付")
    }
</script>
</body>
</html>