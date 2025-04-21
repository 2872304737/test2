<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="paibanPage.aspx.cs" Inherits="gly.paibanPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>排班管理</title>
    <link rel="stylesheet" href="./css/common.css" />
    <link rel="stylesheet" href="./css/paibanPage.css" />
    <link rel="stylesheet" href="./css/bootstrap.min.css" />
    <script src="./js/jquery.js"></script>
    <script src="./js/popper.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <style>
        .import-button, .add-button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 4px;
        }

        form {
            display: flex;
            height: 100%;
            width: 100%;
        }
        .content-body {
            overflow-y: auto;
            box-sizing: border-box; /* 设置一个最大高度，以确保在内容过多时出现滚动条 */
            max-height: calc(100vh - 40px); /* 减去一些高度以考虑侧边栏和内边距等 */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager3" runat="server"></asp:ScriptManager>
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
            <div class="content-header" style="display: flex; justify-content: space-between; align-items: center;">
                <div class="addc">
                    <button class="import-button">导入</button>
                <button type="button" class="add-button" data-toggle="modal" data-target="#addDoctorModal">新增</button>
                <button id="haoyuanbutton" class="import-button">号源管理</button>
                </div>
                <div class="a">
                    <input type="text" id="searchIut" class="search-input" placeholder="搜索医生姓名" runat="server"/>
                    <button class="search-button btn btn-primary" id="searcutton">搜索</button>
                </div>
                
            </div>
            <div class="content-body">
                <table class="schedule-table">
                    <thead>
                        <tr>
                            <th>序号</th>
                            <th>医生</th>
                            <th>排班日期</th>
                            <th>上班时间</th>
                            <th>是否接诊</th>
                            <th>号源上限</th>
                            <th>操作</th>
                            <!-- 新增列 -->
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
                <div class="pagination">
                    <button type="button" data-action="prev">上一页</button>
                    <button type="button"  data-action="next">下一页</button>
                    <span>每页显示</span>
                    <select>
                        <option value="10">10条/页</option>
                        <option value="20">20条/页</option>
                        <option value="30">30条/页</option>
                    </select>
                </div>
            </div>
        </div>

        <!-- 号源管理模态框 -->
        <div class="modal fade" id="haoyuanModal" tabindex="-1" role="dialog" aria-labelledby="haoyuanModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="haoyuanModalLabel">修改时间段号源</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <div class="form-group">
                            <label for="haoyuan-date">选择日期:</label>

                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList OnTextChanged="DropDownList1_TextChanged1" ID="DropDownList1" runat="server" AutoPostBack="True"></asp:DropDownList>
                                    <div class="form-group">
                                        <label for="haoyuan-time">选择时间段:</label><asp:DropDownList ID="DropDownList2" runat="server" OnTextChanged="DropDownList2_TextChanged" AutoPostBack="True" Enabled="False"></asp:DropDownList>
                                        <div class="form-group">
                                            <label for="haoyuan-limit">号源上限:</label>
                                            <asp:TextBox ID="haoyuantextbox" Enabled="false" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>



                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>

                            <asp:Button ID="haoyuanquerenButton" OnClick="haoyuanquerenButton_Click" class="btn btn-primary" type="button" runat="server" Text="确认" />
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- 新增排班模态框 -->
        <div class="modal fade" id="addDoctorModal" tabindex="-1" role="dialog" aria-labelledby="addDoctorModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addDoctorModalLabel">新增排班</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <div class="form-group">
                                    <label for="department">所属科室:</label>
                                    <asp:DropDownList ID="xinzengDropDownList1" runat="server" OnTextChanged="xinzengDropDownList1_TextChanged" AutoPostBack="true"></asp:DropDownList>

                                </div>
                                <div class="form-group">
                                    <label for="sub-department">二级科室:</label>
                                    <asp:DropDownList ID="xinzengDropDownList2" OnTextChanged="xinzengDropDownList2_TextChanged" runat="server" Enabled="false" AutoPostBack="true"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label for="position">医生职位:</label>
                                    <asp:DropDownList ID="xinzengDropDownList3" runat="server" OnTextChanged="xinzengDropDownList3_TextChanged" Enabled="false" AutoPostBack="true"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label for="doctor-name">医生姓名:</label>
                                    <asp:DropDownList ID="xinzengDropDownList4" runat="server" Enabled="false" AutoPostBack="true"></asp:DropDownList>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>




                        <div class="form-group">
                            <label for="date">选择日期:</label>
                            <asp:HiddenField ID="selectedDate" runat="server" />
                            <select class="form-control" id="date" onchange="updateHiddenField()">
                                <!-- 日期选项将通过 JavaScript 动态生成 -->
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="time">上班时间:</label>
                            <select class="form-control" runat="server" id="time">
                                <option>08-10</option>
                                <option>10-12</option>
                                <option>13-15</option>
                                <option>15-17</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="limit">号源上限:</label>
                            <asp:TextBox class="form-control" ID="limit" runat="server">请输入</asp:TextBox>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>

                        <asp:Button ID="xinzengpaibanButton" type="button" class="btn btn-primary" OnClick="xinzengpaibanButton_Click" runat="server" Text="确定" />
                    </div>
                </div>
            </div>
        </div>
        <!-- 编辑排班模态框 -->
        <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <asp:HiddenField ID="cangnewysid" runat="server" />
                        <asp:HiddenField ID="cangysid" runat="server" />
                        <asp:HiddenField ID="cangpbid" runat="server" />
                        <asp:HiddenField ID="cangksid" runat="server" />
                        <h5 class="modal-title" id="editModalLabel">排班编辑</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="originalDoctor">原医生：</label>
                            <span id="originalDoctor"></span>
                        </div>
                        <div class="form-group">
                            <label for="newDoctor">新医生：</label>
                            <select class="form-control" id="newDoctor">
                                <option value="0">请选择</option>
                                <!-- 动态生成医生选项 -->
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>

                        <asp:Button ID="confirmEdit" type="button" class="btn btn-primary" OnClick="confirmEdit_Click" runat="server" Text="Button" />
                    </div>
                </div>
            </div>
        </div>



        <script>
            // 搜索按钮点击事件
            $('#searcutton').on('click', function (event) {
                event.preventDefault(); // 阻止默认行为

                var searchValue = $('#searchIut').val().toLowerCase();

                $('.content-body tbody tr').filter(function () {
                    $(this).toggle($(this).find('td:nth-child(2)').text().toLowerCase().indexOf(searchValue) > -1);
                });
            });

        // 回车键触发搜索
        $('#searchInput').keypress(function (e) {
            if (e.which === 13) { // 检测回车键
                $('#searchButton').click();
            }
        });

        $('#haoyuanbutton').click(function () {
            event.preventDefault(); // 阻止默认行为，防
            $('#DropDownList1').prop('selectedIndex', 0);
            $('#DropDownList2').prop('selectedIndex', 0);
            $('#DropDownList2').prop('disabled', true);
            $('#haoyuantextbox').prop('disabled', true);
            $('#haoyuantextbox').val('');
            $('#haoyuanModal').modal('show');
        });
        function chax(){
            // 数据渲染事件
            $.ajax({
                url: './处理程序/paibanPage.ashx',
                type: 'get',
                dataType: 'json',
                success: function (data) {
                    console.log(data);
                    var td = data.paiPanBLL;
                    var tbody = $('.schedule-table tbody');
                    tbody.empty(); // 清空现有的表格内容

                    td.forEach(function (department, index) {
                        console.log(department);

                        // 格式化排班日期
                        var formattedDate = new Date(department.排班日期).toLocaleDateString('zh-CN');

                        var newRow = `
                        <tr>
                            <td>${index + 1}<span style="display: none;">${department.排班ID}</span></td>
                            <td>${department.医生姓名}</td>
                            <td>${formattedDate}</td>
                            <td>${department.上班时间}<label style="display: none;">${department.医生ID}</label></td>
                            <td>${department.是否接诊}<span style="display: none;">${department.科室id}</span></td>
                            <td>${department.号源上限}</td>
                            <td>
                                <button class="edit-button" data-toggle="modal" data-target="#editModal" data-limit="15">编辑</button>
                                
                            </td>
                        </tr>
                    `;
                        tbody.append(newRow);
                    });
                }
            });
        }
        
            // 监听 newDoctor 下拉框的 change 事件
            $('#newDoctor').change(function () {
                var selectedValue = $(this).val();
                $('#<%= cangnewysid.ClientID %>').val(selectedValue); // 设置 HiddenField 的值
            });
            function updateHiddenField() {
                var selectedValue = document.getElementById('date').value;
                document.getElementById('<%= selectedDate.ClientID %>').value = selectedValue;
            }
            // 动态生成下个星期的日期选项
            $(document).ready(function () {
                var dateSelect = $('#date');
                var today = new Date();
                var dayOfWeek = today.getDay(); // 获取今天是星期几
                var daysUntilNextMonday = (8 - dayOfWeek) % 7; // 计算距离下个星期一的天数
                var nextMonday = new Date(today);
                nextMonday.setDate(today.getDate() + daysUntilNextMonday + 7); // 计算下个星期一的日期

                for (var i = 0; i < 7; i++) {
                    var date = new Date(nextMonday);
                    date.setDate(nextMonday.getDate() + i);
                    var year = date.getFullYear();
                    var month = ('0' + (date.getMonth() + 1)).slice(-2);
                    var day = ('0' + date.getDate()).slice(-2);
                    var dateString = year + '-' + month + '-' + day;
                    dateSelect.append('<option>' + dateString + '</option>');
                }



                $(document).ready(function () {
                    // 处理编辑按钮点击事件
                    $(document).on('click', '.edit-button', function () {
                        event.preventDefault(); // 阻止默认行为
                        var originalDoctor = $(this).closest('tr').find('td:nth-child(2)').text();
                        var doctorId = $(this).closest('tr').find('td:nth-child(4) label').text();
                        var pbid = $(this).closest('tr').find('td:nth-child(1) span').text();
                        var keshiid = $(this).closest('tr').find('td:nth-child(5) span').text();
                        $('#originalDoctor').text(originalDoctor);
                        $('#<%= cangysid.ClientID %>').val(doctorId); // 设置 HiddenField 的值
                        $('#<%= cangpbid.ClientID %>').val(pbid); // 设置 HiddenField 的值
                        $('#<%= cangysid.ClientID %>').val(keshiid); // 设置 HiddenField 的值
                        // 通过 AJAX 调用后端事件获取医生列表
                        $.ajax({
                            url: 'paibanPage.aspx/GetDoctorsByDepartment',
                            type: 'POST',
                            contentType: 'application/json; charset=utf-8',
                            dataType: 'json',
                            data: JSON.stringify({ ksid: keshiid }),
                            success: function (response) {
                                var doctors = response.d;
                                var doctorOptions = '<option>请选择</option>';
                                doctors.forEach(function (doctor) {
                                    doctorOptions += '<option value="' + doctor.DocID + '">' + doctor.Name + '</option>';
                                });
                                $('#newDoctor').html(doctorOptions);
                            },
                            error: function (error) {
                                console.log('Error:', error);
                            }
                        });

                        // 显示模态框
                        $('#editModal').modal('show');
                    });

                    // 处理模态框确认按钮点击事件
                    $('#confirmEdit').click(function () {
                        var newDoctor = $('#newDoctor').val();
                        if (newDoctor === '请选择') {
                            alert('请选择新医生');
                            return;
                        }
                        // 这里可以添加更新排班的逻辑
                        var doctorId = $('#<%= cangysid.ClientID %>').val(); // 获取 HiddenField 的值
                        console.log('原医生ID:', doctorId);
                        console.log('新医生:', newDoctor);
                        $('#editModal').modal('hide');
                    });
                });



            });


        </script>
    </form>
</body>
</html>
<script>
    $(document).ready(function () {
        var currentPage = 1;
        var pageSize = 10;

        function loadSchedules(page, size) {
            $.ajax({
                url: './处理程序/paibanPage.ashx',
                type: 'get',
                datatype: 'json',
                data: { page: page, size: size },
                success: function (data) {
                    console.log(data);
                    if (data.success) {
                        var schedules = data.paiPanBLL;
                        var tbody = $('.schedule-table tbody');
                        tbody.empty(); // 清空现有的表格内容

                        schedules.forEach(function (schedule, index) {
                            // 格式化排班日期
                            var formattedDate = new Date(schedule.排班日期).toLocaleDateString('zh-CN');

                            var newRow = `
                                <tr>
                                    <td>${index + 1 + (page - 1) * size}<span style="display: none;">${schedule.排班ID}</span></td>
                                    <td>${schedule.医生姓名}</td>
                                    <td>${formattedDate}</td>
                                    <td>${schedule.上班时间}<label style="display: none;">${schedule.医生ID}</label></td>
                                    <td>${schedule.是否接诊}<span style="display: none;">${schedule.科室id}</span></td>
                                    <td>${schedule.号源上限}</td>
                                    <td>
                                        <button class="edit-button" data-toggle="modal" data-target="#editModal" data-limit="15">编辑</button>
                                    </td>
                                </tr>
                            `;
                            tbody.append(newRow);
                        });
                    }
                }
            });
        }

        // 初始化加载第一页数据
        loadSchedules(currentPage, pageSize);

        // 处理分页按钮点击事件
        $('.pagination').on('click', 'button', function () {
            var action = $(this).data('action');
            if (action === 'prev' && currentPage > 1) {
                currentPage--;
            } else if (action === 'next') {
                currentPage++;
            }
            loadSchedules(currentPage, pageSize);
        });

        // 处理每页显示条数改变事件
        $('.pagination select').on('change', function () {
            pageSize = $(this).val();
            currentPage = 1; // 重置为第一页
            loadSchedules(currentPage, pageSize);
        });
    });
</script>
