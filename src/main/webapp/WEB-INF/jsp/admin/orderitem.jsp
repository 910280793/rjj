<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>在线书城后台-订单管理</title>
    <link rel="stylesheet" href="css/public2.css">
    <style>
        .nav .nav1 .order{
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
            line-height: 40px;
            height: 40px;
            font-weight: bolder;
        }
        .main .List .num,.main .List .phone,.main .List .address,.main .List .lis{
            height: 40px;
            width: 10%;
            text-align: center;
        }
        .main .List .address,.main .List .lis{
            padding: 0 2px;
        }
        .main .List .name{
            height: 40px;
            width: 8%;
            text-align: center;
        }
        .main .List .time,.main .List .paytime{
            height: 40px;
            width: 12%;
            text-align: center;
        }
        .main .List .price,.main .List .mprice{
            height: 40px;
            width: 6%;
            text-align: center;
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
    <div class="search">
        <p>搜索条件</p>
        <div class="search1">
            <input class="" type="number" placeholder="输入订单编号查询"/>
            <div class="search2">
                <label>状态</label>
                <select name="">
                    <option value="0">全部</option>
                    <option value="1">未付款</option>
                    <option value="2">已付款</option>
                    <option value="3">已发货</option>
                    <option value="4">已收货</option>
                </select>
                <button>搜索</button>
            </div>

        </div>

    </div>
    <div class="List">
        <p>订单信息</p>







        订单编号:${o.orderNo}  </br>
        姓名:${o.shippingVo.receiverName}  </br>
                 电话:${o.shippingVo.receiverPhone}</br>
                地址:${o.shippingVo.receiverProvince}${o.shippingVo.receiverCity}</br>
                详细地址:${o.shippingVo.receiverAddress} </br>

                 状态: ${o.statusDesc}</br>
        商品清单:</br>
                <c:forEach items="${o.orderItemVoList}" var="p">
                    商品id:${p.productId}</br>
                    商品名:${p.productName}</br>
                    价格:${p.currentUnitPrice}</br>
                    数量:${p.quantity}</br>
                    小计:${p.totalPrice}</br>
                </c:forEach>
        实付:￥${o.payment}</br>
        优惠:￥${o.payment}</br>
        创建事件:${o.createTime}</br>



    </div>
</div>
</body>
</html>