<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>在线书城/个人主页</title>
    <link rel="stylesheet" href="css/public.css">
    <link rel="stylesheet" href="css/public2.css">
    <style type="text/css">

        /*simple css reset*/
        *{
            margin:0px;
            padding:0px;
        }
        /*分页div面板样式*/
        .page-normal{
            color:#41B883;
            text-align:center;
        }
        /*所有分页页码的共同样式*/
        .page-normal a, .page-normal .page-current{
            border:1px solid #41B883;
            padding:5px 7px;
            text-decoration:none;
        }
        /*未选中的分页页码样式*/
        .page-normal a{
            color:#41B883;
        }
        /* 1. 选中的分页页码样式，即当前所在页面的页码
         * 2. 未选中的分页页码样式的鼠标滑过样式
         */
        .page-normal .page-current, .page-normal a:hover{
            color:#FFF;
            background-color:#41B883;
        }

    </style>
    <style type="text/css">
        body{
            background: #f2f2f2
        }
        .content{
            width: 100%;
            padding-top: 68px;
        }
        .content .detail{
            width: 80%;
            padding: 30px 40px;
            margin: auto;
            background-color: white;
            border-radius: 4px;
        }
        .content .detail>p{
            width: 320px;
            height: 24px;
            margin-bottom: 20px;
            color: rgb(51,51,51);
            font-size: 18px;
        }
        .content .detail table{
            width: 95%;
            margin:auto;
            border-collapse: collapse;
        }
        .detail tr{
            text-align: center;
            border:1px solid #ccc;
        }
        .detail .pic{
            width: 10%;
        }
        .detail .pic>img{
            padding: 5px 5px;
            width: 100%;
        }
        .detail .no{
            width: 10%;
            border:1px solid #ccc;
        }
        .detail .info{
            width: 15%;
            text-align: left;
        }
        .detail .price{
            width: 10%;
        }
        .detail .num{
            width: 10%;
        }
        .detail .total{
            width: 10%;
            border:1px solid #ccc;
        }
        .detail .state{
            width: 10%;
            border:1px solid #ccc;
        }
        .detail .address{
            width: 15%;
            border:1px solid #ccc;
            text-align: left;
            padding:0 5px;
        }
        .detail .time{
            width: 10%;
            border:1px solid #ccc;
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


<div style="float: left;width: 100%;height: 390px">
    <div class="d6">
        <div class="d61">
            <div class="d611">
                <a href=""><img src="image/logo3.png" style="height: 70px" alt=""></a>
                <p>在线书城原创生活类电商品牌，秉承一贯的严谨态度，我们深入世界各地，从源头全程严格把控商品生产环节，力求帮消费者甄选到最优质的商品，全线采用天然原材料，控制甲醛低量无害，采用进口工艺，国际生产线不断优化，食材保证核心原产地新鲜直供，让你享受品质生活</p>
            </div>
            <div class="d612">
                <ul class="ul61">
                    <li class="li61"><a href="">关于我们</a></li>
                    <li class="li62"><a href="">我的品牌</a></li>
                    <li class="li62"><a href="">公司动态</a></li>
                    <li class="li62"><a href="">经历发展</a></li>
                    <li class="li62"><a href="">商品推广</a></li>
                </ul>
                <ul class="ul62">
                    <li class="li61"><a href="">支付方式</a></li>
                    <li class="li62"><a href="">微信支付</a></li>
                    <li class="li62"><a href="">支付宝</a></li>
                    <li class="li62"><a href="">百度钱包</a></li>
                    <li class="li62"><a href="">货到付款</a></li>
                </ul>
                <ul class="ul63">
                    <li class="li61"><a href="">相关服务</a></li>
                    <li class="li62"><a href="">退货政策</a></li>
                    <li class="li62"><a href="">购物流程</a></li>
                    <li class="li62"><a href="">客服服务</a></li>
                    <li class="li62"><a href="">商务合作</a></li>
                </ul>
            </div>
            <div class="d613">
                <div class="weixin">
                    <img src="image/img72.png" alt="">
                    <p>微博公众号</p>
                </div>
                <div class="weibo">
                    <img src="image/img71.png" alt="">
                    <p>微信公众号</p>
                </div>
            </div>
        </div>
        <div class="d62">
            <div class="d621">
                <p class="p61">粤ICP备12043194号 © 2017youhaosuda.com</p>
                <p class="p62">
                    <img src="image/img81.png" alt="" title="微信支付">
                    <img src="image/img82.png" alt="" title="支付宝">
                    <img src="image/img83.png" alt="" title="百度钱包">
                    <img src="image/img84.png" alt="" title="财付通">
                    <img src="image/img85.png" alt="" title="快钱">
                    <img src="image/img86.png" alt="" title="货到付款">
                    <img src="image/img87.png" alt="" title="银行卡">
                </p>
                <div class="d622">
                    <ul>
                        <li>
                            <p class="p621">
                                <img src="image/img901.png" alt="" class="img61">
                                <img src="image/img90.png" alt="" class="img62">
                            </p>
                            <p class="p622">安全联盟<br>实名验证</p>
                        </li>
                        <li>
                            <p class="p621">
                                <img src="image/img891.png" alt="" class="img61">
                                <img src="image/img89.png" alt="" class="img62">
                            </p>
                            <p class="p622">工商网监<br>电子标识</p>
                        </li>
                        <li>
                            <p class="p621">
                                <img src="image/img881.png" alt="" class="img61">
                                <img src="image/img88.png" alt="" class="img62">
                            </p>
                            <p class="p622">可信联盟<br>身份验证</p>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="d7">
        <p>
            <span class="s71"><a href="#"><img src="image/img91.png" alt=""></a></span>
            <span class="s72">|</span>
            <span class="s73"><a href="#">由友好速搭提供技术与服务支持</a></span>
        </p>
    </div>
</div>
<script>
    function ostatus(id,a,b) {
       if(confirm("是否"+b)) {
           $.post("ostatus.do", {"orderNo": id, "status": a}, function (data) {
               alert(data.data)
               location.href="listOrder.do"

           }, "json")
       }else {

       }
    }

</script>

</body>
</html>