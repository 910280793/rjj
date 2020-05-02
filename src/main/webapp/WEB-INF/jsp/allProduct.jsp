<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>在线书城</title>
    <link rel="stylesheet" href="css/public.css">
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
    <style>
        body{
            overflow-x: hidden;
        }
        .hb{
            margin-top: 68px;
            position: relative;
            overflow: hidden;
        }
        .hb>a{
            width: 100%;
            position: absolute;
            top:0;
            left:0;
        }
        .hb img{
            width: 100%;
            height: auto;
        }
        .hb>ul{
            position: absolute;
            top:85%;
            left:45.5%;
            z-index: 4;
        }
        .hb>ul>li{
            float: left;
            margin: 0 10px;
            width: 25px;
            height: 5px;
            background: white;
            display:block;
        }
        .hb>ul>li:first-child{
            width: 25px;
            background: #c78a49;
        }
        .clear:after{
            content:'';
            display:block;
            clear:both;
        }
        .clear{
            *zoom:1;
        }
        .d1{
            width: 100%;
            height: 496px;
            padding-top: 50px;
        }
        .p1 a{
            display: block;
            font-size: 24px;
            text-decoration: none;
            color: black;
            font-weight: bold;
            width: 100%;
            height:31px;
            text-align: center;
            line-height: 31px;
        }
        .p2{
            font-size: 14px;
            color: rgb(153,153,153);
            line-height: 35px;
            text-align: center;
        }
        .d11{
            width: 200%;
            height: 496px;
            margin: 0 auto;
            position: relative;
        }
        .d11>a{
            text-decoration: none;
            width: 20px;
            height: 30px;
            position: absolute;
            font-size: 30px;
            line-height: 40px;
            color: rgb(200,200,200);
        }
        .d11>.zo{
            display: block;
            top:25%;
            left: 50px;
        }
        .d11>a>span:hover{
            color:rgb(153,153,153);
        }
        .d11>.yo{
            display: block;
            top:25%;
            left: 1280px;
        }
        .d11>div{
            width: 1140px;
            height: 365px;
            margin-top: 0;
            margin-left: 104.5px;
            overflow: hidden;
        }
        .d11 ul li{
            float: left;
            width: 285px;
            height: 365px;
            margin: 0 ;
            text-align: center;
        }
        .d11 ul li img{
            width: 275px;
            height: 275px;
        }
        .d11 ul .p11 a{
            font-size: 14px;
            text-decoration: none;
            font-weight: bold;
            color: rgb(51,51,51);
            line-height: 20px;
        }
        .d11 ul .p11{
            margin-top: 21px;
            margin-bottom: 4px;
        }
        .d11 ul .p12 a{
            text-decoration: none;
            color: rgb(219, 46, 46);
            font-size: 14px;
            line-height: 20px;
        }
        .a21 img{
            width: 680px;
            height: 380px;
        }
        .a22 img{
            width: 450px;
            height: 185px;
        }
        .a23 img{
            width: 450px;
            height: 185px;
        }
        .d21>a{
            float: left;
            overflow: hidden;
        }
        .a21{
            width: 680px;
            height: 380px;
        }
        .a22{
            width: 450px;
            height: 185px;
            position: absolute;
            top:0;
            right: 0;
        }
        .a23{
            width: 450px;
            height: 185px;
            position: absolute;
            bottom: 4px;
            right: 0;
        }
        .d21{
            width: 1140px;
            height: 384px;
            margin: 0 auto;
            overflow: hidden;
            position: relative;
        }
        .d21 img:hover{
            transform: scale(1.2,1.2);
            transition: all 0.3s linear;
        }
        .d3{
            width: 100%;
            height: 736px;
            padding-top: 50px;
        }
        .d3 .img30{
            width: 220px;
            height: 309px;
        }
        .d3 .img31{
            width: 220px;
            height: 220px;
            margin-bottom: 4px;
        }
        .d3 .d31{
            width: 1150px;
            height: 640px;
            margin: 0 auto;
            position: relative;
            text-align: center;
            margin-top: 30px;
            padding-left: 10px;
        }
        .d3 .img30{
            float: left;
            margin-bottom: 11px;
            margin-right: 10px;
        }
        .d3 li{
            width: 220px;
            height: 309px;
            margin-bottom: 11px;
            margin-right: 10px;
            background-color: #f8f8f8;

        }
        .d3 .ul31 li{
            float: left;
        }
        .d3 .ul32 li{
            float: left;
        }
        .d3 li a{
            text-decoration: none;
        }
        .d3 .w31{
            display: block;
            height: 32px;
            line-height: 16px;
            font-size: 12px;
            color: rgb(51,51,51);
            font-weight: bold;
            padding: 0 10px;
        }
        .d3 .w32{
            display: block;
            line-height: 22px;
            font-size: 14px;
            color: rgb(219,46,46);
            margin-top: 5px;
        }
        .d3 img,li:hover{
        }
        li:after{
            content: '';
            display: block;
            clear: both;
        }
        li{
            *zoom: 1;
        }
        .d4{
            width: 100%;
            height: 626px;
            padding-top: 50px;
        }
        .d4 .d41{
            width: 1140px;
            height: 358px;
            margin:0 auto;
            margin-top: 23px;
            position: relative;
        }
        .img41{
            position: absolute;
            left: 0;
            top:0;
            width: 504px;
            height: 358px;
        }
        .img42{
            position: absolute;
            right: 211px;
            top:0;
            width: 411px;
            height: 172px;
        }
        .img43{
            position: absolute;
            right: 0;
            top:0;
            width: 197px;
            height: 358px;
        }
        .img44{
            position: absolute;
            right: 211px;
            bottom: 0;
            width: 411px;
            height: 172px;
        }
        .img41 img{
            width: 504px;
            height: 358px;
        }
        .img42 img{
            width: 411px;
            height: 172px;
        }
        .img44 img{
            width: 411px;
            height: 172px;
        }
        .img43 img{
            width: 197px;
            height: 358px;
        }
        .d41>a{
            overflow: hidden;
        }
        .img41 :hover{
            transform: scale(1.1);
            transition: 0.3s linear;
        }
        .img42 :hover{
            transform: scale(1.1);
            transition: 0.3s linear;
        }
        .img43 :hover{
            transform: scale(1.1);
            transition: 0.3s linear;
        }
        .img44 :hover{
            transform: scale(1.1);
            transition: 0.3s linear;
        }
        .ul43 li{
            float: left;
            width: 210px;
            height: 139px;
            text-align: center;
        }
        .d42{
            width: 1140px;
            height: 167px;
            margin: 20px auto 0;
        }
        .d42 .li41{
            margin: 0 22px 28px 0;
        }
        .d42 .li42{
            margin: 0 0 28px;
        }
        .d42 p a{
            width: 200px;
            height: 15px;
            padding: 0 5px;
            text-decoration: none;
            font-size: 14px;
            line-height: 15px;
            color: rgb(93, 93, 93);
        }
        .d42 div{
            width: 207.89px;
            height: 90px;
            border: 1px solid rgb(232, 232, 232);
            margin-bottom: 10px;
            overflow: hidden;
        }
        .d42 div a{
            width: 99%;

        }
        .d42 div img{
            width: 176px;
            height: 88px;
            display: block;
            padding: 100px;
            margin-top: -100px;
            margin-left: -100px;
        }
        .d42 img:hover{
            transform: translateX(-40px);
            transition: 0.3s linear;
        }
        .d5{
            width: 100%;
            height: 513px;
            padding: 50px 0;
            background-color: rgb(244, 240, 234);
        }
        .d5 li{
            float: left;
            width: 276px;
            height: 432px;
            margin: 0 9px 0 0;
            background-color: white;
            overflow: hidden;
        }
        .d51{
            width: 1140px;
            height: 432px;
            margin: 15px 104.5px 0;
            position: relative;
        }
        .d5 li img{
            width: 276px;
            height: 276px;
        }
        .d5 li img:hover{
            transform: scale(1.05);
            transition: 0.3s linear;
        }
        .d5 .d52{
            width: 236px;
            height: 124px;
            padding: 20px 15px;
            background-color: white;
            position: absolute;
            bottom: 0;
            margin-left: 5px;
        }
        .w51{
            font-size: 14px;
            color: rgb(51, 51, 51);
            font-weight: bold;
        }
        .w52{
            font-size: 14px;
            color: rgb(199, 138, 73);
            float: right;
        }
        .w53{
            width: 236px;
            height: 68px;
            margin: 12px auto;
            font-size: 12px;
            color: rgb(77, 77, 77);
            overflow: hidden;
        }
        .w54{
            font-size: 13px;
            line-height: 13px;
            color: rgb(119, 119, 119);
        }
        .w55{
            font-size: 13px;
            line-height: 13px;
            color: rgb(119, 119, 119);
            margin-left: 0.5em;
        }
    </style>
</head>
<body>
<%@ include file="head.jsp" %>



    <div class="d3">

        <p class="p2">天然之源，诚挚之礼，严格质检</p>
        <div class="d31">
            <div>


                <ul class="ul31">

                    <c:forEach items="${page.list}" var="a" >
                        <li>
                            <a href="/detail.do?productId=${a.id}"><img src="upload/${a.mainImage}" alt="" class="img31"></a>
                            <a href="#" class="w31"><p>${a.name}</p></a>
                            <a href="#" class="w32"><p>￥${a.price}</p></a>
                        </li>
                    </c:forEach>

                </ul>
            </div>
            <div class="page-normal" >
                <a href="/allList?categoryId=${categoryId}&pageNum=${page.prePage}">&nbsp;&lt;&nbsp;</a>

                <c:forEach  var="s"   begin="1" end="${page.pages}"  >
                  <a href='/allList?categoryId=${categoryId}&pageNum=${s}'>${s}</a>
                </c:forEach>
                <a href="/allList?categoryId=${categoryId}&pageNum=${page.nextPage}">&nbsp;&gt;&nbsp;</a>
            </div>
        </div>
    </div>
   <%@ include file="foot.jsp" %>
    <script src="jq1.11.1/jquery1.11.1.min.js"></script>
    <script src="js/leibie.js"></script>
    <script>
        var i = 1;
        var tim = null;
        function tm() {
            tim = setInterval(function () {
                if(i>2){
                    i = 0;
                }
                $('.hb>a').eq(i).fadeIn(1000).siblings('a').fadeOut(1000);
                $('.hb>ul>li').eq(i).css('background','#c78a49').siblings('li').css('background','white');
                i++;
            },2500)
        }
        tm();
        $('.hb>ul>li').click(function () {
            window.clearInterval(tim);
            $(this).css('background','#c78a49').siblings('li').css('background','white');
            var j= $(this).index();
            if(j>i){
                $('.hb>a').eq(j).show().css({
                    left : '100%',
                    'z-index' : 3
                }).siblings('a').css('z-index','1');
                $('.hb>a').eq(j).animate({
                    left : 0
                },700);
                $('.hb>a').eq(i).css('z-index','2');
                i = j;
                tm();
            }else if(j<i){
                $('.hb>a').eq(j).show().css({
                    left : '-100%',
                    'z-index' : 3
                }).siblings('a').css('z-index','1');
                $('.hb>a').eq(j).animate({
                    left : 0
                },700);
                $('.hb>a').eq(i).css('z-index','2');
                i = j;
                tm();
            }
        });
    </script>
    <script>
        var ind = 0;
        $('.yo').click(function () {
            ind -= 285;
            if(ind<-855){
                ind = 0;
            }
            $('.ul1').animate({'margin-left':ind+'px'},800);
        });
        $('.zo').click(function () {
            ind += 285;
            if(ind>0){
                ind = -855;
            }
            $('.ul1').animate({'margin-left':ind+'px'},800);
        })
    </script>
<script>
/*    $(function list() {
        var list='${list}'
            console.log(list)
        $.each(list,function(i,obj){
        var li="<li> <a href='#'><img src='image/img46.png'  class='img31'></a> <a href='#' class='w31'><p>简约时尚水泥花瓶</p></a> <a href='#' class='w3'><p>￥450.00</p></a> </li>"

           // var li=" <li><a href='productlist?&currentPage=1&cid="+obj.id+"'>"+obj.name+"</a></li> "
            /!*
                                var li="<li><a href='productServlet?method=productPage&currentPage=1&uid="+obj.id+"'>"+obj.name+"</a></li>";
            *!/
            $("#ul3").append(li);


        });
    });*/
</script>
</body>
</html>
