<%@ page  language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>在线书城/购物车</title>
    <link rel="stylesheet" href="css/public.css">
    <style>
        body{
            background: #f2f2f2
        }
        .sd{
            width: 100%;
            padding-top: 68px;

        }
        .swrap{
            margin: 0 114.5px;
        }
        .pd{
            width: 100%;
            height: 54px;
            padding-top: 40px;
        }
        .pd>p{
            font-size: 30px;
            color: rgb(51,51,51);
            font-weight: 400;
            margin-bottom: 6px;
        }
        .dtrolley{
            border: 1px solid rgb(221,221,221);
            border-bottom: none;
            border-radius: 3px;
            margin-bottom: 120px;
            padding: 16px 30px;
        }
        .dhead{
            height: 22px;
            padding: 16px 30px;
            background: white;
            border-bottom: 1px solid rgb(221,221,221);
            border-radius: 3px;
            font-size: 12px;
            line-height: 22px;
            color: rgb(102,102,102);
        }
        .ch{
            height: 16px;
            width: 16px;
            vertical-align: middle;
        }
        .dhead .ch{
            margin-top: -2px;
            margin-right: 9px;
        }
        .dhead>span{
            height: 18px;
            display: inline-block;
            padding-top: 2px;
        }
		.shopList>ul>li{
            padding:0 30px;
			background-color: white;
		}
        .dhs2{
            width: 65px;
        }
        .dhs3{
            width: 544px;
        }
        .dhs4{
            width: 96.8px;
        }
        .dhs5{
            width: 121px;
        }
        .dhs6{
            width: 109px;
        }
        .dhs7{
            width: 56px;
        }
        .dtb>ul>li{
            padding: 0 0;
            height: 101px;
            margin-top: 10px;
            border-bottom: 1px solid rgb(221,221,221);
            position: relative;
        }
        .dtb>ul>li>div>span{
            float: left;
            font-size: 12px;
            color: rgb(102,102,102);
        }
        .dtb>ul>li>div{
            height: 100px;
            padding: 0 30px;
            border-top: 1px solid rgb(221,221,221);
            background: white;
        }
        .dtb>ul>li img{
            width: 60px;
            height: 60px;
        }
        .dtb>ul .ch{
            margin-top:43px
        }
        .dtb>ul .dhs2{
            width: 60px;
            height: 60px;
            margin: 20px 0 20px 16px;
            line-height: 99px;
        }
        .dtb>ul .dhs3{
            width: 290px;
            height: 18px;
            padding: 20px 38px 20px 12px;
        }
        .dtb>ul .dhs3>a{
            color: rgb(51,51,51);
            text-decoration: none;
        }
        .dtb>ul .dhs4{
            margin-left: 205px;
            margin-top: 23px;
            width: 100px;
            height: 18px;
            padding: 20px 0;
        }
        .dtb>ul .dhs5{
            width: 78px;
            height: 26px;
            border: 1px solid rgb(221,221,221);
            border-radius: 2px;
            text-align: center;
            margin-left: 0;
            margin-top: 34px;
        }
        .dtb>ul .dhs5 input{
            width: 38px;
            height: 24px;
            font-size: 12px;
            border: none;
            text-align: center;
            margin-top: 1px;
        }
        .dtb>ul .dhs6{
            width: 116px;
            height: 18px;
            margin-top: 23px;
            padding: 20px 0;
            margin-left: 47px;
        }
        .dtb>ul .dhs7{
            width: 24px;
            height: 18px;
            padding: 20px 0;
            margin-top: 23px;
            margin-left: 2px;
        }
        .dtb>ul .dhs7>a{
            text-decoration: none;
            color: #666;
            font-size: 12px;
        }
        .dtb>ul .add,.sub{
            text-decoration: none;
            font-size: 14px;
            font-weight:bold;
            color: rgb(102,102,102);
        }
        .dtb>p{
            width: 1118px;
            height: 101px;
            margin-top: 10px;
            border-bottom: 1px solid rgb(221,221,221);
            position: relative;
        }
        .shopAll{
            /*width: 1058px;*/
            height: 48px;
            padding: 20px 30px;
            margin-top: 10px;
            border-top: 1px solid rgb(221,221,221);
            border-bottom: 1px solid rgb(221,221,221);
            background: white;
            position: relative;
        }
        .shopAll>div{
            width: 1058px;
            height: 48px;
        }
        .shopAll>div>span{
            font-size: 12px;
            color: rgb(102,102,102);
            display: inline-block;
            height: 48px;
            line-height: 48px;
        }
        .shopAll>div>span:nth-child(2){
            margin-left:5px;
        }
        .shopAll>div>span:nth-child(3){
            margin-left:31px;
        }
        .shopAll>div>span:nth-child(4){
            margin-left:29px;
        }
        .shopAll>div>div{
            width: 280px;
            height:59px;
            margin-top:0;
            margin-left: 200px;
            display: inline-block;
            font-size: 12px;
            position: absolute;
            top:28px;
            left:396px;
        }
        .shopAll>div>div>span:first-child{
            font-size: 16px;
            color: rgb(255, 68, 68);
            font-weight: 700;
        }
        .shopAll>div>div>span:nth-child(3){
            font-size: 24px;
            display: inline-block;
            line-height: 18px;
            color: rgb(255, 68, 68);
            font-weight: 700;
        }
        .shopAll>div>div>span:nth-child(4){
            display: block;
            margin-left: 194px;
            color:#666;
        }
        .shopAll>div>div>span:nth-child(4)>span{
            font-size: 14px;
        }
        .shopAll>div>a{
            display: inline-block;
            position: absolute;
            right:30px;
            text-align: center;
            text-decoration: none;
            width: 72px;
            height: 46px;
            border: 1px solid white;
            border-radius: 3px;
            background: rgb(255, 68, 68);
            font-size: 18px;
            line-height: 46px;
            padding: 0 60px;
            color: white;
        }
    </style>
</head>
<body>
<%@ include file="head.jsp" %>
    <div class="sd">
        <div class="swrap">
            <div class="pd">
                <p>购物车</p>
            </div>
            <div class="dtrolley">
                <div class="dhead">
                    <span><input type="checkbox" class="ch"></span>
                    <span class="dhs2">全选</span>
                    <span class="dhs3">商品名称</span>
                    <span class="dhs4">单价</span>
                    <span class="dhs5">数量</span>
                    <span class="dhs6">小计</span>
                    <span class="dhs7">操作</span>
                </div>
                <div class="dtb">
                    <ul class="shopList">
                    <c:forEach items="${cart.cartProductVoList}" var="a" >

                        <li>
                            <div>
                                <span><input type="checkbox" class="ch" index="0"> <input type="text" class="id2" value="${a.productId}" hidden="hidden" ></span>
                                <span class="dhs2"><img src="upload/${a.productMainImage}" alt=""></span>
                                <span class="dhs3"><a href="#">${a.productName}</a></span>
                                <span class="dhs4">￥${a.productPrice}</span>
                                <span class="dhs5">
                                    <a href="javascript:void(0)" class="sub">-</a>
                                    <input type="text" class="num" value="${a.quantity}">
                                    <a href="javascript:void(0)" class="add">+</a>
                                    <input type="text" class="id" value="${a.productId}" hidden="hidden" >
                                </span>
                                <span class="dhs6">￥${a.productTotalPrice}</span>
                                <span class="dhs7"><a href="delete_productCart.do?productIds=${a.productId}" class="del">删除</a></span>
                            </div>
                        </li>
                    </c:forEach>

                    </ul>
                    <div class="shopAll">
                        <div>
                            <span><input type="checkbox" class="ch"></span>
                            <span>全选</span>
                          <%--  <span>删除</span>
                            <span>清除下架商品</span>--%>
                            <div>
                                已选商品
                                <span class="allNum">0</span>
                                件
                                <span>合计（不含运费）：</span>
                                <span class="allSum">￥0</span>
                                <span>已优惠：<span>￥0</span></span>
                            </div>
                            <a href="/get_order_cart_product.do">确认结算</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%@ include file="foot.jsp" %>
    <script src="js/leibie.js"></script>
    <script src="jq1.11.1/jquery1.11.1.min.js"></script>
    <script>
        var price = null;
        var pcs = 0;
        var sum =0;

        function get_val(a) {    //获取所需值的函数
            price = a.parent().siblings('.dhs4')[0].innerText;          //获取单价
            price = Number(price.replace('￥',''));
            pcs = a[0].value;                 //获取数量
            if(isNaN(pcs)){                                         //判断如果数量里的值不是一个有效数字就替换
                pcs = Number(pcs.replace(/[^0-9]/g,''));
            }
            if(pcs<=0){
                pcs = 1;
            }
        }
        function get_sum(a) {   //获取一个Li中的总价格
            a.parent().siblings('.dhs6')[0].innerText = '￥'+(price*pcs);
        }

        $('.shopList .num').blur(function () {        //input的blur事件
            get_val($(this));
            var id=$(this).siblings('.id').val()
            get_sum($(this));
            this.value = pcs;
            console.log(id)
            console.log(pcs)
            $.post("updateCart.do",{"count":pcs,"productId":id},function(data){
                console.log(data)

            },"json")
            allNum = 0;
            numAll();
            allSum = 0;
            sumAll()
           // location.href="/cart.do"
        });

        $('.shopList .add').click(function () {
            //+事件
            get_val($(this).siblings('.num'));
            var id=$(this).siblings('.id').val()
            var c=parseInt($(this).siblings('.num').val())+1
            console.log(id)
            console.log(c)
            $.post("updateCart.do",{"count":c,"productId":id},function(data){
                console.log(data)

            },"json")
            pcs++;
            $(this).siblings('.num')[0].value = pcs;
            get_sum($(this).siblings('.num'));
            allNum = 0;
            numAll();
            allSum = 0;
            sumAll()
          //  location.href="/cart.do"
        });

        $('.shopList .sub').click(function () {

            var id=$(this).siblings('.id').val()
            var c=$(this).siblings('.num').val()-1
            console.log(id)
            console.log(c)
            $.post("updateCart.do",{"count":c,"productId":id},function(data){
                console.log(data)

            },"json")
            get_val($(this).siblings('.num'));
            pcs--;
            if(pcs<1){
                pcs = 1;
            }
            $(this).siblings('.num')[0].value = pcs;
            get_sum($(this).siblings('.num'));
            allNum = 0;
            numAll();
            allSum = 0;
            sumAll()
            //location.href="/cart.do"
        });

        var i = 0;
        document.onscroll = function () {         //计算距离让总计fixed
            i = $('.shopList').children().last().offset().top-$(document).scrollTop();
            if(i>300){
                $('.shopAll').css({
                    position:'fixed',
                    bottom:0,
                    borderLeft:'1px solid rgb(221,221,221)',
                    borderRight:'1px solid rgb(221,221,221)'
                });
            }else{
                $('.shopAll').css({
                    position:'',
                    bottom:'',
                    borderLeft:'',
                    borderRight:''
                });
            }
        };

        var allNum = 0;
        var j = 0;
        function numAll(a) {          //设置总个数
            $('.shopList .num').each(function (index) {
                if($(this).parent().siblings('span').eq(0).children('.ch').prop('checked')===false){

                }else{
                    j = Number(this.value);
                    allNum += j;
                }
            });
            $('.shopAll .allNum')[0].innerText = allNum;
        }
        numAll();

        var allSum = 0;
        var k = 0;
        function sumAll() {

            $('.shopList .dhs6').each(function (index) {
                if($(this).siblings('span').eq(0).children('.ch').prop('checked')===false){

                }else{
                    var b=this.innerText
                    var k=b.substring(1)


                    allSum += parseFloat(k);
                }
            });

            var v=allSum.toString()

            $('.shopAll .allSum')[0].innerText = '￥'+v;
        }
        sumAll();

        $('.shopList .ch').change(function () {
            debugger
            allNum = 0;
            numAll();
            allSum = 0;
            sumAll();
            var id=$(this).parent().children(".id2").val()
            console.log(id)
            if($(this).prop('checked')===true){
                $.post("selectCart.do",{"productId":id},function(data){
                    console.log(data)

                },"json")
                $(this).attr('index',1)
            }else{
                $.post("un_selectCart.do",{"productId":id},function(data){
                    console.log(data)

                },"json")
                $(this).attr('index',0)
            }
            var index = 0;
            $('.shopList .ch').each(function () {
                index += Number($(this).attr('index'));
            });
            if(index === $('.shopList').children().length){
                $('.shopAll .ch').prop('checked','checked');
                $('.dhead .ch').prop('checked','checked');
            }else{
                $('.shopAll .ch').prop('checked','');
                $('.dhead .ch').prop('checked','');
            }
        });

        $('.dhead .ch').change(function () {

            if($(this).prop('checked')===true){

                $('.shopList .ch').each(function () {
                    $(this).prop('checked','checked');
                });
                $('.shopAll .ch').prop('checked','checked');
                $.post("select_allCart.do",function(data){
                    console.log(data)

                },"json")

            }else{
                $('.shopList .ch').each(function () {
                    $(this).prop('checked','');
                });
                $('.shopAll .ch').prop('checked','');
                $.post("un_select_allCart.do",function(data){
                    console.log(data)

                },"json")
            }
            allNum = 0;
            numAll();
            allSum = 0;
            sumAll();
        });

        $('.shopAll .ch').change(function () {
            debugger
            if($(this).prop('checked')===true){
                $('.shopList .ch').each(function () {
                    $(this).prop('checked','checked');
                });
                $('.dhead .ch').prop('checked','checked');

            }else{
                $('.shopList .ch').each(function () {
                    $(this).prop('checked','');
                });
                $('.dhead .ch').prop('checked','');
            }
            allNum = 0;
            numAll();
            allSum = 0;
            sumAll();
        })

    </script>
</body>
</html>















