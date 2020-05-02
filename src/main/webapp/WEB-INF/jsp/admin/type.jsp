<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>在线书城后台-类型管理</title>
    <link rel="stylesheet" href="css/public2.css">
    <style>
        .nav .nav1 .type{
            background-color: #F55D54;
            color: white;
        }
        .main{
            margin: 100px 10px 20px 20px;
            width: 80%;
            float: left;
        }
        .main .set>p{
            width: 100%;
            height: 80px;
            line-height: 80px;
            color: #706F6F;
            background-color: #E0E0E0;
            font-size: 20px;
            padding-left: 15px;
            font-weight: bold;
        }
        .main .set p a{
            margin-left: 15px;
            font-size: 18px;
            color: #F55D54;
            text-decoration:none;
            font-weight: normal;
        }
        .List{
            width: 100%;
            height: 670px;
            background-color: white;
            padding-left: 15px;
        }
        .main .set .List>table{
            width: 100%;
            padding: 0 15px;
        }
        .main .set .List table td{
            border-bottom: 1px solid #dddddd;
        }
        .main .set .List .num{
            height: 40px;
            line-height: 40px;
            width: 10%;
            text-align: center;
        }
        .main .set .List .name{
            width: 15%;
            text-align: center;
        }
        .main .set .List .operation{
            text-align: center;
        }
        .first{
            font-size: 18px;
            font-weight: bolder;

        }
        .main .set .List>p{
            font-size: 20px;
            text-align: left;
            line-height: 40px;
            height: 40px;
            font-weight: bolder;
        }
        .operation button{
            height: 30px;
            line-height: 30px;
            border: none;
            background-color: transparent;
            color:#F55D54 ;
            outline:none;
        }
        .operation .change{
            color: #259B24;
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
    <div class="set">
        <p>商城类型设置<a href="addcatePage.do">新增</a></p>
        <div class="List">
            <table>
                <tr>
                    <td class="num first" >序号</td>
                    <td class="name first" >类型名称</td>
                    <td class="operation first" >操作</td>
                </tr>
                <c:forEach items="${list}" var="ca">
                <tr>
                    <td class="num">${ca.id}</td>
                    <td class="name">${ca.name}</td>
                    <td class="operation">
                        <a href="dell_categoryManage.do?id=${ca.id}" >删除</a><br>
                        <a href="editcatePage.do?categoryId=${ca.id}&name=${ca.name}">修改</a>
                    </td>
                </tr>
                </c:forEach>

            </table>
        </div>
    </div>
</div>

</body>
</html>