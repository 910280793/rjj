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
<div class="header">
    <div class="wrap">
        <a class="logo"><img src="image/logo3.png" class="logoi"/> </a>
        <font>线上购物管理后台</font>
        <a href="/logoutManage.do" class="word">退出</a>
    </div>
</div>


<script src="jq1.11.1/jquery1.11.1.min.js"></script>

</body>
</html>