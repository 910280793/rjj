<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>在线书城后台-订单管理</title>
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
        <table>
            <tr>
                <td class="num first" >订单编号</td>
                <td class="name first" >收件人</td>
                <td class="phone first" >联系方式</td>
                <td class="address first" ></td>
                <td class="lis first" ></td>
                <td class="price first" >合计金额</td>
                <td class="mprice first" >实付金额</td>
                <td class="time first" >建立时间</td>
                <td class="state first" >状态</td>
                <td class="operation first" >修改状态</td>
                <td class="operation first" >操作</td>
            </tr>
            <c:forEach items="${page.list}" var="o">



                <tr>
                    <td class="num" >${o.orderNo}</td>
                    <td class="name" >${o.shippingVo.receiverName}</td>
                    <td class="phone" >${o.shippingVo.receiverPhone}</td>
                    <td class="address" >${o.shippingVo.receiverProvince}${o.shippingVo.receiverCity}</td>
                    <td class="lis" >${o.shippingVo.receiverAddress} </td>
                    <td class="price" >￥${o.payment}</td>
                    <td class="mprice" >￥${o.payment}</td>
                    <td class="time" >${o.createTime}</td>
                    <td class="state" >${o.statusDesc}</td>
                    <td>
                        <select class="oderZt">

                            <option name="status" value="${o.status}">${o.statusDesc}</option>
                            <option name="status" value="0">取消</option>
                            <option name="status" value="10">未付款</option>
                            <option name="status" value="20">已付款</option>
                            <option name="status" value="40">已发货</option>
                            <option name="status" value="50">已收货</option>
                        </select>
                        <input type="button" value="确定" onclick="ostatus('${o.orderNo}')">

                    </td>
                    <td class="operation" >
                        <a href="/detailOrderManage.do?orderNo=${o.orderNo}">详情</a>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <div class="page-normal" >
                    <a href="/listOrderManage.do?pageNum=${page.prePage}">&nbsp;&lt;&nbsp;</a>

                    <c:forEach  var="s"   begin="1" end="${page.pages}"  >
                        <a href='/listOrderManage.do?pageNum=${s}'>${s}</a>
                    </c:forEach>
                    <a href="/listOrderManage.do?pageNum=${page.nextPage}">&nbsp;&gt;&nbsp;</a>
                </div>
            </tr>
        </table>
    </div>
</div>
<script src="jq1.11.1/jquery1.11.1.min.js"></script>
<script>
    function ostatus(id) {
        var t=event.target

        var t1= t.previousElementSibling;
        var index=t1.selectedIndex
        var v= t1.options[index].value;
        var b=t1.options[index].text;
        if(confirm("是否"+b)) {
            $.post("ostatus.do", {"orderNo": id, "status": v}, function (data) {
                alert(data.data)
                location.href="listOrderManage.do"

            }, "json")
        }else {

        }
    }


</script>
</body>
</html>