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
    <script src="layui/layui.js"></script>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script type="text/javascript"  language="javascript" src="js/jquery-1.11.3.min.js"></script>
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
          <div class="search">
              <p>搜索条件</p>
              <div class="search1">
                  <input class="" type="number" placeholder="输入订单编号查询"/>
                  <div class="search2">
                      <label>活动</label>
                      <select name="">
                          <option value="0">全部</option>
                          <option value="1">双十一</option>
                          <option value="2">双十二</option>
                          <option value="3">双旦</option>
                      </select>
                      <label>类别</label>
                      <select name="">
                          <option value="0">全部</option>
                          <option value="1">服装</option>
                          <option value="2">饰品</option>
                          <option value="3">数码</option>
                      </select>
                      <label>状态</label>
                      <select name="">
                          <option value="0">全部</option>
                          <option value="1">销售中</option>
                          <option value="2">已下架</option>
                      </select>
                      <button>搜索</button>
                  </div>

              </div>

          </div>
          <div class="List">
              <p>商品信息<a href="/userHomeaddproduct" >新增</a></p>
              <table id="productTable">
                  <thead>
                      <th class="name first" >订单编号</th>
                      <th class="name first" >商品名称</th>
                      <th class="pic first" >商品图片</th>
                      <th class="numb first" >购买数量</th>
                      <th class="price first" >总价</th>
                      <th class="state first" >状态</th>
                      <th class="det first" >收货地址</th>
                      <th class="det first" >收件人</th>
                      <th class="det first" >收件人电话</th>
                      <th class="operation first" >操作</th>
                  </thead>
                  <c:forEach items="${page.list}" var="p">

                      <tr>
                          <td class="name" >${p.orderNo}</td>
                          <td class="name" >${p.productName}</td>
                          <td class="pic" ><img  height="100px" width="100px" src="upload/${p.productImage}"></td>
                          <td class="det" >${p.quantity}</td>
                          <td class="numb" >
                              ￥${p.totalPrice}
                          </td>
                          <td class="name" >${p.status}</td>
                          <td class="name" >${p.shipping.receiverProvince}${p.shipping.receiverCity}${p.shipping.receiverAddress}</td>
                          <td class="name" >${p.shipping.receiverName}</td>
                          <td class="name" >${p.shipping.receiverPhone}</td>
                          <td class="operation" >
                              <c:if test="${p.status=='未发货'}">
                                  <button onclick="itemstatus('${p.id}')" class="layui-btn layui-btn-warm layui-btn-sm" >发货</button>
                              </c:if>
                          </td>
                      </tr>


                  </c:forEach>
                  <tr>
                      <div class="page-normal" id="pageTable" >
                          <a href="/myProduct.do?pageNum=${page.prePage}">&nbsp;&lt;&nbsp;</a>

                          <c:forEach  var="s"   begin="1" end="${page.pages}"  >
                              <a href='/myProduct.do?pageNum=${s}'>${s}</a>
                          </c:forEach>
                          <a href="/myProduct.do?pageNum=${page.nextPage}">&nbsp;&gt;&nbsp;</a>
                      </div>
                  </tr>
              </table>
          </div>


      </div>
      <%@ include file="foot.jsp" %>


<script>

    function itemstatus(id) {
        $.post("itemStatus.do", {"id": id}, function (data) {

            location.href="mySellProduct.do"

        }, "json")
    }
</script>

</body>
</html>