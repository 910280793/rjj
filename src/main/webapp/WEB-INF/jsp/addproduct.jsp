<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>在线书城后台-订单管理</title>
    <link rel="stylesheet" href="css/public.css">
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
<div class="header">
    <div class="wrap">
        <a class="logo"><img src="image/logo.png" class="logoi"/> </a>
        <font>线上购物管理后台</font>
        <a href="/logoutManage.do" class="word">退出</a>
    </div>
</div>
<div class="nav">
    <div class="nav1">
        <ul>
            <p>管理</p>
            <li><a class="users" href="user.html">用户管理</a></li>
            <li><a class="activity" href="getAllact">活动管理</a></li>
            <li><a class="type" href="type.html">类型管理</a></li>
            <li><a class="comm" href="commodity.html">商品管理</a></li>
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
        <p>商品信息<a href="#">新增</a></p>
        <form action="/manage/product/uploadProduct.do" method="post" enctype="multipart/form-data">
         商品名称:<input type="text" name="name">
            <br />
            商品类别:     <select id="fl" name="categoryId">

                          </select>
            <br />
            商品库存:<input type="text" name="stock">
            <br />
            商品价格:<input type="text" name="price">
            <br />
            商品主图:<input type="file" name="multiUploadFiles[0]">
            <br />
            商品副图:<input type="file" name="multiUploadFiles[1]">
            <br />
            商品描述:<input type="text" name="detail">
            <br />
            上下架:<input name="status" type="radio" value="1" >上架</input>
        <br />
        <input name="status" type="radio" value="0" >下架</input>
            </br>
        <input type="submit" class="layui-btn" value="添加商品"/>
        </form>
    </div>
</div>
<script type="text/javascript"  language="javascript" src="js/jquery-1.11.3.min.js"></script>
<script>
    $(function ajaxCategory() {
        $.post("getCategoryList.do",function(data){

            $.each(data.data,function(i,obj){
                var s="<option name='categoryId' value='"+obj.id+"'>"+obj.name+"</option>"
                /*
                                    var li="<li><a href='productServlet?method=productPage&currentPage=1&uid="+obj.id+"'>"+obj.name+"</a></li>";
                */
                $("#fl").append(s);


            });

        },"json")

    });

</script>
</body>
</html>