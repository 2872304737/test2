<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="geren.aspx.cs" Inherits="hz.geren" EnableSessionState="True" %>

<!DOCTYPE html>
<html lang="en">

<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>账号登录1111111111111</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/news.css">
    <!-- 公共样式表 -->
    <link rel="stylesheet" href="./css/base.css">
    <!-- 颜色样式表 -->
    <link rel="stylesheet" href="/css/theme.css">
    <!-- bootstrap框架 -->
    <link href="css/personal.css" rel="stylesheet" />
    <script src="./js/bootstrap.bundle.min.js"></script>
    <script src="./js/jquery.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .sidebar {
            background-color: #f8f9fa;
            padding: 20px;
            border-right: 1px solid #dee2e6;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 添加外扩散黑色淡描边 */
        }

            .sidebar h2 {
                margin-bottom: 20px;
            }

            .sidebar .nav-link {
                color: #333;
                padding: 10px 0;
                border-bottom: 1px solid #e0e0e0; /* 添加淡灰色分隔线 */
                cursor: pointer;
            }

        .table thead th {
            background-color: #f0f0f0; /* 灰色背景 */
            color: black; /* 黑色文字 */
            padding: 10px; /* 内边距 */
        }

        .sidebar .nav-link:hover {
            background-color: #e9ecef;
            color: #007bff;
        }

        .content {
            margin-left: 50px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 添加外扩散黑色淡描边 */
        }

            .content h2 {
                margin-bottom: 20px;
            }

        .content-section {
            display: none;
        }

            .content-section h3 {
                margin-bottom: 10px;
            }

        .form-label {
            font-weight: bold;
        }

        .btn-link {
            padding-left: 0;
        }

        .table-container {
            margin-top: 20px;
        }

        .table th, .table td {
            vertical-align: middle;
        }

        .table thead th {
            background-color: #f8f9fa;
        }

        .loginform {
            display: none;
        }

        .d-flex {
            display: flex;
        }

        .flex-grow-1 {
            flex-grow: 1;
        }

        .ms-2 {
            margin-left: 8px;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server" onsubmit="return Page_ClientValidate();">
        <!-- 顶部导航栏 -->
        <div class="top">
            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                <div class="container-fluid">
                    <a class="navbar-brand" href="index.html">
                        <img src="./imgs/zjs.jpg" alt="">logo</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <!-- 添加圆形头像 -->
                        <div class="avatar-container">
                            <a href="./geren.aspx">
                                <div class="avatar"></div>
                            </a>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
        <!-- 顶部结构 -->
        <div class="news">
            <img class="public" src="./imgs/新闻.jpg" alt="">
        </div>
        <!-- 中心导航栏 -->
        <div class="news-nav page-container">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="./index.aspx">首页</a></li>
                    <li class="breadcrumb-item"><a href="#">就诊人管理</a></li>
                    <li class="breadcrumb-item active" aria-current="page"></li>
                </ol>
            </nav>
        </div>

        <div class="news-context page-container" id="newsccontext">
            <!-- 左侧导航栏 -->
            <div class="col-md-3 sidebar">
                <h2>个人中心</h2>
                <ul class="nav flex-column">
                    <li id="zhdlli" class="nav-item" runat="server">
                        <a class="nav-link active" href="#" onclick="showSection('login'); onLoginClick();">账号登录</a>
                    </li>
                    <li id="jzrglli" class="nav-item" runat="server">
                        <a class="nav-link" id="jzrgl" href="#" onclick="showSection('info'); onInfoClick();">就诊人管理</a>
                    </li>
                    <li id="ddjlli" class="nav-item" runat="server">
                        <a class="nav-link" href="#" onclick="showSection('orders'); onOrdersClick();">订单记录</a>
                    </li>
                    <li id="tcdlli" class="nav-item" runat="server">
                        <a class="nav-link" href="#" onclick="onLogoutClick();">退出登录</a>
                    </li>
                </ul>
            </div>
            <!-- 右侧内容区域 -->
            <div class="col-md-9 content">
                <div id="login" class="content-section" runat="server">
                    <h2>账号登录</h2>
                    <!-- 登录方式选择 -->
                    <div class="mb-3">
                        <label for="loginmethod" class="form-label">选择登录方式</label>
                        <select class="form-select" id="loginmethod" runat="server">
                            <option value="phone-password">手机号和密码</option>
                            <option value="qq-email">QQ邮箱验证码</option>
                        </select>
                    </div>

                    <!-- 手机号和密码登录 -->
                    <div id="login-1" class="loginform mb-3" style="display: none;">
                        <div class="mb-3">
                            <label for="phone-login" class="form-label">手机号</label>
                            <input type="text" class="form-control" id="phone-login" placeholder="输入手机号" required>
                        </div>
                        <div class="mb-3">
                            <label for="password-login" class="form-label">输入密码</label>
                            <input type="password" class="form-control" id="password-login" placeholder="输入密码" required>
                        </div>
                    </div>

                    <!-- QQ邮箱验证码登录 -->
                    <div id="login-2" class="loginform mb-3" style="display: none;">
                        <div class="mb-3">
                            <label for="email-login" class="form-label">输入邮箱</label>
                            <input type="email" class="form-control" id="email-login" placeholder="输入邮箱" required>
                        </div>
                        <div class="d-flex align-items-center">
                            <div class="mb-3 flex-grow-1">
                                <label for="code-login" class="form-label">输入验证码</label>
                                <input type="text" class="form-control" id="code-login" placeholder="请输入验证码" required>
                            </div>
                            <button type="button" id="sendLoginCodeButton" class="btn btn-primary ms-2" onclick="validateAndSendCode(event)">发送验证码</button>
                            <asp:HiddenField ID="hfLoginGeneratedCode" runat="server" />
                        </div>
                    </div>

                    <!-- 登录按钮 -->
                    <button id="yhloginButton" type="button" onclick="login()" class="btn btn-primary">登录</button>

                    <!-- 注册按钮 -->
                    <button type="button" class="ml-2 btn btn-primary" data-bs-toggle="modal" data-bs-target="#registerModal">注册</button>
                </div>
                <div id="info" class="content-section" runat="server">
                    <div style="display: flex; align-items: center;">
                        <h2>就诊人管理</h2>

                    </div>
                    <!-- 新增按钮 -->
                    <button type="button" class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#addPatientModal">新增</button>

                    <!-- 表格 -->
                    <table class="table table-bordered" id="jzrtable">
                        <thead>
                            <tr>
                                <th scope="col">序号</th>
                                <th scope="col">姓名</th>
                                <th scope="col">性别</th>
                                <th scope="col">年龄</th>
                                <th scope="col">身份证</th>
                                <th scope="col">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>


                </div>
                <div id="orders" class="content-section">
                    <h2>订单记录</h2>
                    <table class="table table-bordered" id="oredrtable">
                        <thead>
                            <tr>
                                <th scope="col">序号</th>
                                <th scope="col">科室</th>
                                <th scope="col">医生</th>
                                <th scope="col">预约时间</th>
                                <th scope="col">就诊人</th>
                                <th scope="col">订单状态</th>
                                <th scope="col">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- 添加就诊人模态框 -->
        <div class="modal fade" id="addPatientModal" tabindex="-1" aria-labelledby="addPatientModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addPatientModalLabel">添加就诊人</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="mb-3">
                        <label for="patientName" class="form-label">请输入姓名：</label>
                        <input type="text" class="form-control" id="patientName" placeholder="请输入姓名" onblur="validatePatientName()">
                    </div>
                    <div class="mb-3">
                        <label for="patientId" class="form-label">请输入身份证：</label>
                        <input type="text" class="form-control" id="patientId" placeholder="请输入身份证" onblur="validatePatientId()">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                        <button type="button" class="btn btn-primary" onclick="addPatient()">确认</button>

                    </div>
                </div>
            </div>
        </div>


        <!-- 添加注册模态框 -->
        <div class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="registerModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="registerModalLabel">注册</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="regname" class="form-label">请输入姓名：</label>
                            <input type="text" class="form-control" id="regname" placeholder="请输入姓名" runat="server">
                            <asp:RequiredFieldValidator ID="rfvRegName" runat="server" ControlToValidate="regname" ErrorMessage="姓名不能为空" CssClass="text-danger" Display="Dynamic" />
                        </div>

                        <div class="mb-3">
                            <label for="regsfz" class="form-label">请输入身份证：</label>
                            <input type="text" class="form-control" id="regsfz" placeholder="请输入身份证" runat="server">
                            <asp:RequiredFieldValidator ID="rfvRegsfz" runat="server" ControlToValidate="regsfz" ErrorMessage="身份证不能为空" CssClass="text-danger" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revRegsfz" runat="server" ControlToValidate="regsfz" ErrorMessage="请输入有效的身份证号码" CssClass="text-danger" Display="Dynamic" ValidationExpression="^\d{15}$|^\d{18}$" />

                        </div>
                        <div class="mb-3">
                            <label for="regphone" class="form-label">请输入手机号：</label>
                            <input type="text" class="form-control" id="regphone" placeholder="请输入手机号" runat="server">
                            <asp:RequiredFieldValidator ID="rfvRegPhone" runat="server" ControlToValidate="regphone" ErrorMessage="手机号不能为空" CssClass="text-danger" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revRegPhone" runat="server" ControlToValidate="regphone" ErrorMessage="请输入有效的手机号" CssClass="text-danger" Display="Dynamic" ValidationExpression="^1[3-9]\d{9}$" />
                        </div>
                        <div class="mb-3">
                            <label for="regemail" class="form-label">请输入邮箱：</label>
                            <input type="email" class="form-control" id="regemail" placeholder="请输入邮箱" runat="server">
                            <asp:RequiredFieldValidator ID="rfvRegEmail" runat="server" ControlToValidate="regemail" ErrorMessage="邮箱不能为空" CssClass="text-danger" Display="Dynamic" ValidationGroup="regemailGroup" />
                            <asp:RegularExpressionValidator ID="revRegEmail" runat="server" ControlToValidate="regemail" ErrorMessage="请输入有效的邮箱地址" CssClass="text-danger" Display="Dynamic" ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" ValidationGroup="regemailGroup" />
                        </div>

                        <div class="mb-3">
                            <label for="regpwd" class="form-label">请输入密码：</label>
                            <input type="password" class="form-control" id="regpwd" placeholder="请输入密码" runat="server">
                            <asp:RequiredFieldValidator ID="rfvRegPwd" runat="server" ControlToValidate="regpwd" ErrorMessage="密码不能为空" CssClass="text-danger" Display="Dynamic" />
                        </div>
                        <div class="mb-3">
                            <label for="regpwd2" class="form-label">请确认密码：</label>
                            <input type="password" class="form-control" id="regpwd2" placeholder="请确认密码" runat="server">
                            <asp:RequiredFieldValidator ID="rfvRegPwd2" runat="server" ControlToValidate="regpwd2" ErrorMessage="确认密码不能为空" CssClass="text-danger" Display="Dynamic" />
                            <asp:CompareValidator ID="cvRegPwd" runat="server" ControlToValidate="regpwd2" ControlToCompare="regpwd" ErrorMessage="两次输入的密码不一致" CssClass="text-danger" Display="Dynamic" />
                        </div>
                        <div class="mb-3">
                            <label for="regcode" class="form-label">请输入验证码：</label>
                            <input type="text" class="form-control" id="regcode" placeholder="请输入验证码" runat="server">
                            <asp:RequiredFieldValidator ID="rfvRegCode" runat="server" ControlToValidate="regcode" ErrorMessage="验证码不能为空" CssClass="text-danger" Display="Dynamic" />
                            <asp:CustomValidator ID="cvRegCode" runat="server" ControlToValidate="regcode" ErrorMessage="验证码不正确" CssClass="text-danger" Display="Dynamic" ClientValidationFunction="validateCode" OnServerValidate="ValidateCode_Server" />
                            <button type="button" id="yanzhengmaButton" class="btn btn-secondary mt-2">发送验证码</button>
                            <asp:HiddenField ID="hfCountdown" runat="server" Value="10" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                        <%--<asp:Button type="button" ID="zhuceButton" class="btn btn-primary" OnClick="zhuceButton_Click" runat="server" Text="确认" />--%>
                        <%--<button type="button" id="zcbutton" runat="server" class="btn btn-primary">确认</button>--%>
                        <button type="button" id="zcbutton" class="btn btn-primary" onclick="register()">确认</button>
                    </div>
                </div>
            </div>
        </div>


        <!-- 删除就诊人模态框 -->
<div class="modal fade" id="deletePatientModal" tabindex="-1" aria-labelledby="deletePatientModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deletePatientModalLabel">确认删除就诊人</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                您确定要删除这个就诊人吗？
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="confirmDeletePatientButton">确认</button>
            </div>
        </div>
    </div>
</div>

        <!-- 取消订单模态框 -->
<div class="modal fade" id="cancelOrderModal" tabindex="-1" aria-labelledby="cancelOrderModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="cancelOrderModalLabel">确认取消订单</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                您确定要取消这个订单吗？
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="confirmCancelOrderButton">确认</button>
            </div>
        </div>
    </div>
</div>

        <div class="footer">
        </div>
        <asp:HiddenField ID="hfGeneratedCode" runat="server" />
    </form>
    <script>

        function register() {
            // 触发客户端验证
            if (Page_ClientValidate()) {
                var regname = document.getElementById('<%= regname.ClientID %>').value;
         var regsfz = document.getElementById('<%= regsfz.ClientID %>').value;
         var regphone = document.getElementById('<%= regphone.ClientID %>').value;
         var regemail = document.getElementById('<%= regemail.ClientID %>').value;
         var regpwd = document.getElementById('<%= regpwd.ClientID %>').value;
         var regpwd2 = document.getElementById('<%= regpwd2.ClientID %>').value;
                 var regcode = document.getElementById('<%= regcode.ClientID %>').value;

                 $.ajax({
                     type: "POST",
                     url: "geren.aspx/zhuceButton_Click",
                     data: JSON.stringify({
                         regname: regname,
                         regsfz: regsfz,
                         regphone: regphone,
                         regemail: regemail,
                         regpwd: regpwd,
                         regpwd2: regpwd2,
                         regcode: regcode
                     }),
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     success: function (response) {
                         alert(response.d);
                         location.reload();
                     },
                     error: function (xhr, status, error) {
                         alert("注册失败: " + error);
                     }
                 });
             }
         }


        // 添加就诊人输入框失去焦点时进行非空验证
        function validatePatientName() {
            var patientName = document.getElementById('patientName').value.trim();
            if (patientName === '') {
                alert('请输入姓名');
                return false;
            }
            return true;
        }

        function validatePatientId() {
            var patientId = document.getElementById('patientId').value.trim();
            if (patientId === '') {
                alert('请输入身份证');
                return false;
            } else {
                // 验证身份证格式
                var idPattern = /^\d{17}[\dXx]$/;
                if (!idPattern.test(patientId)) {
                    alert('请输入有效的18位身份证号码');
                    return false;
                }
            }
            return true;
        }

        // 添加就诊人
        function addPatient() {
            // 先进行验证
            if (!validatePatientName() || !validatePatientId()) {
                return;
            }
            var patientName = document.getElementById('patientName').value.trim();
            var patientId = document.getElementById('patientId').value.trim();


            // 发送 AJAX 请求
            $.ajax({
                type: "POST",
                url: "geren.aspx/AddPatient",
                data: JSON.stringify({ patientName: patientName, patientId: patientId }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    alert(response.d);
                    // 处理成功响应
                    location.reload();
                },
                error: function (xhr, status, error) {
                    alert("添加失败: " + error);
                }
            });
        }

        // 账号登录点击事件的代码
        function onLoginClick() {

        }

        // 就诊人管理
        function onInfoClick() {
            $.ajax({
                url: './处理程序/personal.ashx',
                type: 'get',
                datatype: 'json',
                data: { action: 'getperson' },
                success: function (data) {
                    var tbody = $('#jzrtable tbody'); // 使用 jQuery 选择器
                    tbody.empty(); // 清空表格内容
                    data.forEach((element, ele) => {
                        var row = `
           <tr>
             <td>${ele + 1}</td>
             <td>${element.姓名}</td>
             <td>${element.性别}</td>
             <td>${element.年龄}</td>
             <td>${element.身份证}</td>
            <td>
   <button type="button" class="btn btn-danger btn-sm" onclick="deletePatient(${element.就诊人id})">删除</button>

</td>


         </tr>`;
                        tbody.append(row);
                    })
                }
            })
        }

        //删除就诊人
        var currentPatientId; // 全局变量，用于存储当前就诊人 ID

        function deletePatient(patientId) {
            currentPatientId = patientId; // 存储就诊人 ID
            $('#deletePatientModal').modal('show'); // 显示模态框
        }

        document.getElementById('confirmDeletePatientButton').addEventListener('click', function () {
            // 发送 AJAX 请求
            $.ajax({
                type: "POST",
                url: "geren.aspx/DeletePatient",
                data: JSON.stringify({ patientId: currentPatientId }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    alert(response.d);
                    // 处理成功响应
                    location.reload();
                },
                error: function (xhr, status, error) {
                    alert("删除就诊人失败: " + error);
                }
            });
            $('#deletePatientModal').modal('hide'); // 隐藏模态框
        });

        // 订单记录
        function onOrdersClick() {
            $.ajax({
                url: './处理程序/personal.ashx',
                type: 'get',
                datatype: 'json',
                data: { action: 'dindang' },
                success: function (data) {
                    console.log(data);
                    var tbody = $('#oredrtable tbody'); // 使用 jQuery 选择器
                    tbody.empty(); // 清空表格内容
                    data.forEach((element, ele) => {
                        var row = `
                                <tr>
                                  <td>${ele + 1}</td>
                                  <td>${element.订单科室}</td>
                                  <td>${element.订单医生}</td>
                                  <td>${element.订单预约时间}</td>
                                  <td>${element.订单就诊人}</td>
                                  <td>${element.订单状态}</td>
                                   <td>
    <button type="button" class="btn btn-danger btn-sm" onclick="cancelOrder(${element.订单号})">取消</button>

</td>
                              </tr>`;
                        tbody.append(row);
                    })
                }
            })
        }

        //取消订单
        var currentOrderId; // 全局变量，用于存储当前订单号

        function cancelOrder(orderId) {
            currentOrderId = orderId; // 存储订单号
            $('#cancelOrderModal').modal('show'); // 显示模态框
        }

        document.getElementById('confirmCancelOrderButton').addEventListener('click', function () {
            // 发送 AJAX 请求
            $.ajax({
                type: "POST",
                url: "geren.aspx/CancelOrder",
                data: JSON.stringify({ orderId: currentOrderId }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    alert(response.d);
                    // 处理成功响应
                    location.reload();
                },
                error: function (xhr, status, error) {
                    alert("取消订单失败: " + error);
                }
            });
            $('#cancelOrderModal').modal('hide'); // 隐藏模态框
        });

        // 退出登录点击事件的代码
        function onLogoutClick() {
            $.ajax({
                type: "POST",
                url: "geren.aspx/ClearSession",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d === "success") {
                        alert("已退出登录");
                        location.reload(); // 刷新页面
                    } else {
                        alert("退出登录失败");
                    }
                },
                error: function (xhr, status, error) {
                    alert("退出登录失败: " + error);
                }
            });
        }

        //登录按钮
        function login() {
            var email = document.getElementById('email-login').value.trim();
            var code = document.getElementById('code-login').value.trim();
            var zh = document.getElementById('phone-login').value.trim();
            var mm = document.getElementById('password-login').value.trim();
            var loginMethod = document.getElementById('loginmethod').value; // 修改这里

            if (loginMethod === 'qq-email') {
                // 非空验证
                if (email === '') {
                    alert('请输入邮箱');
                    return;
                }

                if (code === '') {
                    alert('请输入验证码');
                    return;
                }
                // 格式验证
                var emailPattern = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
                if (!emailPattern.test(email)) {
                    alert('请输入有效的邮箱地址');
                    emailInput.focus();
                    return;
                }
            } else {
                if (zh === '') {
                    alert('请输入手机号');
                    return;
                }
                var phonePattern = /^1[3-9]\d{9}$/;
                if (!phonePattern.test(zh)) {
                    alert('请输入有效的手机号');
                    document.getElementById('phone-login').focus();
                    return;
                }
                if (mm === '') {
                    alert('请输入密码');
                    return;
                }
            }

            // 发送 AJAX 请求
            $.ajax({
                type: "POST",
                url: "geren.aspx/Login",
                data: JSON.stringify({ email: email, code: code, zh: zh, mm: mm, loginMethod: loginMethod }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    
                    if (response.d=="success") {
                        alert("登录成功");
                    } else {
                        alert("登录失败");
                    }
                    // 创建一个 URL 对象，使用当前页面的 URL
                    const url = new URL(window.location.href);

                    // 使用 URLSearchParams 获取查询参数
                    const params = new URLSearchParams(url.search);

                    // 判断是否有任何参数
                    if (params.toString() && response.d == 'success') {
                        window.location.href = '/news.aspx'
                    } else {
                        location.reload();
                    }
                },
                error: function (xhr, status, error) {
                    alert("登录失败" );
                }
            });
        }


        // 重置注册模态框验证信息
        function resetValidation() {
            var modal = document.getElementById('registerModal');
            var validators = modal.querySelectorAll('.text-danger');
            validators.forEach(function (validator) {
                validator.style.display = 'none';
            });
        }
        //验证码按钮点击事件
        $(document).ready(function () {
            onInfoClick();
            onOrdersClick();

            $('#yanzhengmaButton').click(function () {
                var button = $(this);
                var isValid = Page_ClientValidate("regemailGroup");

                if (isValid) {
                    button.prop('disabled', true);
                    var email = $('#regemail').val();

                    $.ajax({
                        type: "POST",
                        url: "geren.aspx/yanzhengmaClick",
                        data: JSON.stringify({ regemail: email }),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            alert("验证码已发送");
                            document.getElementById('hfGeneratedCode').value = response.d;
                            startCountdown(button);
                        },
                        error: function (xhr, status, error) {
                            alert("发送验证码失败: " + error);
                            button.prop('disabled', false);
                        }
                    });
                }
            });
        });
        // 验证码判断
        function validateCode(source, args) {
            var inputCode = document.getElementById('<%= regcode.ClientID %>').value;
            var generatedCode = document.getElementById('hfGeneratedCode').value;
            args.IsValid = (inputCode === generatedCode);
        }
        function startCountdown(button) {
            var countdown = 10;
            button.text("请在" + countdown + "秒后再次发送");

            var interval = setInterval(function () {
                countdown--;
                button.text("请在" + countdown + "秒后再次发送");

                if (countdown <= 0) {
                    clearInterval(interval);
                    button.text("发送验证码");
                    button.prop('disabled', false);
                }
            }, 1000);
        }



        // 监听模态框关闭事件
        document.addEventListener('DOMContentLoaded', function () {
            var registerModal = document.getElementById('registerModal');
            registerModal.addEventListener('hidden.bs.modal', function () {
                resetValidation();
            });
        });



        function showSection(sectionId) {
            // 隐藏所有内容部分
            document.querySelectorAll('.content-section').forEach(function (section) {
                section.style.display = 'none';
            });
            // 显示选中的内容部分
            document.getElementById(sectionId).style.display = 'block';
        }

        document.addEventListener('DOMContentLoaded', function () {
            var registerModal = document.getElementById('registerModal');
            registerModal.addEventListener('show.bs.modal', function () {
                resetValidation();
            });

            registerModal.addEventListener('hidden.bs.modal', function () {
                resetValidation();
            });

            const loginMethodSelect = document.getElementById('loginmethod');
            const loginForms = document.querySelectorAll('.loginform');

            // 默认显示手机号和密码登录方式
            loginForms[0].style.display = 'block';

            loginMethodSelect.addEventListener('change', function () {
                const selectedValue = this.value; // 修改这里

                // 清空所有登录方式的输入框
                document.getElementById('phone-login').value = '';
                document.getElementById('password-login').value = '';
                document.getElementById('email-login').value = '';
                document.getElementById('code-login').value = '';

                // 隐藏所有登录方式的输入框
                loginForms.forEach(form => form.style.display = 'none');

                if (selectedValue === 'phone-password') {
                    loginForms[0].style.display = 'block';
                } else if (selectedValue === 'qq-email') {
                    loginForms[1].style.display = 'block';
                } else if (selectedValue === 'phone-code') {
                    loginForms[2].style.display = 'block';
                }
            });
        });


        //登录发送验证码前先进行非空和格式验证
        function validateAndSendCode(event) {
            event.preventDefault(); // 防止表单提交
            var emailInput = document.getElementById('email-login');
            var email = emailInput.value.trim();

            // 非空验证
            if (email === '') {
                alert('请输入邮箱');
                emailInput.focus();
                return;
            }

            // 格式验证
            var emailPattern = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
            if (!emailPattern.test(email)) {
                alert('请输入有效的邮箱地址');
                emailInput.focus();
                return;
            }



            // 验证通过，执行发送验证码的操作
            sendCode();
        }

        function sendCode() {
            var button = document.getElementById('sendLoginCodeButton');
            var email = document.getElementById('email-login').value;

            button.disabled = true;
            alert(email);
            $.ajax({
                type: "POST",
                url: "geren.aspx/loginyanzhengmaClick",
                data: JSON.stringify({ regemail: email }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    alert("验证码已发送");
                    document.getElementById('hfLoginGeneratedCode').value = response.d;
                    startLoginCountdown(button);
                },
                error: function (xhr, status, error) {
                    alert("发送验证码失败: " + error);
                    button.disabled = false;
                }
            });
        }

        function startLoginCountdown(button) {
            var countdown = 10;
            button.textContent = "请在" + countdown + "秒后再次发送";

            var interval = setInterval(function () {
                countdown--;
                button.textContent = "请在" + countdown + "秒后再次发送";

                if (countdown <= 0) {
                    clearInterval(interval);
                    button.textContent = "发送验证码";
                    button.disabled = false;
                }
            }, 1000);
        }
    </script>

</body>

</html>
