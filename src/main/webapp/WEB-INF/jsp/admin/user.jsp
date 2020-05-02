<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>在线书城后台-用户管理</title>
    <link rel="stylesheet" href="css/public2.css">
    <style>
        .nav .nav1 .users{
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
        .main .search .search1>button{
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
        .main .List .name{
            height: 40px;
            line-height: 40px;
            width: 20%;
            text-align: center;
        }
        .main .List .sex{
            width: 10%;
            text-align: center;
        }
        .main .List .phone{
            width: 20%;
            text-align: center;
        }
        .main .List .time{
            text-align: center;
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
                <input class="" type="tel" placeholder="输入手机号查询"/>
                <button>搜索</button>
            </div>

        </div>
        <div class="List">
            <p>用户列表</p>
            <table>
                <tr>
                    <td class="name first" >用户昵称</td>
                    <td class="sex first" >邮箱</td>
                    <td class="phone first" >手机号</td>
                    <td class="time first" >注册时间</td>
                </tr>
                <c:forEach items="${list}" var="u">


                <tr>
                    <td class="name">${u.username}</td>
                    <td class="email">${u.email}</td>
                    <td class="phone">${u.phone}</td>
                    <td class="time">${u.createTime}</td>
                </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</body>
</html>