<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>在线书城后台-登录</title>
    <link rel="stylesheet" href="frame/layui/css/layui.css">
    <link rel="stylesheet" href="frame/static/css/style.css">
    <link rel="icon" href="frame/static/image/code.png">
    <style type="text/css">
        .layui-btn{
            background-color: #F55D54;
        }
    </style>
</head>
<body>

<div class="login-main">
    <header class="layui-elip">线上购物管理后台</header>
    <form class="layui-form" >
        <div class="layui-input-inline">
            <input id="zh" type="text" name="username" required lay-verify="required" placeholder="用户名" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline">
            <input id="mm" type="password" name="password" required lay-verify="required" placeholder="密码" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline login-btn">
            <button type="submit" class="layui-btn" onclick="dl()">登录</button>
        </div>
        <!--<hr/>-->
        <!--<div class="layui-input-inline">
            <button type="button" class="layui-btn layui-btn-primary">QQ登录</button>
        </div>
        <div class="layui-input-inline">
            <button type="button" class="layui-btn layui-btn-normal">微信登录</button>
        </div>-->
        <!--<p><a href="javascript:;" class="fl">立即注册</a><a href="javascript:;" class="fr">忘记密码？</a></p>-->
    </form>
</div>


<script src="frame/layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['form'], function () {

        // 操作对象
        var form = layui.form
                , $ = layui.jquery;

        // you code ...


    });
</script>
<script src="jq1.11.1/jquery1.11.1.min.js"></script>
<script type="text/javascript">
     function dl() {


        var zh=$("#zh").val()
        var mm=$("#mm").val()

        $.post("loginManage.do",{"username":zh,"password":mm},function(data){
          alert(data)
            console.log(data)
           if(data.status=="0"){
               window.location.href="/listProductManage.do"
           }else{
               alert(data.msg)
           }

        },"json")


     }

</script>
</body>
</html>