<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎页</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: #060c21;
            font-family: 'Poppins', sans-serif;
        }

        .box {
            position: relative;
            width: 300px;
            height: 400px;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #060c21;
        }

        /* 用box的伪元素添加一个面积比box略大的矩形,并通过改变层叠次序,置于box的下层,达到给box设置边框的效果 */
        .box::before {
            content: '';
            position: absolute;
            top: -2px;
            left: -2px;
            right: -2px;
            bottom: -2px;
            background: #fff;
            z-index: -1;
        }

        /* 于上面类似,做一个面积比box略大的矩形,并通过改变层叠次序,置于box的下层,达到给box设置边框的效果 */
        .box::after {
            content: '';
            position: absolute;
            top: -2px;
            left: -2px;
            right: -2px;
            bottom: -2px;
            background: #fff;
            z-index: -2;
            /* 滤镜属性  给图像设置高斯模糊。"radius"一值设定高斯函数的标准差，或者是屏幕上以多少像素融在一起，所以值越大越模糊；如果没有设定值，则默认是0；这个参数可设置css长度值，但不接受百分比值。 */
            filter: blur(40px);
        }

        .box::before,
        .box::after {
            /* linear-gradient() 函数用于创建一个线性渐变的 "图像"。 参数1:用角度值指定渐变的方向（或角度）  12点钟方向为0deg*/
            background: linear-gradient(235deg, #89ff00, #060c21, #00bcd4);
        }

        .content1 {
            padding: 20px;
            box-sizing: border-box;
            color: white;
        }
    </style>
</head>
<body>
<div class="box">
    <div class="content1">
        <h1>WELCOME </h1>
        <br>
        <br>
        <br>
        <h3>
            欢迎使用图书管理系统
        </h3>
    </div>
</div>

</body>
</html>
