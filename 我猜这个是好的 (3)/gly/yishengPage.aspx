<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="yishengPage.aspx.cs" Inherits="gly.yishengPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>医生管理</title>
    <link rel="stylesheet" href="css/common.css" />
    <link rel="stylesheet" href="css/yishengPage.css" />
    <script src="./js//jquery.js"></script>
    <script src="./js//popper.min.js"></script>
    <script src="./js//bootstrap.min.js"></script>
    <link rel="stylesheet" href="./css/bootstrap.min.css" />
    <link rel="stylesheet" href="./css/all.min.css" />
    <style>
        form {
            display: flex;
            height: 100%;
            width: 100%;
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
                <input type="text" id="searnput" placeholder="请输入医生姓名" runat="server" />
                <button class="search-button" id="searchinput">搜索</button>
                <button class="add-doctor" data-toggle="modal" data-target="#addDoctorModal">添加医生</button>

            </div>
            <div class="content-body">
                <table class="doctor-table">
                    <thead>
                        <tr>
                            <th>序号</th>
                            <th>姓名</th>
                            <th>医生头像</th>
                            <th>所属科室</th>
                            <th>所属二级科室</th>
                            <th>简介</th>
                            <th>费用</th>
                            <th>职位</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
                <div class="pagination">
                    <button data-action="prev">上一页</button>
                    <button data-action="next">下一页</button>
                    <span>每页显示</span>
                    <select>
                        <option value="10">10条/页</option>
                        <option value="20">20条/页</option>
                        <option value="30">30条/页</option>
                    </select>
                </div>
            </div>
        </div>

        <!-- 添加医生模态框 -->
        <div class="modal fade" id="addDoctorModal" tabindex="-1" role="dialog" aria-labelledby="addDoctorModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addDoctorModalLabel">添加医生</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="add-doctor-name" class="col-form-label">医生姓名:</label>
                            <input type="text" class="form-control" id="adddoctorname" placeholder="请输入医生姓名" runat="server" />
                        </div>
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <div class="form-group">
                                    <label for="add-department" class="col-form-label">所属科室:</label>
                                    <asp:DropDownList ID="addmentkeshi" OnTextChanged="addmentkeshi_TextChanged" AutoPostBack="true" runat="server">
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label for="add-sub-department" class="col-form-label">二级科室:</label>
                                    <asp:DropDownList ID="submitkeshi" AutoPostBack="true" runat="server">
                                    </asp:DropDownList>
                                </div>
                            </ContentTemplate>

                        </asp:UpdatePanel>

                        <div class="form-group">
                            <label for="add-doctor-jianjie" class="col-form-label">医生简介:</label>
                            <input type="text" class="form-control" id="adddoctorjianjie" placeholder="请输入医生简介" runat="server" />
                        </div>
                        <div class="form-group">
                            <label for="add-position" class="col-form-label">医生职位:</label>
                            <select class="form-control" id="addposition" runat="server">
                                <option>医师</option>
                                <option>专家</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="add-doctor-image" class="col-form-label">医生头像:</label>
                            <input type="file" class="form-control" id="adddoctorimage" runat="server" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                        <asp:Button type="button" ID="sactor" class="btn btn-primary" runat="server" Text="Button" OnClick="ysjjclic" />
                    </div>
                </div>
            </div>
        </div>

        <!-- 编辑医生模态框 -->
        <div class="modal fade" id="editDoctorModal" tabindex="-1" role="dialog" aria-labelledby="editDoctorModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editDoctorModalLabel">编辑医生</h5>
                        <asp:HiddenField ID="cangysid" runat="server" />
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="edit-doctor-name" class="col-form-label">医生姓名:</label>
                            <input type="text" class="form-control" id="editdoctorname" placeholder="请输入医生姓名" runat="server" />
                        </div>
                        <div class="form-group">
                            <label for="edit-doctor-jianjie" class="col-form-label">医生简介:</label>
                            <input type="text" class="form-control" id="eie" placeholder="请输入医生简介" runat="server" />
                        </div>
                        <div class="form-group">
                            <label for="edit-position" class="col-form-label">医生职位:</label>
                            <asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem>主治医师</asp:ListItem>
                                <asp:ListItem>专家</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="edit-doctor-image" class="col-form-label">医生头像:</label>
                            <input type="file" class="form-control" id="editimage" runat="server" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                        <asp:Button ID="butcas" type="button" class="btn btn-primary" runat="server" Text="Button" OnClick="bjys" />
                    </div>
                </div>
            </div>
        </div>

        <script>
            $(document).ready(function () {
                var currentRow; // 用于存储当前编辑的行

                // 使用AJAX从后台获取数据并动态渲染到页面
                $.ajax({
                    url: './处理程序/yishengPage.ashx',
                    type: 'get',
                    datatype: 'json',
                    success: function (response) {
                        console.log(response.yscha)
                        if (response.success) {
                            var doctors = response.yscha;
                            var tbody = $('.doctor-table tbody');
                            tbody.empty(); // 清空表格内容
                            var departments = new Set();
                            var subDepartments = {};

                            doctors.forEach((element, ele) => {
                                var newRow = `
                                    <tr>
                                        <td>${ele + 1}<span style="display:none;">${element.医生ID}</span></td>
                                        <td>${element.医生姓名}</td>
                                        <td><img src="${element.头像地址}" alt="医生头像"></td>
                                        <td>${element.所属科室}</td>
                                        <td>${element.二级科室}</td>
                                        <td>${element.简历}</td>
                                        <td>${element.就诊费用}</td>
                                        <td>${element.职位}</td>
                                        <td>
                                            <button class="edit-button" data-id="${element.医生ID}">编辑</button>
                                            <button class="delete-button" id="butty" data-id="${element.医生ID}">删除</button>
                                        </td>
                                    </tr>
                                `;
                                tbody.append(newRow);

                                // 收集主科室和副科室数据
                                //departments.add(element.所属科室);
                                //if (!subDepartments[element.所属科室]) {
                                //    subDepartments[element.所属科室] = new Set();
                                //}
                                //subDepartments[element.所属科室].add(element.二级科室);
                            });

                        }
                    }
                });

                // 处理搜索按钮点击事件
                $('.search-button').on('click', function (event) {
                    event.preventDefault(); // 阻止默认行为
                    
                    var searchValue = $('#searnput').val().toLowerCase();
                    
                    $('.doctor-table tbody tr').filter(function () {
                        $(this).toggle($(this).find('td:nth-child(2)').text().toLowerCase().indexOf(searchValue) > -1);
                    });
                });

                // 处理重置按钮点击事件
                $('.reset-button').on('click', function () {
                    $('#searchinput').val('');
                    $('.doctor-table tbody tr').show();
                });

                // 处理添加医生按钮点击事件
                $('.add-doctor').on('click', function () {
                    $('#addDoctorModalLabel').text('添加医生');
                    $('#addDoctorModal').modal('show');
                });

                // 处理编辑医生按钮点击事件
                $('.doctor-table').on('click', '.edit-button', function (event) {
                    event.preventDefault(); // 阻止默认行为
                    currentRow = $(this).closest('tr');
                    var doctorName = currentRow.find('td:nth-child(2)').text();
                    var department = currentRow.find('td:nth-child(4)').text();
                    var subDepartment = currentRow.find('td:nth-child(5)').text();
                    var position = currentRow.find('td:nth-child(8)').text();
                    var doctorImage = currentRow.find('td:nth-child(3) img').attr('src');
                    var jianjie = currentRow.find('td:nth-child(6)').text();
                    var ysid = currentRow.find('span').text();
                    $('#editdoctorname').val(doctorName);
                    $('#edit-department').val(department);
                    $('#edit-sub-department').val(subDepartment);
                    $('#edit-position').val(position);
                    $('#eie').val(jianjie);
                    // 不设置文件输入的值
                    $('#editimage').val('');

                    $('#editDoctorModalLabel').text('编辑医生');
                    $('#<%= cangysid.ClientID %>').val(ysid);
                    $('#editDoctorModal').modal('show');
                });

                // 处理保存添加医生按钮点击事件
                $('#sactor').on('click', function () {
                    var doctorName = $('#adddoctorname').val();
                    var department = $('#addmentkeshi').val();
                    var subDepartment = $('#submitkeshi').val();
                    var position = $('#adddoctorjianjie').val();
                    var subDepartment = $('#addposition').val();
                    var doctorImage = $('#adddoctorimage')[0].files[0]; // 获取文件对象



                    if (doctorName != null && department != null && subDepartment != null && position != null && doctorImage != null) {
                        //var reader = new FileReader();
                        //reader.onload = function (e) {
                        //    var imageUrl = e.target.result;

                        //    //var newRow = `
                        //    //    <tr>
                        //    //        <td></td>
                        //    //        <td>${doctorName}</td>
                        //    //        <td><img src="${imageUrl}" alt="医生头像"></td>
                        //    //        <td>${department}</td>
                        //    //        <td>${subDepartment}</td>
                        //    //        <td>${jianjie}</td>
                        //    //        <td>${position}</td>
                        //    //        <td>
                        //    //            <button class="edit-button">编辑</button>
                        //    //        </td>
                        //    //    </tr>
                        //    //`;
                        //    //$('.doctor-table tbody').append(newRow);
                        //    updateRowNumbers();
                        //    $('#addDoctorModal').modal('hide');
                        //    $('#add-doctor-form')[0].reset();
                        //};
                        //reader.readAsDataURL(doctorImage);
                    }
                });

                // 处理保存编辑医生按钮点击事件
                $('#butcas').on('click', function () {
                    var doctorName = $('#editdoctorname').val();
                    var department = $('#edit-department').val();
                    var subDepartment = $('#edit-sub-department').val();
                    var position = $('#edit-position').val();
                    var jianjie = $('#eie').val();
                    var doctorImage = $('#editimage')[0].files[0]; // 获取文件对象

                    if (doctorName && department && subDepartment && position) {
                        if (doctorImage) {
                            var reader = new FileReader();
                            reader.onload = function (e) {
                                var imageUrl = e.target.result;
                                currentRow.find('td:nth-child(3) img').attr('src', imageUrl);
                            };
                            reader.readAsDataURL(doctorImage);
                        }
                        currentRow.find('td:nth-child(2)').text(doctorName);
                        currentRow.find('td:nth-child(4)').text(department);
                        currentRow.find('td:nth-child(5)').text(subDepartment);
                        currentRow.find('td:nth-child(6)').text(jianjie);
                        currentRow.find('td:nth-child(8)').text(position);
                        $('#editDoctorModal').modal('hide');
                    } else {
                        alert('请填写完整的医生信息');
                    }
                });

                // 更新序号
                function updateRowNumbers() {
                    $('.doctor-table tbody tr').each(function (index) {
                        $(this).find('td:first').text(index + 1);
                    });
                }

                // 使用事件委托处理删除按钮的点击事件
                $('.doctor-table').on('click', '.delete-button', function () {
                    var noticeId = $(this).data('id');
                    $.ajax({
                        type: 'POST',
                        url: 'yishengPage.aspx/DeleteAn',
                        data: JSON.stringify({ noticeId: noticeId }),
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (response) {
                            alert(response.d);
                            // 重新加载公告数据
                            location.reload();
                        },
                        error: function (error) {
                            console.error(error);
                            alert('删除失败');
                        }
                    });
                });
            });
        </script>
    </form>
</body>
</html>
<script>
    $(document).ready(function () {
        // 阻止按钮的默认行为
        $('button').on('click', function (event) {
            event.preventDefault();
        });

        // 其他现有代码...
    });
</script>
<script>
    $(document).ready(function () {
        var currentPage = 1;
        var pageSize = 10;

        function loadDoctors(page, size) {
            $.ajax({
                url: './处理程序/yishengPage.ashx',
                type: 'get',
                datatype: 'json',
                data: { page: page, size: size },
                success: function (response) {
                    console.log(response.yscha)
                    if (response.success) {
                        var doctors = response.yscha;
                        var tbody = $('.doctor-table tbody');
                        tbody.empty(); // 清空表格内容
                        var departments = new Set();
                        var subDepartments = {};

                        doctors.forEach((element, ele) => {
                            var newRow = `
                                <tr>
                                    <td>${ele + 1 + (page - 1) * size}<span style="display:none;">${element.医生ID}</span></td>
                                    <td>${element.医生姓名}</td>
                                    <td><img src="${element.头像地址}" alt="医生头像"></td>
                                    <td>${element.所属科室}</td>
                                    <td>${element.二级科室}</td>
                                    <td>${element.简历}</td>
                                    <td>${element.就诊费用}</td>
                                    <td>${element.职位}</td>
                                    <td>
                                        <button class="edit-button" data-id="${element.医生ID}">编辑</button>
                                        <button class="delete-button" id="butty" data-id="${element.医生ID}">删除</button>
                                    </td>
                                </tr>
                            `;
                            tbody.append(newRow);

                            // 收集主科室和副科室数据
                            //departments.add(element.所属科室);
                            //if (!subDepartments[element.所属科室]) {
                            //    subDepartments[element.所属科室] = new Set();
                            //}
                            //subDepartments[element.所属科室].add(element.二级科室);
                        });

                        // 渲染主科室下拉框
                        //var departmentSelect = $('#addment');
                        //departmentSelect.empty();
                        //departmentSelect.append('<option value="">请选择科室</option>');
                        //departments.forEach(function (department) {
                        //    departmentSelect.append('<option value="' + department + '">' + department + '</option>');
                        //});

                        //// 当主科室下拉框值改变时，加载对应的副科室
                        //$('#addment').on('change', function () {
                        //    var department = $(this).val();
                        //    var subDepartmentSelect = $('#submit');
                        //    subDepartmentSelect.empty();
                        //    subDepartmentSelect.append('<option value="">请选择二级科室</option>');
                        //    if (subDepartments[department]) {
                        //        subDepartments[department].forEach(function (subDepartment) {
                        //            subDepartmentSelect.append('<option value="' + subDepartment + '">' + subDepartment + '</option>');
                        //        });
                        //    }
                        //});
                    }
                }
            });
        }

        // 初始化加载第一页数据
        loadDoctors(currentPage, pageSize);

        // 处理分页按钮点击事件
        $('.pagination').on('click', 'button', function () {
            var action = $(this).data('action');
            if (action === 'prev' && currentPage > 1) {
                currentPage--;
            } else if (action === 'next') {
                currentPage++;
            }
            loadDoctors(currentPage, pageSize);
        });

        // 处理每页显示条数改变事件
        $('.pagination select').on('change', function () {
            pageSize = $(this).val();
            currentPage = 1; // 重置为第一页
            loadDoctors(currentPage, pageSize);
        });
    });
</script>
