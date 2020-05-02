<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>在线书城</title>
    <link rel="stylesheet" href="css/public.css">
    <link rel="stylesheet" href="css/public2.css">
    <script type="text/javascript"  language="javascript" src="js/jquery-1.11.3.min.js"></script>
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
<div class="hb clear">
    <img src="image/img11.png" alt="">
    <a href="" style="z-index: 1"><img src="image/l5.jpg" style="height: 590px;width: 1900px" alt=""></a>
    <a href=""><img src="image/img11.png" style="height: 590px;width: 1900px" alt=""></a>
    <a href=""><img src="image/l4.jpg" style="height: 590px;width: 1900px" alt=""></a>
    <ul>
        <li class="clear"></li>
        <li class="clear"></li>
        <li class="clear"></li>
    </ul>
</div>

<c:forEach items="${actProductVos}" var="act">
<div class="d3">
    <p class="p1"><a href="">${act.activityName}</a></p>
    <p class="p2">${act.content}</p>
    <div class="d31">

        <div>
            <ul class="ul31">

                <c:forEach items="${act.list}" var="a" >
                    <li>
                        <a href="/detail.do?productId=${a.id}"><img src="upload/${a.mainImage}" alt="" class="img31"></a>
                        <a href="/detail.do?productId=${a.id}" class="w31"><p>${a.name}</p></a>
                        <a href="/detail.do?productId=${a.id}" class="w32"><p>￥${a.price}</p></a>
                    </li>
                </c:forEach>

            </ul>

        </div>

    </div>
</div>
    </c:forEach>



    <div class="d5">
        <p class="p1"><a href="">良品体验</a></p>
        <p class="p2">用户反馈，是我们改进的目标</p>
        <div class="d51">
            <ul>
                <li>
                    <a href="#"><img src="image/s1.jpg" alt=""></a>
                    <div class="d52">
                        <p>
                            <span class="w51">天草陶石咖啡杯套装</span><span class="w52">¥299</span>
                        </p>
                        <p class="w53">使用了粉碎高品质的天草陶石后提炼而成的土，制作了泛着淡青色的白瓷。用餐时可以记住食品名称、体会新鲜口味···可对颜色和口味、气味、口感逐个品味，从中感受用餐的乐趣，同时还可自然而然地了解日本饮食文化</p>
                        <p><span class="w54">alice</span><span class="w55">2016-12-16 09:59</span></p>
                    </div>
                </li>
                <li>
                    <a href="#"><img src="image/s2.jpg" alt=""></a>
                    <div class="d52">
                        <p>
                            <span class="w51">桌面书籍计算机操作系统</span><span class="w52">¥69</span>
                        </p>
                        <p class="w53">使用了粉碎高品质的天草陶石后提炼而成的土，桌面书籍计算机操作系统桌面书籍计算机操作系统桌面书籍计算机操作系统、口感逐个品味，从中感受用餐的乐趣，同时还可自然而然地了解日本饮食文化</p>
                        <p><span class="w54">王先生</span><span class="w55">2016-12-17 09:59</span></p>
                    </div>

                </li>
                <li>
                    <a href="#"><img src="image/s3.jpg.png" alt=""></a>
                    <div class="d52">
                        <p>
                            <span class="w51">桌面书籍计算机操作系统</span><span class="w52">¥29</span>
                        </p>
                        <p class="w53">挺好的，尺码真的很正！背部拉链设计，放心出行，为短途商旅贴心设计。防水尼龙与牛皮的优雅结合，轻便小巧，简约百搭，桌面书籍计算机操作系统</p>
                        <p><span class="w54">爱丽丝</span><span class="w55">2016-12-10 07:59</span></p>
                    </div>

                </li>
                <li>
                    <a href="#"><img src="image/s1.jpg" alt=""></a>
                    <div class="d52">
                        <p>
                            <span class="w51">桌面书籍计算机操作系统</span><span class="w52">¥19</span>
                        </p>
                        <p class="w53">挺好的，特别暖，尺码真的很正！桌面书籍计算机操作系统，心好累哦，桌面书籍计算机操作系统，不过看在你这么暖的份上就原谅你了哈哈哈。真的可以媲美油叽叽，很开心。------三石是我男神</p>
                        <p><span class="w54">小蚂蚁</span><span class="w55">2016-12-15 08:00</span></p>
                    </div>

                </li>
            </ul>
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
</body>
</html>
