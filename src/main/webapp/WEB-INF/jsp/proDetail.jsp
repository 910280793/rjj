<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>在线书城/商品详情</title>
    <link rel="stylesheet" href="css/public.css">
    <link rel="stylesheet" href="css/magnifier.css">
    <style>
        .d1{
            width: 100%;
            height: 1301px;
            margin: 0 auto;
            background-color: rgb(242, 242, 242);
        }
        .d11{
            width: 1140px;
            height: 803px;
            margin: 68px 104.5px 60px;
            background-color: white;
        }
        .d111{
            width: 1080px;
            height: 41px;
            padding: 30px 30px 20px;
        }
        .p1{
            width: 1080px;
            height: 40px;
            border-bottom: 1px solid rgb(221, 221, 221)
        ;
        }
        .p1 a{
            text-decoration: none;
            color: black;
            font-size: 14px;
            line-height: 40px;
        }
        .p1 span{
            margin-right: 8px;
        }
        .s11{
            font-size: 14px;
            line-height: 40px;
            color: rgb(85, 85, 85);
        }
        .s12{
            font-size: 14px;
            line-height: 40px;
            color: rgb(85, 85, 85);
        }
        .d112{
            width: 1080px;
            height: 582px;
            padding: 10px 30px 0;
        }
        .d1121 .magnifier-assembly{
            margin-top: 27px;
            padding: 0;
        }
        .d1121 .img1 img{
            width: 453px;
            height: 453px;
        }
        .d1121 .small-img{
            width: 75px;
            height: 75px;
            border: none;
            margin: 0;
        }
        .d1121{
            width: 555px;
            height: 581px;
        }
        .d1121 .magnifier{
            margin-left: 0;
            margin-top: 0;
        }
        .d1121 .magnifier-container{
            border: none;
        }
        .d1122{
            width: 399.6px;
            height: 259px;
            margin: 0 54px 0 32.3px;
        }
        .d112>div{
            float: left;
        }
        .d1122 .p1{
            width: 399.6px;
            height: 22px;
            line-height: 22px;
            color: black;
            font-size: 18px;
            font-weight: bold;
            border: 0;
        }
        .d1122 .p2{
            width: 399.6px;
            height: 22px;
            margin-top: 9px;
            font-size: 14px;
            color: rgb(153, 153, 153);
            line-height: 22px;
        }
        .d1122 .p3{
            width: 399.6px;
            height: 20px;
            margin-top: 26px;
        }
        .d1122 .s1{
            width: 56px;
            height: 27px;
            font-size: 20px;
            color: rgb(219, 46, 46);
            font-weight: bold;
            line-height: 20px;
            margin-right: 14px;
        }
        .d1122 .s2{
            width: 64px;
            height: 20px;
            font-size: 14px;
            line-height: 14px;
            color: rgb(85, 85, 85);
        }
        .d1122 .p_{
            width: 399.6px;
            height: 5px;
            border-bottom: 1px solid rgb(221, 221, 221);
            margin-top: 14px;
        }
        .d1122 .p4{
            font-size: 14px;
            width: 399.6px;
            height: 14px;
            padding: 14px 0 4px 0;
            color: #555;
            line-height: 14px;
            margin-top: 5px;
        }
        .d1122 .p5{
            width: 399.6px;
            height: 28px;
            margin-top: 6px;
        }
        .d1122 .p5 .s31,.s33{
            width: 26px;
            height: 26px;
            border: 1px solid rgb(221, 221, 221);
            text-decoration: none;
            display: inline-block;
            text-align: center;
            margin: 0 auto;
            color: rgb(153,153,153);
            font-weight: bold;
        }
        .d1122 .p5 .s32{
            width: 42px;
            height: 26px;
            border: none;
            border-bottom: 1px solid rgb(221, 221, 221);
            border-top:1px solid rgb(221, 221, 221);
            margin: 0 -5px;
            text-align: center;
        }
        .d1122 .p5 .s4{
            width: 116px;
            height: 28px;
            font-size: 14px;
            line-height: 28px;
            color: #555;
        }
        .p6{
            width: 399.6px;
            height: 50px;
            margin-top: 20px;
        }
        .p6>a{
            display: block;
            width: 280px;
            height: 50px;
            text-align: center;
            color: white;
            font-size: 20px;
            background-color: rgb(199, 138, 73);
            line-height: 50px;
            text-decoration: none;
            border-radius: 5px;
        }
        .d113{
            width: 1080px;
            height:81px;
            margin: 40px 30px 0;
            border-top: 1px solid black;
        }
        .move-view{
            background: rgba(255,255,255,.5);
            border: 1px solid #bbbbbb;
        }
        .magnifier-view{
            border: 1px solid #bbbbbb;
        }
    </style>
</head>
<body>
    <div class="navigation">
        <div class="wrap">
            <a href="#" class="logo"><img src="image/logo.png" alt="" class="logoi"></a>
            <ul class="ul-bar-left">
                <li><a href="" class="word chakan" id="chak">查看所有类别</a></li>
                <li><a href="/index" class="word">首页</a></li>
                <li><a href="/allList" class="word">所有产品</a></li>
                <li><a href="/listOrder.do" class="word">个人主页</a> </li>
            </ul>
            <c:if test="${not empty currentUser}">
                <ul class="ul-bar-right">
                    <li class="word a0" id="gwc"></li>
                    <li class="img2"><a href="/cart.do"> <img src="image/0.png" alt=""></a></li>
                    <li><a href="/logout.do" class="word dengl">登出</a></li>
                    <li class="word ash">|</li>

                    <li><a href="/homepage.do" class="word zhuc">你好:${currentUser.username}</a></li>
                </ul>
            </c:if>


            <c:if test="${empty currentUser}">
                <ul class="ul-bar-right">
                    <li class="word a0" id="gwc"></li>
                    <li class="img2"><a href="/cart.do"> <img src="image/0.png" alt=""></a></li>
                    <li><a href="/register" class="word zhuc">注册</a></li>
                    <li class="word ash">|</li>
                    <li><a href="/login" class="word dengl">登录</a></li>
                </ul>
            </c:if>
        </div>
        <div class="wrap2" id="lb">
            <ul id="lb2">

            </ul>
            <div class="wA1">
                <a href="#" class="w2I">
                    <img src="image/img101.png" alt="">
                </a>
                <a href="/proDetail" class="w2P1">
                    <p>简约原木餐盘</p>
                </a>
                <p class="w2P2">￥300.00</p>
            </div>
            <div class="wA2">
                <a href="#" class="w2I">
                    <img src="image/img102.png" alt="">
                </a>
                <a href="#" class="w2P1">
                    <p>不锈钢时尚咖啡水壶</p>
                </a>
                <p class="w2P2">￥400.00</p>
            </div>
            <div class="wA3">
                <a href="#" class="w2I">
                    <img src="image/img103.png" alt="">
                </a>
                <a href="#" class="w2P1">
                    <p>经典系列红色时钟</p>
                </a>
                <p class="w2P2">￥580.00</p>
            </div>
        </div>
    </div>
    <div class="d1">
        <div class="d11">
            <div class="d111">
                <p class="p1">
                    <span><a href="/index">首页</a></span>
                    <span class="s11"> ></span>
                    <span><a href="/allList">所有商品</a></span>
                    <span class="s11"> ></span>
                    <span class="s12">${productDetailVo.name}</span>
                </p>
            </div>
            <div class="d112">
                <div class="d1121">
                    <div class="magnifier" id="magnifier1">
                        <div class="magnifier-container">
                            <div class="images-cover"></div>
                            <!--当前图片显示容器-->
                            <div class="move-view"></div>
                            <!--跟随鼠标移动的盒子-->
                        </div>
                        <div class="magnifier-assembly">
                            <div class="magnifier-line">
                                <ul class="clearfix animation03">
                                    ${productDetailVo.subtitle}
                                </ul>
                            </div>
                            <!--缩略图-->
                        </div>
                        <div class="magnifier-view"></div>
                        <!--经过放大的图片显示容器-->
                    </div>
                </div>
                <div class="d1122">
                    <p class="p1">${productDetailVo.name}</p>
                    <p class="p2">${productDetailVo.detail}</p>
                    <p class="p3">
                        <span class="s1">￥${productDetailVo.price}</span>
                    </p>
                    <p class="p_"></p>
                    <p class="p4">选择数量</p>
                    <p class="p5">
                        <span class="s3">
                            <a href="javascript:void(0)" class="s31" id="s31">-</a>
                            <input type="text" class="s32" value="1" id="s32">
                            <a href="javascript:void(0)" class="s33" id="s33">+</a>
                        </span>
                        <span class="s4">件（库存${productDetailVo.stock}件）</span>
                    </p>
                    <p class="p6">
                        <a href="javascript:void(0)" onclick="jr()">加入购物车</a>
                    </p>
                </div>
            </div>
            <div class="d113"></div>
        </div>
        <%@ include file="foot.jsp" %>
    </div>
    <script src="js/leibie.js"></script>
    <script src="js/num.js"></script>
    <script src="jq1.11.1/jquery1.11.1.min.js"></script>
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="js/magnifier.js"></script>
    <script>
        $(function() {

            var magnifierConfig = {
                magnifier : "#magnifier1",//最外层的大容器
                width : 453,//承载容器宽
                height : 453,//承载容器高
                moveWidth : 300//如果设置了移动盒子的宽度，则不计算缩放比例

                //zoom : 1.3//缩放比例
            };

            var _magnifier = magnifier(magnifierConfig);

            /*magnifier的内置函数调用*/

             //设置magnifier函数的index属性
             //_magnifier.setIndex(0);

             //重新载入主图,根据magnifier函数的index属性
             //_magnifier.eqImg();
        });
    </script>
    <script type="text/javascript">
        $(function ajaxCategory() {
            $.post("getCategoryList.do",function(data){

                $.each(data.data,function(i,obj){
                    var li=" <li><a href='byCidList?&currentPage=1&cid="+obj.id+"'>"+obj.name+"</a></li> "
                    /*
                                        var li="<li><a href='productServlet?method=productPage&currentPage=1&uid="+obj.id+"'>"+obj.name+"</a></li>";
                    */
                    $("#lb2").append(li);


                });

            },"json")
            $.post("cartCount.do",{"id":"${currentUser.id}"},function(data){


                document.getElementById("gwc").innerHTML=data.data

            },"json")

        });

    </script>
<script>
    function jr() {
        var c=$("#s32").val();
        if(confirm("添加成功是否跳转购物车")){
            location.href='/addCart.do?count='+c+'&productId='+${productDetailVo.id}
        }else {

                $.post("addCart2.do",{"productId":"${productDetailVo.id}","count":c},function(data){



                },"json")
        }

    }
</script>
</body>
</html>