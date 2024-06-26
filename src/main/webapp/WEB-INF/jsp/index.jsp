<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/jsfunc.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <div id="index" class="container">
        <div class="glass-effect">
            <h1 class="title">在线点餐系统</h1>
            <div class="button-container">
                <button onclick="showUserLogin()" class="button">顾客登录</button>
                <button onclick="showStaffLogin()" class="button">后台登录</button>
            </div>
        </div>
    </div>
    <div id="userlogin" class="container" style="display:none;">
        <div class="glass-effect">
            <h1 class="title">欢迎光临</h1>
            <form id="login-form" action="${pageContext.request.contextPath}/user/updateuser" method="post">
                <input id="phone" name="phone" type="text" placeholder="手机号" required>
                <input id="people" name="people" type="number" placeholder="用餐人数" min="1" max="9" required>
                <input id="table" name="table" placeholder="餐桌号" min="1" max="16" required>
                <div class="button-container">
                    <button class="button" type="submit">点餐</button>
                    <button onclick="showIndex()" class="button">返回</button>
                </div>
            </form>
        </div>
    </div>
    <div id="stafflogin" class="container" style="display:none;">
        <div class="glass-effect">
            <h1 class="title">餐厅后台</h1>
            <form id="login-form" action="${pageContext.request.contextPath}/staff/loginstaff" method="post">
                <input id="staff_name" name="staff_name" type="text" placeholder="用户" required>
                <input id="password" name="password" type="text" placeholder="密码" required>
                <div class="button-container">
                    <button type="submit" class="button">登录</button>
                    <button onclick="showIndex()" class="button">返回</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>