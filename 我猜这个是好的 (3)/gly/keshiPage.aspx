<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="keshiPage.aspx.cs" Inherits="gly.keshiPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>科室管理</title>

    <link rel="stylesheet" href="./css/bootstrap.min.css" />
    <script src="./js/jquery.js"></script>
    <script src="./js/popper.min.js"></script>
    <script src="./js//bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <link rel="stylesheet" href="css/common.css" />
    <link rel="stylesheet" href="css/keshiPage.css" />
    <style>
        .modal-dialog-centered {
            display: flex;
            align-items: center;
            min-height: calc(100% - 1rem); /* 使模态框垂直居中 */
        }

        .btn-group .btn {
            margin-right: 5px; /* 设置按钮之间的间距 */
        }

            .btn-group .btn:last-child {
                margin-right: 0; /* 移除最后一个按钮的右边距 */
            }

        .pagination-container {
            text-align: center;
            margin-top: 20px;
        }

        #form111 {
            display: flex;
            height: 100%;
            width: 100%;
        }
    </style>

</head>
<body>
    <form id="form111" runat="server">
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
                <button type="button" class="add-department btn btn-primary" data-toggle="modal" data-target="#addDepartmentModal">添加科室</button>
            </div>
            <div class="content-body">
                <table class="department-table">
                    <thead>
                        <tr>
                            <th>序号</th>
                            <th>科室名称</th>
                            <th>二级科室</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- 科室列表将动态生成 -->
                    </tbody>
                </table>
            </div>
        </div>

        <!-- 确认删除模态框 -->
        <div class="modal fade" id="deleteConfirmModal" tabindex="-1" role="dialog" aria-labelledby="deleteConfirmModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteConfirmModalLabel">确认删除</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        你确定要删除这个科室吗？
                       
                        <asp:HiddenField ID="hiddenDepartmentName" runat="server" />
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                        <asp:Button ID="confirmDelete" type="button" class="btn btn-danger" runat="server" Text="删除" OnClick="kes_Click" />
                    </div>
                </div>
            </div>
        </div>

        <!-- 添加二级科室模态框 -->
        <div class="modal fade" id="addSubDepartmentModal" tabindex="-1" role="dialog" aria-labelledby="addSubDepartmentModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <asp:Button ID="Button4" runat="server" Text="可4" OnClick="fukeis_Click" />
                        <h5 class="modal-title" id="addSubDepartmentModalLabel">添加二级科室</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="current-department-name" class="col-form-label">当前科室名称:</label>
                            <input type="text" class="form-control" id="currename" readonly="" runat="server" />
                        </div>
                        <div class="form-group">
                            <label for="sub-department-name" class="col-form-label">二级科室名称:</label>
                            <input type="text" class="form-control" id="subame" placeholder="请输入二级科室名称" runat="server" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                        <asp:Button ID="Button3" runat="server" Text="可3" OnClick="fukeis_Click" />
                        <asp:Button ID="Button2" type="button" class="btn btn-primary" runat="server" Text="添加" OnClick="fukeis_Click" />
                    </div>
                </div>
            </div>
        </div>

        <!-- 修改科室模态框 -->
        <div class="modal fade" id="editDepartmentModal" tabindex="-1" role="dialog" aria-labelledby="editDepartmentModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <asp:Button ID="Button7" runat="server" Text="可7" OnClick="fukeis_Click" />
                        <h5 class="modal-title" id="editDepartmentModalLabel">修改科室</h5>
                        <asp:HiddenField ID="hiddenbianjiName" runat="server" />
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="edit-department-name" class="col-form-label">科室名称:</label>
                            <input type="text" class="form-control" id="ediname" runat="server" />
                        </div>
                        <h5>二级科室列表</h5>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>科室名称</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody id="sub-department-list">
                                <!-- 二级科室列表将动态生成 -->
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                        
                        <asp:Button ID="savekeshiname" OnClick="savekeshiname_Click"  class="btn btn-primary" runat="server" Text="确定" />
                    </div>
                </div>
            </div>
        </div>

        <!-- 添加科室模态框 -->
        <div class="modal fade" id="addDepartmentModal" tabindex="-1" role="dialog" aria-labelledby="addDepartmentModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <asp:Button ID="Button5" Text="可5" runat="server" class="tc" />
                        <asp:Button ID="Button9" runat="server" Text="可9" OnClick="fukeis_Click" />
                        <h5 class="modal-title" id="addDepartmentModalLabel">添加科室</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="department-name" class="col-form-label">科室名称:</label>
                            <input id="ks" type="text" name="name" value="" placeholder="请输入科室" runat="server" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                        <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="确认" OnClick="Button1_Click" />
                    </div>
                </div>
            </div>
        </div>

        <script>
            $(document).ready(function () {



                var deleteRow; // 用于存储要删除的行
                var currentDepartmentRow; // 用于存储当前科室行

                // 初始化删除按钮点击事件
                $('.department-table').on('click', '.delete-button', function () {
                    deleteRow = $(this).closest('tr'); // 存储要删除的行
                    var departmentName = $(this).closest('tr').find('td:nth-child(2)').text().replace(/,+$/, ''); // 获取当前科室名称并去除多余的逗号
                    console.log('Department Name:', departmentName); // 打印科室名称以进行调试

                    // 将科室名称存储在隐藏字段中
                    $('#hiddenDepartmentName').val(departmentName);

                    $('#deleteConfirmModal').modal('show'); // 显示确认删除模态框
                });

                // 更新序号
                function updateRowNumbers() {
                    $('.department-table tbody tr').each(function (index) {
                        $(this).find('td:first').text(index + 1);
                    });
                }

                // 初始化添加按钮点击事件
                $('.department-table').on('click', '.add-button', function () {
                    currentDepartmentRow = $(this).closest('tr'); // 存储当前科室行
                    var departmentName = currentDepartmentRow.find('td:nth-child(2)').text(); // 获取当前科室名称
                    $('#currename').val(departmentName); // 设置模态框中的当前科室名称
                    $('#addSubDepartmentModal').modal('show'); // 显示添加二级科室模态框
                });

                // 数据渲染事件
                $.ajax({
                    url: './处理程序/keshiPage.ashx',
                    type: 'get',
                    dataType: 'json',
                    success: function (data) {
                        console.log(data);
                        var td = data.ksc;
                        var tbody = $('.department-table tbody');
                        tbody.empty(); // 清空现有的表格内容

                        td.forEach(function (department, index) {
                            console.log(department);
                            var kelb = department.副科室列表;
                            var subDepartments = department.副科室列表.split(',').map(function (sub) {
                                return `<span>${sub.trim()}</span>`;
                            }).join('');
                            console.log(subDepartments);
                            var newRow = `
              <tr>
                  <td>${index + 1}
                    <input type="hidden" id="zkshi" value="${department.主科室名称}" />
                  </td>
                  
                  <td>${department.主科室名称}</td>
                  <td>${subDepartments || '暂无'}</td>
                  
                  <td>
                      <div class="btn-group" role="group">
                          <button type="button" class="edit-button btn btn-secondary btn-sm">
                              <i class="fas fa-edit"></i>
                          </button>
                          <button type="button" class="delete-button btn btn-danger btn-sm">
                              <i class="fas fa-trash-alt"></i>
                          </button>
                          <button type="button" class="add-button btn btn-info btn-sm">
                              <i class="fas fa-plus"></i>
                          </button>
                      </div>
                  </td>
              </tr>
              `;
                            tbody.append(newRow);
                        });
                    }
                });

                // 初始化编辑按钮点击事件
                $('.department-table').on('click', '.edit-button', function () {
                    currentDepartmentRow = $(this).closest('tr'); // 存储当前科室行
                    var departmentName = currentDepartmentRow.find('td:nth-child(2)').text(); // 获取当前科室名称
                    $('#ediname').val(departmentName); // 设置模态框中的科室名称

                    // 生成二级科室列表
                    var subDepartments = currentDepartmentRow.find('td:nth-child(3) span');
                    var subDepartmentList = $('#sub-department-list');
                    subDepartmentList.empty();
                    subDepartments.each(function (index) {
                        var subDepartmentName = $(this).text();
                        var subDepartmentRow = `
    <tr>
        <td>${index + 1}</td>
        <td><span class="sub-department-name">${subDepartmentName}</span><input type="text" class="form-control sub-department-input" value="${subDepartmentName}" style="display:none;"></td>
        <td>
            <button type="button" class="btn btn-danger btn-sm delete-sub-department">删除</button>
            <button type="button" class="btn btn-secondary btn-sm edit-sub-department">修改</button>
        </td>
    </tr>
`;
                        subDepartmentList.append(subDepartmentRow);
                    });

                    // 将科室名称存储在隐藏字段中
                    $('#hiddenbianjiName').val(departmentName);

                    $('#editDepartmentModal').modal('show'); // 显示修改科室模态框
                });

                // 处理删除二级科室按钮点击事件
                $('#sub-department-list').on('click', '.delete-sub-department', function () {
                    var $row = $(this).closest('tr');
                    var $span = $row.find('.sub-department-name');
                    var $input = $row.find('.sub-department-input');
                    var $button = $(this); // 保存按钮对象
                    var jiukeshi = $span.text();
                   
                        $.ajax({
                            type: "POST",
                            url: "keshiPage.aspx/DeleteSubDepartment",
                            data: JSON.stringify({jiukeshi: jiukeshi }),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (response) {
                                $row.remove();
                            },
                            error: function (error) {
                                alert("删除失败");
                            }
                        });
                    
                });


                // 处理修改二级科室按钮点击事件
                $('#sub-department-list').on('click', '.edit-sub-department', function () {
                    var $row = $(this).closest('tr');
                    var $span = $row.find('.sub-department-name');
                    var $input = $row.find('.sub-department-input');
                    var $button = $(this); // 保存按钮对象
                    var jiukeshi = $span.text();
                    if ($button.text() === '修改') {
                        $span.hide();
                        $input.show();
                        $button.text('保存');
                    } else {
                        $span.text($input.val()).show();
                        $input.hide();
                        $button.text('修改');

                        // 触发后端的 OnClick 事件
                        
                        var xinkeshi = $input.val();
                        $.ajax({
                            type: "POST",
                            url: "keshiPage.aspx/UpdateSubDepartment",
                            data: JSON.stringify({ xinkeshi: xinkeshi, jiukeshi: jiukeshi }),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (response) {
                                
                            },
                            error: function (error) {
                                alert("修改失败");
                            }
                        });
                    }
                });

                // 处理保存修改按钮点击事件
                $('#saveChanges').on('click', function () {
                    var departmentName = $('#ediname').val();
                    currentDepartmentRow.find('td:nth-child(2)').text(departmentName); // 更新科室名称

                    var subDepartmentSpans = currentDepartmentRow.find('td:nth-child(3)').empty();
                    $('#sub-department-list tr').each(function () {
                        var subDepartmentName = $(this).find('.sub-department-name').text();
                        subDepartmentSpans.append(`<span>${subDepartmentName}</span>`);
                    });

                    $('#editDepartmentModal').modal('hide');
                });

                // 更新二级科室序号
                function updateSubDepartmentNumbers() {
                    $('#sub-department-list tr').each(function (index) {
                        $(this).find('td:first').text(index + 1);
                    });
                }
            });
        </script>
    </form>
</body>
</html>
