<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="gly.HomePage1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>医院管理系统首页</title>
<link rel="stylesheet" href="css/common.css"/>
<link rel="stylesheet" href="css/HomePage.css"/>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="./css/bootstrap.min.css"/>
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
        <h1>医院挂号后台管理系统</h1>
        <div class="stats">
            <div class="stat-item">
                <h3>用户总人数</h3>
                <p id="totalUsers">加载中...</p>
            </div>
            <div class="stat-item">
                <h3>医生总人数</h3>
                <p id="totalDoctors">加载中...</p>
            </div>
            <div class="stat-item">
                <h3>医院今日挂号数量</h3>
                <p id="todayRegistrations">加载中...</p>
            </div>
            <div class="stat-item">
                <h3>医院今日挂号收入</h3>
                <p id="todayRevenue">加载中...</p>
            </div>
        </div>
    </div>
    <div class="content-body">
        <div class="quick-access">
            <div class="quick-access-item">
                <a href="#">公告管理</a>
            </div>
            <div class="quick-access-item">
                <a href="#">医生管理</a>
            </div>
            <div class="quick-access-item">
                <a href="#">订单管理</a>
            </div>
        </div>
        <div class="charts">
            <div class="chart-item">
                <h3>近月科室预约情况</h3>
                <div id="monthlyAppointments" style="width: 100%; height: 400px;"></div>
            </div>
            <div class="chart-item">
                <h3>用户挂号科室比例</h3>
                <div id="departmentRatio" style="width: 100%; height: 400px;"></div>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        // 近月科室预约情况
    var monthlyAppointmentsChart = echarts.init(document.getElementById('monthlyAppointments'));
    var monthlyAppointmentsOption = {
        title: {
            text: '近月科室预约情况',
            left: 'center'
        },
        xAxis: {
            type: 'category',
            data: ['2025-03-01', '2025-03-02', '2025-03-03', '2025-03-04', '2025-03-05']
        },
        yAxis: {
            type: 'value'
        },
        series: [{
            name: '预约数量',
            data: [10, 15, 20, 25, 30],
            type: 'line'
        }]
    };
    monthlyAppointmentsChart.setOption(monthlyAppointmentsOption);

    // 用户挂号科室比例
    var departmentRatioChart = echarts.init(document.getElementById('departmentRatio'));
    var departmentRatioOption = {
        title: {
            text: '用户挂号科室比例',
            left: 'center'
        },
        tooltip: {
            trigger: 'item'
        },
        legend: {
            orient: 'vertical',
            left: 'left'
        },
        series: [{
            name: '挂号比例',
            type: 'pie',
            radius: '50%',
            data: [
                { value: 335, name: '心血管科' },
                { value: 310, name: '消化科' },
                { value: 234, name: '呼吸科' },
                { value: 135, name: '妇科' },
                { value: 154, name: '儿科' },
                { value: 104, name: '皮肤科' },
                { value: 80, name: '耳鼻喉科' }
            ],
            emphasis: {
                itemStyle: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        }]
    };
    departmentRatioChart.setOption(departmentRatioOption);
        $.ajax({
            url: './处理程序/HomePage.ashx',
            type: 'get',
            dataType: 'json',
            success: function (response) {
                console.log(response)
                if (response.success) {
                    $('#totalUsers').text(response.totalUsers[0].Column1)
                    $('#totalDoctors').text(response.totalDoctors[0].Column1)
                    $('#todayRegistrations').text(response.todayRegistrations[0].Column1)
                    $('#todayRevenue').text(response.todayRevenue[0].Column1)
                }
                else {
                    alert("数据加载失败")
                }
            }
        })
    })
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
<script src="js/echarts.min.js"></script>
