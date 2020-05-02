<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>在线书城/个人主页</title>
    <link rel="stylesheet" href="css/public.css">
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
    <script src="layui/layui.js"></script>
    <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
      <%@ include file="head.jsp" %>
    <div class="content">
        <div class="detail">
           <p>我的订单</p>
            <table>

                <tr>
                    <td class="no">订单编号</td>
                    <td colspan="2" class="infop">商品信息</td>
                    <td class="price">单价</td>
                    <td class="num">数量</td>
                    <td class="state">商品状态</td>
                    <td class="total">总金额</td>
                    <td class="state">状态</td>
                    <td class="state">操作</td>
                    <td class="address">收货信息</td>
                    <td class="time">下单时间</td>
                </tr>
                <c:forEach items="${page.list}" var="o">
                    <tr>
                        <td class="no" rowspan="${fn:length(o.orderItemVoList)}">${o.orderNo}</td>

                        <td class="pic">
                            <img src="upload/${o.orderItemVoList[0].productImage}"/>
                        </td>
                        <td class="info">${o.orderItemVoList[0].productName}</td>
                        <td class="price">￥${o.orderItemVoList[0].currentUnitPrice}</td>
                        <td class="num">*${o.orderItemVoList[0].quantity}</td>
                        <td class="num">*${o.orderItemVoList[0].status}</td>
                        <td class="total" rowspan="${fn:length(o.orderItemVoList)}">￥${o.payment}</td>
                        <td class="state" rowspan="${fn:length(o.orderItemVoList)}">${o.statusDesc}</td>
                        <td rowspan="${fn:length(o.orderItemVoList)}">

                            <c:if test="${o.status==10}">
                                <button onclick="ostatus('${o.orderNo}',20,'支付')" class="layui-btn layui-btn-normal layui-btn-sm" value="支付">立即支付</button>
                             </c:if>
                   <%--         <c:if test="${o.status==20}">
                                <a>待发货</a>
                            </c:if>
                            <c:if test="${o.status==40}">
                                <input type="button" onclick="ostatus('${o.orderNo}',50,'确认收货')" value="确认收货">
                            </c:if>--%>

                        </td>
                        <td class="address" rowspan="${fn:length(o.orderItemVoList)}">
                            收货人：<span>${o.shippingVo.receiverName}</span><br>
                            电话：<span>${o.shippingVo.receiverPhone}</span><br>
                            收货地址：<span>${o.shippingVo.receiverAddress}</span>
                        </td>
                        <td class="time" rowspan="${fn:length(o.orderItemVoList)}">${o.createTime}</td>

                    </tr>
                    <c:forEach begin="1" items="${o.orderItemVoList}" var="p">
                        <tr>
                        <td class="pic">
                            <img src="upload/${p.productImage}"/>
                        </td>
                        <td class="info">${p.productName}</td>
                        <td class="price">￥${p.currentUnitPrice}</td>
                        <td class="num">*${p.quantity}</td>
                            <td class="num">*${p.status}</td>
                        </tr>
                    </c:forEach>

                </c:forEach>

            </table>

        </div>
        <div class="page-normal" >
            <a href="/listOrder.do?pageNum=${page.prePage}">&nbsp;&lt;&nbsp;</a>

            <c:forEach  var="s"   begin="1" end="${page.pages}"  >
                <a href='/listOrder.do?pageNum=${s}'>${s}</a>
            </c:forEach>
            <a href="/listOrder.do?pageNum=${page.nextPage}">&nbsp;&gt;&nbsp;</a>
        </div>

    </div>

      <%@ include file="foot.jsp" %>
<script>
    function ostatus(id,a,b) {
      location.href="payPage?orderNo="+id;
    }

</script>

</body>
</html>