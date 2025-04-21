<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="news.aspx.cs" Inherits="hz.news" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>账号登录</title>
     <style>
    :root {
        --primary-color: #0a5247;
        --accent-color: #30aa97;
        --text-light: rgba(255, 255, 255, 0.85);
        --text-white: #fff;
        --transition-speed: 0.4s;
        --spacing-lg: 50px;
        --spacing-md: 30px;
        --spacing-sm: 20px;
    }

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'PingFang SC', 'Microsoft YaHei', sans-serif;
        line-height: 1.6;
        background-color: #f8f9fa;
    }

    .hospital-footer {
        background: var(--primary-color);
        padding: var(--spacing-lg) var(--spacing-sm) var(--spacing-md);
        position: relative;
        overflow: hidden;
    }

    .footer-container {
        max-width: 1200px;
        margin: 0 auto;
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: var(--spacing-md);
        opacity: 0;
        transform: translateY(30px);
        animation: fadeInUp 0.6s var(--transition-speed) forwards;
    }

    @keyframes fadeInUp {
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .footer-column {
        perspective: 1000px;
    }

    .footer-column:nth-child(1) { animation-delay: 0.1s; }
    .footer-column:nth-child(2) { animation-delay: 0.2s; }
    .footer-column:nth-child(3) { animation-delay: 0.3s; }
    .footer-column:nth-child(4) { animation-delay: 0.4s; }

    .footer-column h3 {
        color: var(--text-white);
        font-size: 18px;
        font-weight: 600;
        margin-bottom: var(--spacing-sm);
        padding-bottom: 10px;
        border-bottom: 2px solid rgba(255, 255, 255, 0.3);
        position: relative;
    }

    .footer-column h3::after {
        content: '';
        position: absolute;
        left: 0;
        bottom: -2px;
        width: 50px;
        height: 2px;
        background: var(--accent-color);
        transition: width var(--transition-speed) ease-out;
    }

    .footer-column:hover h3::after {
        width: 100%;
    }

    .footer-column ul {
        list-style: none;
    }

    .footer-column li {
        margin-bottom: 12px;
        transform: translateZ(0);
        transition: transform var(--transition-speed);
    }

    .footer-column li:hover {
        transform: translateZ(10px);
    }

    .footer-column a {
        color: var(--text-light);
        text-decoration: none;
        transition: all var(--transition-speed) cubic-bezier(0.25, 0.8, 0.25, 1);
        display: inline-block;
        position: relative;
        padding: 4px 0;
    }

    .footer-column a:hover {
        color: var(--text-white);
        transform: translateX(8px);
    }

    .footer-column a::before {
        content: '→';
        position: absolute;
        left: -15px;
        opacity: 0;
        transition: all var(--transition-speed);
        color: var(--accent-color);
    }

    .footer-column a:hover::before {
        opacity: 1;
        left: -12px;
    }

    .footer-info {
        text-align: center;
        color: var(--text-light);
        font-size: 14px;
        margin-top: 40px;
        padding-top: var(--spacing-sm);
        border-top: 1px solid rgba(255, 255, 255, 0.1);
        animation: fadeIn 0.8s 0.8s both;
    }

    @keyframes fadeIn {
        from { opacity: 0; }
        to { opacity: 1; }
    }

    .glass-effect {
        position: absolute;
        width: 200px;
        height: 200px;
        background: rgba(255, 255, 255, 0.05);
        border-radius: 50%;
        filter: blur(30px);
        z-index: 0;
    }

    .glass-effect:nth-child(1) {
        top: -50px;
        right: -50px;
    }

    .glass-effect:nth-child(2) {
        bottom: 20%;
        left: 10%;
    }

    @media (max-width: 768px) {
        .footer-container {
            grid-template-columns: 1fr;
            gap: 40px;
        }
        
        .footer-column h3 {
            font-size: 16px;
        }

        .glass-effect {
            display: none;
        }
        .hospital-footer {
    background: transparent;
    box-shadow: 0 -5px 30px rgba(0,0,0,0.03);
}
    }
</style>
    <link rel="stylesheet" href="./css/bootstrap.min.css" />
    <link rel="stylesheet" href="./css/news.css" />
    <!-- 公共样式表 -->
    <link rel="stylesheet" href="./css/base.css" />
    <!-- 颜色样式表 -->
    <link rel="stylesheet" href="/css/theme.css" />
    <!-- bootstrap框架 -->
    <script src="./js/bootstrap.bundle.min.js"></script>
    <script src="./js/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <span id="onlyone" style="display: none"></span>
        <!-- 顶部导航栏 -->
        <div class="top">
            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                <div class="container-fluid">
                    <a class="navbar-brand" href="index.aspx">
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
            <img class="public" src="./imgs/新闻.jpg" alt="" />
        </div>
        <!-- 中心导航栏 -->
        <div class="news-nav page-container">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="./index.aspx">首页</a></li>
                    <li class="breadcrumb-item"><a href="#">预约挂号</a></li>
                    <li class="breadcrumb-item active" aria-current="page"></li>
                </ol>
            </nav>
        </div>

        <div class="news-context page-container" id="newscontext">
            <!-- 左侧导航条 -->
            <div class="news-left">
                <div class="list-group" id="list-tab" role="tablist">
                    <div class="list-group" id="departmentList">
                        <a class="list-group-item list-group-item-action" data-sub-department="1">ahh</a>
                        <a class="list-group-item list-group-item-action" data-sub-department="2">ahh</a>
                        <!-- 一级科室内容将动态插入 -->
                    </div>

                    <ul class="list-group" id="subDepartmentList">
                        <!-- 二级科室内容将动态插入 -->
                    </ul>
                </div>
            </div>
            <!-- 右侧内容显示 -->
            <div class="news-right">
                <div class="tab-content form-container" id="nav-tabContent">
                    <div class="tab-pane fade" id="list-doctors" role="tabpanel" aria-labelledby="list-doctors-list">
                        <!-- 医生选择内容 -->
                        <h3 id="selectedSubDepartment"></h3>
                        <span id="tyid" style="display: none"></span>
                        <span id="timenow" style="display: none"></span>
                        <div class="doctorschedule" id="dateday">
                            <table class="table table-bordered text-center">
                                <thead class="thead-light">
                                    <tr id="week">
                                        <%--动态加--%>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr id="day">
                                        <%--动态加--%>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="doctor-list" id="doctorList">
                            <!-- 医生信息将动态插入 -->
                        </div>
                    </div>
                    <%--医生预约--%>
                    <div class="yisheng">
                        <div class="doctor-info-card">
                            <img src="doctor.jpg" alt="医生头像" class="doctor-avatar" />
                            <div class="doctor-details">
                                <h3>彭苗苗</h3>
                                <p>职称：<span id="postion"></span></p>
                                <p id="js">擅长：擅长糖尿病病、甲状腺疾病、肥胖及其代谢综合征的诊治</p>
                                <p style="display: none" id="yhid"><span id="nowtime" style="display: none"></span></p>
                            </div>
                        </div>
                        <%--预约时间--%>
                        <div class="appointment-info">
                            <%--<h4>预约信息</h4>
                            <div class="appointment-item">
                                <span>预约时间段：14:30-15:30</span>
                                <span>余号：5</span>
                                <span>价格：¥18.5</span>
                                <button class="btn btn-primary btn-sm">预约挂号</button>
                            </div>--%>
                        </div>
                    </div>
                    <%--挂号确认--%>
                    <div class="confirmation">
                        <h2>挂号确认</h2>
                        <p><strong>医生姓名：</strong><span id="confirmationDoctorName"></span></p>
                        <p><strong>医生职称：</strong><span id="confirmationDoctorPosition"></span></p>
                        <p><strong>就诊科室：</strong><span id="confirmationDepartment"></span></p>
                        <p><strong>就诊日期：</strong><span id="confirmationDate"></span></p>
                        <p><strong>挂号费：</strong><span id="confirmationFee"></span></p>
                        <p>
                            <strong>就诊人：</strong>
                            <select name="就诊人" id="posid">
                                <option value="1">本人</option>
                                <option value="2">家人</option>
                                <option value="3">朋友</option>
                            </select>
                        </p>
                        <div class="d-flex mt-3">
                            <button class="btn btn-secondary me-5" onclick="hideConfirmation()">上一步</button>
                            <span class="mx-5"><span style="display: none" id="numberid"></span></span>
                            <button class="btn btn-primary ms-5" onclick="cs()">挂号确认</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 底部 -->
        <div class="footer">
  <footer class="hospital-footer">
      <div class="glass-effect"></div>
      <div class="glass-effect"></div>
      
      <div class="footer-container">
          <div class="footer-column">
              <h3>About Us</h3>
              <ul>
                  <li><a href="#">医院简介</a></li>
                  <li><a href="#">领导团队</a></li>
                  <li><a href="#">医院文化</a></li>
                  <li><a href="#">发展历程</a></li>
              </ul>
          </div>
          
          <div class="footer-column">
              <h3>Medical Services</h3>
              <ul>
                  <li><a href="#">预约挂号</a></li>
                  <li><a href="#">科室导航</a></li>
                  <li><a href="#">专家团队</a></li>
                  <li><a href="#">出诊信息</a></li>
              </ul>
          </div>

          <div class="footer-column">
              <h3>Health Info</h3>
              <ul>
                  <li><a href="#">健康科普</a></li>
                  <li><a href="#">疾病防治</a></li>
                  <li><a href="#">养生保健</a></li>
                  <li><a href="#">视频讲堂</a></li>
              </ul>
          </div>

          <div class="footer-column">
              <h3>Contact</h3>
              <ul>
                  <li><a href="#">地址导航</a></li>
                  <li><a href="#">交通指南</a></li>
                  <li><a href="#">联系方式</a></li>
                  <li><a href="#">意见反馈</a></li>
              </ul>
          </div>
      </div>

      <div class="footer-info">
          e诊云窗<br>
          最后更新时间为2025-04-11 ，星期五<br>
      </div>
        </footer>
</div>

        <script>
            //订单确认
            function cs() {
                // 判断是否有任何参数
                $.ajax({
                    url: './处理程序/ysjj.ashx',
                    type: 'post',
                    data: {
                        partin: $("#posid").val(),
                        numid: $("#numberid").text()
                    },
                    dataType: 'json',
                    success: function (response) {
                        console.log(response.yue)
                        alert(response.success);
                        if (response.success) {

                            // 调用后端事件
                            // 调试输出参数值
                            console.log("参数值：", {
                                shijian: $("#confirmationDate").text(),
                                keshi: $("#confirmationDepartment").text(),
                                yisheng: $("#confirmationDoctorName").text()
                            });
                            $.ajax({
                                type: "POST",
                                url: "/news.aspx/AfterAppointmentSuccess",
                                data: JSON.stringify({ shijian: $("#confirmationDate").text(), keshi: $("#confirmationDepartment").text(), yisheng: $("#confirmationDoctorName").text() }),
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (response) {
                                    console.log("后端发送邮件调用成功");
                                    alert("进入成功");
                                },
                                error: function (xhr, status, error) {
                                    console.log("后端发送邮件调用失败: " + error);
                                    alert("进入失败");
                                }

                            });
                            $('.confirmation').hide();
                            $('#subDepartmentList').hide();
                            alert('预约成功');
                        }
                        else {
                            alert("预约失败");
                        }
                    }
                });
            };
            //登录验证
            async function checkSession() {
                try {
                    const response = await fetch('./处理程序/CheckSession.ashx', {
                        method: 'GET',
                        credentials: 'same-origin'
                    });

                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }

                    const data = await response.json();

                    if (data.sessionExists) {
                        console.log('Session is active');
                        $("#onlyone").text(data.id);
                        return true;
                    } else {
                        console.log('Session has expired');
                        return false;
                    }
                } catch (error) {
                    console.error('There was a problem with the fetch operation:', error);
                    return false;
                }
            }
            //最右侧导航栏
            $.ajax({
                url: './处理程序/news.ashx',
                type: 'get',
                data: {
                    TypeID: 0
                },
                datatype: 'json',
                success: function (response) {
                    console.log(response.onetype)
                    if (response.success) {
                        var doctors = response.onetype;
                        var $subDepartmentList = $('#departmentList');
                        $subDepartmentList.empty();
                        doctors.forEach((element, ele) => {
                            $subDepartmentList.append(`<a class="list-group-item list-group-item-action" data-sub-department="${element.TypeID}">${element.Name}</a>`)
                        })
                    }
                }
            })
            $(function () {
                //医生
                $('.yisheng').hide();
                //挂号确认
                $('.confirmation').hide();
                //医生的日期
                $('.doctorschedule1').hide();
                // 一级科室点击事件
                $(document).on('click', '#departmentList .list-group-item', function () {
                    (async () => {
                        const isSessionValid = await checkSession();
                        if (!isSessionValid) {
                            alert("请登录!");
                            window.location.href = '../geren.aspx?pid=1';
                        }
                        else {
                            $('#departmentList .list-group-item').removeClass('selected-department');
                            $(this).addClass('selected-department');
                            var subDepartment = $(this).data('sub-department');
                            Rosters(subDepartment);
                            $('#subDepartmentList').css({
                                'position': 'absolute',
                                'left': $(this).offset().left + $(this).outerWidth(),
                                'top': $('#departmentList').offset().top,
                                'z-index': 1000,
                                'display': 'block'
                            });
                        }
                    })();
                });

                // 二级科室点击事件
                $(document).on('click', '#subDepartmentList .list-group-item', function () {
                    var subDepartment = $(this).text();
                    var tyid = $(this).data('sub-department');
                    $('#selectedSubDepartment').text(subDepartment);
                    $("#tyid").text(tyid);
                    dates(0, 0);
                    var $doctorList = $('#list-doctors #doctorList')
                    $doctorList.empty();
                    $('#nav-tabContent .tab-pane').removeClass('show active');
                    $('#list-doctors').addClass('show active');
                    $('#subDepartmentList').hide();
                    $('.yisheng').hide();
                    $('.doctorschedule').show();
                    $('.confirmation').hide();
                });

                //日期点击事件
                $(document).on('click', '#dateday .status', function () {
                    $(this).siblings().css("background-color", "white");
                    $(this).css("background-color", "gainsboro");
                    var id = $("#tyid").text();
                    var day = $(this).text();
                    $('#timenow').text(day);
                    if ($('.yisheng').is(':visible')) {
                        var yhid = $('.yisheng').find("#yhid").text();
                        docday(day, id, yhid, 0);
                    }
                    else {
                        dates(day, id);
                    }
                })

                //医生信息预约点击事件
                $(document).on('click', '.doctor-info #ahh', function (event) {
                    event.preventDefault();
                    $('.yisheng').show();
                    $('.doctor-item').hide();
                    $('.yisheng').find('h3').text($(this).parents(".doctor-info").find('h4').text());
                    $('.yisheng').find('img').attr('src', $(this).parents(".doctor-info").find('img').attr('src'));
                    $('.yisheng').find('#postion').text($(this).parents(".doctor-info").find('#post').text());
                    $('.yisheng').find('#js').text($(this).parents(".doctor-info").find('#jj').text());
                    $('.yisheng').find('#yhid').text($(this).parents(".doctor-info").find('#docid').text());
                    var yh = $(this).parents('.doctor-info').find("#docid").text();
                    var day = $('#timenow').text();
                    var id = $("#tyid").text();
                    docday(day, id, yh, 0);
                });
                //

                //ajax右侧科室
                function Rosters(id) {
                    $.ajax({
                        url: './处理程序/news.ashx',
                        type: 'get',
                        data: {
                            TypeID: id
                        },
                        datatype: 'json',
                        success: function (response) {
                            console.log(response.onetype)
                            if (response.success) {
                                var doctors = response.onetype;
                                var $subDepartmentList = $('#subDepartmentList');
                                $subDepartmentList.empty();
                                doctors.forEach((element, ele) => {
                                    $subDepartmentList.append(`<a class="list-group-item list-group-item-action" data-sub-department="${element.TypeID}">${element.Name}</a>`)
                                })
                            }
                        }
                    })
                }
                //ajax做查看日期和科室
                function dates(day, id) {
                    $.ajax({
                        url: './处理程序/dateday.ashx',
                        type: 'get',
                        data: {
                            date: day,
                            type: id,
                            _: new Date().getTime() // 添加时间戳
                        },
                        cache: false, // 禁用缓存
                        datatype: 'json',
                        success: function (response) {
                            console.log(response.da)
                            if (response.success) {
                                var doctors = response.da;
                                if (day != 0) {
                                    var $doctorList = $('#list-doctors #doctorList')
                                    $doctorList.empty();
                                    doctors.forEach(function (doctor) {
                                        var doctorHtml = '<div class="doctor-item">' +
                                            '<img src="' + doctor.Avatar + '" alt="' + doctor.Name + '" class="doctor-avatar">' +
                                            '<div class="doctor-info">' +
                                            '<h4>' + doctor.Name + '</h4>' +
                                            '<p id="post">' + doctor.Position + '</p>' +
                                            '<p>' + doctor.sl + '</p>' +
                                            '<p style="display:none" id=jj>' + doctor.Resume + '</p>' +
                                            '<span id=docid style="display:none">' + doctor.DocID + '</span>' +
                                            '<button class="btn btn-primary btn-sm" id="ahh">预约挂号</button>' +
                                            '</div>' +
                                            '</div>';
                                        $doctorList.append(doctorHtml);
                                    });
                                }
                                else {
                                    var $doctorList = $('#list-doctors #dateday').find("#week");
                                    var $doctorLis = $('#list-doctors #dateday').find("#day");
                                    $doctorList.empty();
                                    $doctorLis.empty();
                                    doctors.forEach(function (dayt) {
                                        $doctorList.append(`<th>${dayt.week}</th>`);
                                        $doctorLis.append(`<td class="status available">${dayt.Data}<br/>`);
                                    })
                                }
                            }
                        }
                    })

                }
                //ajsx医生详细(时间，科室，医生)
                function docday(doc, tyid, id, cid) {
                    $.ajax({
                        url: './处理程序/yuyue1.ashx',
                        type: 'get',
                        data: {
                            date: doc,
                            type: tyid,
                            ID: id,
                            cid: cid
                        },
                        datatype: 'json',
                        success: function (response) {
                            console.log(response.yue)
                            if (response.success) {
                                var doctors = response.yue;
                                var $doctorList = $('.yisheng .appointment-info');
                                $doctorList.empty();
                                doctors.forEach(function (dayt) {
                                    var doctorHtml = ' <div class="appointment-item">' +
                                        '<span>预约时间段<span class="xdtime"> ' + dayt.one + '-' + dayt.two + '</span></span>' +
                                        '<span class="sets">余号：' + dayt.num + '</span>' +
                                        '<span>价格：¥' + '<span class="moneyj"> ' + dayt.Money + '</span></span>' +
                                        '<span style = "display: none" class="numid">' + dayt.ID + '</span>' +
                                        '<button class="btn btn-primary btn-sm">预约挂号</button>' +
                                        '</div>';
                                    $doctorList.append(doctorHtml);
                                })

                            }
                        }
                    })
                }
                //ajax


                //挂号配套
                function showConfirmation(doctorName, doctorPosition, department, date, fee) {

                    $('#confirmationDoctorName').text(doctorName);
                    $('#confirmationDoctorPosition').text(doctorPosition);
                    $('#confirmationDepartment').text(department);
                    $('#confirmationDate').text(date);
                    $('#confirmationFee').text(fee);
                    $('.confirmation').show();
                }

                //挂号点击事件
                $(document).on('click', '.appointment-item .btn-primary', function () {
                    if ($(this).parent().find(".sets").text() == "余号：0") {
                        alert("今日无订单");
                        return false;
                    }
                    var text = null;
                    $("#day").find("td").each(function () {
                        if ($(this).css('background-color') !== 'rgb(255, 255, 255)' && $(this).css('background-color') !== '#ffffff') {
                            text = $(this).text();
                            return false;
                        }
                    })
                    $.ajax({
                        url: './处理程序/patient.ashx',
                        type: 'get',
                        data: {
                            id: $("#onlyone").text()
                        },
                        datatype: 'json',
                        success: function (response) {
                            console.log(response.yue)
                            if (response.success) {
                                var doctors = response.yue;
                                var $subDepartmentList = $('#posid');
                                $subDepartmentList.empty();
                                doctors.forEach((jzr) => {
                                    $subDepartmentList.append(`<option value="${jzr.PatientID}">${jzr.Name}</option>`)
                                })
                            }
                        }
                    })
                    $("#numberid").text($(this).siblings('.numid').text())
                    var doctorName = $(".doctor-details").find("h3").text(); // 从医生姓名
                    var doctorPosition = $(".doctor-details").find("#postion").text(); // 从医生职称
                    var department = $("#selectedSubDepartment").text(); // 从医生科室
                    var date = text + $(this).parents(".appointment-item").find(".xdtime").text(); // 从预约时间
                    var fee = '¥' + $(this).parents(".appointment-item").find(".moneyj").text(); // 从预约金额
                    showConfirmation(doctorName, doctorPosition, department, date, fee);
                    $('.confirmation').show();
                    $('.yisheng').hide();
                    $('.doctorschedule').hide();
                    $('#selectedSubDepartment').hide();
                    $('#subDepartmentList').hide();
                    event.preventDefault();
                });
            });
            //挂号返回上一步
            function hideConfirmation() {
                event.preventDefault();
                $('.confirmation').hide();
                $('.yisheng').show();
                $('.doctorschedule').show();
                $('#selectedSubDepartment').show();
                $('#subDepartmentList').hide();
            }
        </script>
    </form>
</body>
</html>
