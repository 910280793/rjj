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
<body onload="init()">
<%@ include file="head.jsp" %>
    <div class="content">
        <hr/>
        <div class="order" style="text-align: center">
            <p>扫码支付</p>
           <img src="zfImage/${map.name}.png" id="sm">
        </div>
        <hr/>
        <div class="payWay">
            <div class="pay" style="text-align: center">
                <p id="zfMsg" >若支付成功请等待几秒</p>
            </div>
        </div>
        <div class="sub" style="text-align: center">
            <div class="to"><p>合计金额：<b>￥${map.total}</b></p></div>
            <div class="subm">
            </div>
        </div>
    <input id="orderNo" value="${map.orderNo}" hidden="hidden">
    </div>

<%@ include file="foot.jsp" %>
    <script src="jq1.11.1/jquery1.11.1.min.js"></script>
    <script type="text/javascript">
        function init(){
            window.setInterval("queryPay()",6000);
        }
        function queryPay() {

            var orderNo=$("#orderNo").val();
          $.post("queryPay.do",{"orderNo":orderNo},function(data){
                if(data.status=="0"){
                    $("#zfMsg").text("支付成功等待页面跳转..............")
                    $("#zfMsg").css({"color":"red"});
                    $("#zfMsg").css({"font-size":"20px" });
                    setInterval("rePage()",4000);
                }
            },"json")

        }
        function rePage() {
            location.href="myProduct.do"
        }
    </script>
</body>

</html>