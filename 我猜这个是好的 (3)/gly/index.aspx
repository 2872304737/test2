<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="gly._as" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>医院管理员登录</title>
    <link rel="stylesheet" href="css/styles.css" />
    <!-- 修改样式表路径 -->
    <script src="/js/jquery.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-form">
            <div class="login-container">
                <div class="denglu">
                    <h3 style="color: #fff; text-align: center;">我是医院管理员登录</h3>
                    <div>
                        <!-- 改为 div 避免嵌套表单 -->
                        <div class="form-item">
                            <input type="text" id="username" placeholder="用户名"  />
                        </div>
                        <div class="form-item">
                            <input type="password" id="password" placeholder="密码" />
                        </div>
                        <button type="button" class="login-button" id="btnLogin">登录</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script>
        $('#btnLogin').click(function () {
            var username = $('#username').val();
            var password = $('#password').val();

            $.ajax({
                url: '/处理程序/LoginHandler.ashx',
                type: 'GET',
                data: { username: username, password: password },
                dataType: 'json',
                success: function (response) {
                    if (response.success) {
                        window.location.href = 'HomePage.aspx';
                    } else {
                        alert(response.message);
                    }
                },
                error: function () {
                    alert('网络请求失败');
                }
            });
        });
    </script>
</body>
</html>
