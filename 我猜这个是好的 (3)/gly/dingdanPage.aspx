<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dingdanPage.aspx.cs" Inherits="gly.dingdanPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>订单管理</title>
    <link rel="stylesheet" href="css/common.css" />
    <link rel="stylesheet" href="css/dingdanPage.css" />
    <link rel="stylesheet" href="./css/bootstrap.min.css" />
    <script src="./js/jquery.js"></script>
    <script src="./js/popper.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <link href="./css/all.min.css" rel="stylesheet" />
    <style>
        form {
            display: flex;
            height: 100%;
            width: 100%;
        }

        .main-content {
            overflow-y: auto;
            box-sizing: border-box; /* 设置一个最大高度，以确保在内容过多时出现滚动条 */
            max-height: calc(100vh - 40px); /* 减去一些高度以考虑侧边栏和内边距等 */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="sidebar">
            <div class="sidebar-header">
                <h2>我是医院管理系统</h2>
            </div>
            <ul class="sidebar-menu">
                <li><a href="HomePage.aspx">首页</a></li>
                <li><a href="keshiPage.aspx">科室管理</a></li>
                <li><a href="yishengPage.aspx">医生管理</a></li>
                <li><a href="paibanPage.aspx">排班管理</a></li>
                <li><a href="gonggaoPage.aspx">公告管理</a></li>
                <li><a href="dingdanPage.aspx">订单管理</a></li>
            </ul>
        </div>
        <div class="main-content">
            <div class="content-header">
                <select class="select" id="shaixuan" onchange="shaixuan()">
                    <option value="全部订单">全部订单</option>
                  
                    <option value="0">已预约</option>
                    <option value="1">已就诊</option>
                    <option value="2">已取消</option>
                </select>
            </div>
            <table class="order-table">
                <thead>
                    <tr>
                        <th>序号</th>
                        <th>就诊人</th>
                        <th>医生</th>
                        <th>预约时间</th>
                        <th>下单时间</th>
                        <th>状态</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- 动态加载数据 -->
                </tbody>
            </table>
            <div class="pagination">
                <button type="button" data-action="prev">上一页</button>
                <button type="button" data-action="next">下一页</button>
                <span>每页显示</span>
                <select>
                    <option value="10">10条/页</option>
                    <option value="20">20条/页</option>
                    <option value="30">30条/页</option>
                </select>
            </div>
        </div>
    </form>
</body>
</html>
<script>
    $(document).ready(function () {
        var currentPage = 1;
        var pageSize = 10;

        function loadOrders(page, size, status) {
            $.ajax({
                url: './处理程序/dingdanPage.ashx',
                type: 'get',
                datatype: 'json',
                data: { page: page, size: size, status: status },
                success: function (response) {
                    console.log(response.dinDan)
                    if (response.success) {
                        var dinD = response.dinDan;
                        var tbody = $('.order-table tbody');
                        tbody.empty(); // 清空表格内容

                        dinD.forEach(function (element, index) {
                            var newRow = `
                                <tr>
                                    <td>${index + 1 + (page - 1) * size}</td>
                                    <td>${element.就诊人}</td>
                                    <td>${element.医生}</td>
                                    <td>${element.预约时间}</td>
                                    <td>${element.下单时间}</td>
                                    <td>${element.Column1}</td>
                                </tr>
                            `;
                            tbody.append(newRow);
                        });
                    }
                }
            });
        }

        // 初始化加载第一页数据
        loadOrders(currentPage, pageSize, '全部订单');

        // 处理分页按钮点击事件
        $('.pagination').on('click', 'button', function () {
            var action = $(this).data('action');
            if (action === 'prev' && currentPage > 1) {
                currentPage--;
            } else if (action === 'next') {
                currentPage++;
            }
            loadOrders(currentPage, pageSize, $('.select').val());
        });

        // 处理每页显示条数改变事件
        $('.pagination select').on('change', function () {
            pageSize = $(this).val();
            currentPage = 1; // 重置为第一页
            loadOrders(currentPage, pageSize, $('.select').val());
        });

        // 处理筛选条件改变事件
        $('#shaixuan').on('change', function () {
            alert('change');
            loadOrders(currentPage, pageSize, $(this).val());
        });
    });
   
</script>
