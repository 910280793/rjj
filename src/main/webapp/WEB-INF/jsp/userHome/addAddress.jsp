<%@ page  language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>在线书城/支付页面</title>
    <link rel="stylesheet" href="css/public.css">
    <script src="layui/layui.js"></script>
    <link rel="stylesheet" href="layui/css/layui.css">
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
    <style>
        .nav .nav1 .comm{
            background-color: #F55D54;
            color: white;
        }
        .main{
            margin: 100px 10px 20px 20px;
            width: 80%;
            float: left;
        }
        .main .search>p{
            width: 100%;
            height: 80px;
            line-height: 80px;
            color: #706F6F;
            background-color: #E0E0E0;
            font-size: 20px;
            padding-left: 15px;
            font-weight: bold;

        }
        .main .search .search1{
            width: 100%;
            height: 100px;
            background-color: white;
            line-height: 100px;
            padding-left: 15px;
        }
        .main .search .search1>input{
            /*line-height: 100px;*/
            width: 200px;
            height: 30px;
            border-radius: 5px;
            border: 1px solid #E0E0E0;
            padding-left: 5px;
            outline: none;
        }
        .main .search .search1 .search2{
            float: right;
            padding-right: 15px;
        }
        .main .search .search1 .search2 label{
            font-weight: bold;
        }
        .main .search .search1 .search2 select{
            border: 1px solid #E0E0E0;
            border-radius: 5px;
            height: 30px;
            width: 100px;
            line-height: 30px;
            text-align: center;
            outline: none;
            /*appearance: none;*/
            /*-webkit-appearance: none;*/
            /*-moz-appearance: none;*/

        }
        /*.main .search .search1 .search2>select>option{*/
        /*color: black;*/
        /*height: 30px;*/
        /*line-height: 30px;*/
        /*}*/
        /*.main .search .search1 .search2 select:focus{*/
        /*border: 1px #E0E0E0 solid;*/
        /*!*box-shadow: 0 0 15px 1px #DDDDDD;*!*/
        /*}*/
        /*.main .search .search1 .search2 select option:hover{*/
        /*background: #E0E0E0;*/
        /*}*/
        .main .search .search1 .search2>button{
            width: 100px;
            height: 30px;
            line-height: 30px;
            border-radius: 5px;
            border: none;
            background-color: #F55D54;
            color: white;
            margin-left: 15px;
            outline:none;
            /*float: right;*/
            /*margin-top: 35px;*/
            /*margin-right: 50px;*/

        }
        .List{
            width: 100%;
            height: 555px;
            background-color: white;
            margin-top: 15px;
            padding-left: 15px;
        }
        .main .List>table{
            width: 100%;
            padding: 0 15px;
        }
        .main .List table td{
            border-bottom: 1px solid #dddddd;
        }
        .first{
            font-size: 18px;
            font-weight: bolder;

        }
        .main .List>p{
            font-size: 20px;
            text-align: left;
            line-height: 80px;
            height: 80px;
            background-color: #E0E0E0;
            margin-left: -15px;
            margin-bottom: 15px;
            padding-left: 15px;
            font-weight: bold;
            color: #706F6F;

        }
        .main .List p a{
            margin-left: 15px;
            font-size: 18px;
            color: #F55D54;
            text-decoration:none;
            font-weight: normal;
        }
        .num{
            width: 5%;
            text-align: center;
        }
        .name,.pic,.pict,.det,.numb,.price,.activity,.type{
            width: 10%;
            text-align: center;
            padding: 5px 0;
        }
        .price,.activity,.type{
            width: 5%;
            text-align: center;
            padding: 5px 0;
        }

        .main .List .state,.main .List .operation{
            height: 40px;
            width: 5%;
            text-align: center;
        }
        .operation button{
            min-height: 30px;
            line-height: 30px;
            border: none;
            background-color: transparent;
            color:#F55D54 ;
            outline:none;
        }
    </style>
</head>
<body>
<%@ include file="../head.jsp" %>

<div class="detail">
    <p>个人中心</p>


</div>
<div class="nav" style="">
    <div class="nav1">
        <ul>
            <p>个人中心</p>
            <li><a class="activity" href="/myMsgPage.do">我的信息</a></li>
            <li><a class="type" href="/shippinglist.do">收货地址</a></li>
            <p>订单管理</p>
            <li><a class="activity" href="/listOrder.do">购买订单</a></li>
            <li><a class="activity" href="/mySellProduct.do">已售商品</a></li>
            <p>商品管理</p>
            <li><a class="activity" href="/myProduct.do">我的商品</a></li>
        </ul>
    </div>
</div>

<div class="main">

    <div class="List">
        <form  action="/addAddress.do">

            <div class="address">
        <p>填写收货信息</p>

        <div class="city">

            姓名：<input type="text" id="na" name="receiverName">
        </div>
        <div class="phone">
            电话：<input type="tel" id="ph" name="receiverPhone">
        </div>
        <div class="city">
            省份：<input type="text" id="provinces" name="receiverProvince">&nbsp&nbsp&nbsp&nbsp
            城市：<input type="text" id="city" name="receiverCity">
        </div>
        <div class="addressDetail">
            详细地址：<br/><textarea id="address"  name="receiverAddress"></textarea>
        </div>
               <button type="submit" class="layui-btn layui-btn-normal">保存</button>
            </div>
        </form>
    </div>


</div>


<%@ include file="../foot.jsp" %>
<script>
    function tj() {
        var a=confirm("确认支付")
    }
</script>
</body>
</html>