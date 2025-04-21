<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gonggaoPage.aspx.cs" Inherits="gly.gonggaoPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>公告管理</title>
<link rel="stylesheet" href="css/common.css"/>
<link rel="stylesheet" href="css/gonggaoPage.css"/>
<script src="./js/jquery.js"></script>
<script src="./js/popper.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./css/bootstrap.min.css"/>
<link rel="stylesheet" href="./css/all.min.css"/>
        <style>
        form {
    display: flex;
    height: 100%;
    width: 100%;
}
    .modal-body {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .modal-body .form-group {
        width: 80%;
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
        <button class="add-announcement" data-toggle="modal" data-target="#addAnnouncementModal">添加公告</button>
    </div>
    <div class="content-body">
        <table class="announcement-table">
            <thead>
                <tr>
                    <th>序号</th>
                    <th>标题</th>
                    <th>内容</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <!-- 动态渲染公共列表 -->
            </tbody>
        </table>
        <div class="pagination">
            <button class="prev-page">前往</button>
            <span>1</span>
            <span>2</span>
            <span>页 共 2 条</span>
            <select>
                <option>10条/页</option>
                <option>20条/页</option>
                <option>30条/页</option>
            </select>
        </div>
    </div>
</div>

<!-- 添加公告模态框 -->
<div class="modal fade" id="addAnnouncementModal" tabindex="-1" role="dialog" aria-labelledby="addAnnouncementModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addAnnouncementModalLabel">添加公告</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="add-announcement-form">
                    <div class="form-group">
                        <label for="announcement-title" class="col-form-label">标题:</label>
                        <input runat="server" type="text" class="form-control" id="anmentTit" placeholder="请输入标题"/>
                    </div>
                    <div class="form-group">
                        <label for="announcement-content" class="col-form-label">内容:</label>
                        <textarea runat="server" class="form-control" id="anmentCon" placeholder="请输入内容"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <asp:Button ID="Button1" type="button" class="btn btn-primary" runat="server" Text="确认" OnClick="Button1_Click" CausesValidation="False" />
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        // 阻止按钮的默认行为
        $('button').on('click', function (event) {
            event.preventDefault();
        });

        // 处理添加公告按钮点击事件
        $('.add-announcement').on('click', function () {
            $('#addAnnouncementModal').modal('show');
        });

        // 加载公告数据
        $.ajax({
            url: './处理程序/gonggaoPage.ashx',
            type: 'get',
            dataType: 'json',
            success: function (data) {
                console.log(data);
                var n = data.notice;
                var tbody = $('.announcement-table tbody'); // 使用 jQuery 选择器
                tbody.empty(); // 清空表格内容
                n.forEach((element, ele) => {
                    console.log(element);
                    var newRow = `
                    <tr>
                        <td>${ele+1}</td>
                        <td>${element.Title}</td>
                        <td>${element.Content}</td>
                        <td>
                            <button class="edit-button" data-id="${element.NoticeID}" data-title="${element.Title}" data-content="${element.Content}">编辑</button>
                            <button class="delete-button" data-id="${element.NoticeID}">删除</button>
                        </td>
                    </tr>`;
                    tbody.append(newRow); // 使用 jQuery 的 append 方法
                });

                // 绑定编辑按钮点击事件
                $('.edit-button').on('click', function (event) {
                    event.preventDefault(); // 阻止默认行为
                    var title = $(this).data('title');
                    var content = $(this).data('content');
                    $('#editAnnouncementModal #edit-announcement-title').val(title);
                    $('#editAnnouncementModal #edit-announcement-content').val(content);
                    $('#editAnnouncementModal').modal('show');
                });
            }
        });

        // 更新序号
        function updateRowNumbers() {
            $('.announcement-table tbody tr').each(function(index) {
                $(this).find('td:first').text(index + 1);
            });
        }
    });
</script>

<!-- 编辑公告模态框 -->
<div class="modal fade" id="editAnnouncementModal" tabindex="-1" role="dialog" aria-labelledby="editAnnouncementModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editAnnouncementModalLabel">编辑公告</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="edit-announcement-form">
                    <div class="form-group">
                        <label for="edit-announcement-title" class="col-form-label">标题:</label>
                        <input type="text" class="form-control" id="edit-announcement-title" placeholder="请输入标题"/>
                    </div>
                    <div class="form-group">
                        <label for="edit-announcement-content" class="col-form-label">内容:</label>
                        <textarea class="form-control" id="edit-announcement-content" placeholder="请输入内容"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="save-edit-announcement">保存</button>
            </div>
        </div>
    </div>
</div>
    </form>
</body>
</html>
