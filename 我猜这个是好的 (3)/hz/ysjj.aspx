<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ysjj.aspx.cs" Inherits="hz.ysjj" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>医生简介</title>
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
    <link rel="stylesheet" href="./css/bootstrap.min.css"/>
    <!-- 公共样式表 -->
    <link rel="stylesheet" href="./css/base.css"/>
    <!-- 颜色样式表 -->
    <link rel="stylesheet" href="/css/theme.css"/>
    <!-- bootstrap框架 -->
    <script src="./js/bootstrap.bundle.min.js"></script>
    <script src="./js/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- 顶部导航栏 -->
<div class="top">
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.aspx"><img src="./imgs/zjs.jpg" alt=""/>logo</a>
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
            <li class="breadcrumb-item"><a href="#">医生简介</a></li>
            <li class="breadcrumb-item active" aria-current="page"></li>
        </ol>
    </nav>
</div>
<div class="container">
    <div class="row" id="doctorList">
        <!-- 医生信息将动态插入 -->
    </div>
    <!-- 医生信息模态框 -->
    <div class="modal fade" id="addDoctorModal" tabindex="-1" role="dialog" aria-labelledby="addDoctorModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addDoctorModalLabel">医生信息</h5>
                </div>
                <div class="modal-body">
                    <form id="add-doctor-form">

                        <div class="form-group">
                            <label for="sub-department" class="col-form-label">科室：</label>
                            <label class="erjikeshi"></label>
                        </div>
                        <div class="form-group">
                            <label for="position" class="col-form-label">医生简介:</label>
                            <label class="yishengjianjie"></label>

                        </div>
                    </form>
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
    </form>
</body>
</html>
<script>
    $(function () {
        var subDepartment = '皮肤内科';
        var doctors = getDoctors(subDepartment);
        var $doctorList = $('#doctorList');
        $doctorList.empty();
        doctors.forEach(function (doctor) {
            var doctorHtml = '<div class="doctor-item col-lg-4 col-md-6 mb-4">' +
                '<div class="card">' +
                '<img src="' + doctor.avatar + '" alt="' + doctor.name + '" class="card-img-top doctor-avatar">' +
                '<div class="card-body">' +
                '<h5 class="card-title">' + doctor.name + '</h5>' +
                '<p class="card-text">' + doctor.position + '</p>' +
                '<p class="card-text">' + doctor.description + '</p>' +
                '</div>' +
                '</div>' +
                '</div>';
            $doctorList.append(doctorHtml);
        });


        $(".card").click(function () {
            $(".erjikeshi").text("医生科室")
            $(".yishengjianjie").text("医生简介")
            $('#addDoctorModal').modal('show');

        })


    });

    function getDoctors(subDepartment) {
        var doctors = {
            '皮肤内科': [
                { name: '张医生', position: '主治医师', description: '擅长皮肤病治疗', avatar: './imgs/doctor1.jpg' },
                { name: '李医生', position: '副主治医师', description: '擅长皮肤美容', avatar: './imgs/doctor2.jpg' },
                { name: '李医生', position: '副主治医师', description: '擅长皮肤美容', avatar: './imgs/doctor2.jpg' },
                { name: '李医生', position: '副主治医师', description: '擅长皮肤美容', avatar: './imgs/doctor2.jpg' }
            ],
            '呼吸与重症医学科': [
                { name: '王医生', position: '主治医师', description: '擅长呼吸系统疾病', avatar: './imgs/doctor3.jpg' },
                { name: '赵医生', position: '副主治医师', description: '擅长重症监护', avatar: './imgs/doctor4.jpg' }
            ],
            // 其他二级科室的医生信息
        };
        return doctors[subDepartment] || [];
    }
</script>