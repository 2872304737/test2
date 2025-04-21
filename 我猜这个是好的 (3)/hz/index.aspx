<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="hz.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    
    <title>e诊云窗</title>
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
    /* 新增动画样式 */
@keyframes itemEntrance {
    from { transform: translateY(20px); opacity: 0; }
    to { transform: translateY(0); opacity: 1; }
}

@keyframes iconRotate {
    from { transform: rotate(0deg); }
    to { transform: rotate(360deg); }
}

.banner {
    animation: pageEntrance 0.6s ease-out;
}

.menu-item {
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
    cursor: pointer;
    animation: itemEntrance 0.5s ease-out backwards;
}

.menu-item:hover {
    transform: scale(1.05);
    box-shadow: 0 5px 15px rgba(0,0,0,0.3);
    z-index: 2;
}

.menu-item:hover i {
    animation: iconRotate 0.6s ease;
}

.menu-item:nth-child(1) { animation-delay: 0.2s; }
.menu-item:nth-child(2) { animation-delay: 0.4s; }
.menu-item:nth-child(3) { animation-delay: 0.6s; }
.menu-item:nth-child(4) { animation-delay: 0.8s; }

.banner_right img {
    transition: transform 0.5s ease;
    transform-origin: center;
}

.banner_right:hover img {
    transform: scale(1.05) rotate(2deg);
}

/* 涟漪效果 */
.menu-item::after {
    content: '';
    position: absolute;
    top: 50%;
    left: 50%;
    width: 5px;
    height: 5px;
    background: rgba(255,255,255,0.4);
    opacity: 0;
    border-radius: 50%;
    transform: translate(-50%, -50%);
    transition: width 0.3s, height 0.3s, opacity 0.3s;
}

.menu-item:active::after {
    width: 200px;
    height: 200px;
    opacity: 1;
    transition: width 0.3s, height 0.3s, opacity 0s;
}

@keyframes pageEntrance {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
    /* 新增样式 */
.Feature-img {
    position: relative;
    overflow: hidden; /* 隐藏放大溢出部分 */
    border-radius: 8px;
    transition: transform 0.3s ease;
}

.Feature-img:hover {
    transform: translateY(-5px); /* 悬停整体上移 */
}

.Feature-img img {
    width: 100%;
    height: 280px;
    object-fit: cover;
    transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
}

.Feature-img:hover img {
    transform: scale(1.08); /* 放大效果 */
    filter: brightness(1.05); /* 提高亮度 */
}

.Feature-img p {
    position: absolute;
    bottom: 0;
    width: 100%;
    padding: 15px 20px;
    background: linear-gradient(transparent, rgba(0,0,0,0.7));
    color: #fff;
    font-size: 18px;
    transform: translateY(100%);
    opacity: 0;
    transition: all 0.3s ease;
}

.Feature-img:hover p {
    transform: translateY(0);
    opacity: 1;
}

/* 入场动画 */
@keyframes imgEntrance {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.Feature-img {
    animation: imgEntrance 0.6s ease-out backwards;
}

.Feature-img:nth-child(1) { animation-delay: 0.2s; }
.Feature-img:nth-child(2) { animation-delay: 0.4s; }
.Feature-img:nth-child(3) { animation-delay: 0.6s; }
</style>

<link rel="stylesheet" href="./css/bootstrap.min.css"/>
<!-- 公共样式表 -->
<link rel="stylesheet" href="./css/base.css"/>
<!-- 首页样式表 -->
<link rel="stylesheet" href="./css/index.css"/>
<!-- 颜色样式表 -->
<link rel="stylesheet" href="/css/theme.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>
<!-- bootstrap框架 -->
<script src="./js/bootstrap.bundle.min.js"></script>
<script src="./js/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- 套用一个全局背景容器 -->
<div class="bg">
    <!-- 顶部导航栏 -->
    <div class="top">
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
              <a class="navbar-brand" href="index.html"><img src="./imgs/zjs.jpg" alt=""/>logo</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
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
    <!-- 图片中心区域 -->
    <div class="banner page-container">
        <div class="banner_left ">
            <a href="./news.aspx">
                  <div class="menu-item"style="background-color: #009180";>
                    <div>
                        <i class="fas fa-calendar-check"></i>
                        <div>预约挂号</div>
                    </div>
                </div>  
            </a>
            <a href="docs.aspx">
                <div class="menu-item"style="background-color: #30aa97">
                  <div>
                      <i class="fas fa-hospital"></i>
                      <div>医院简介</div>
                  </div>
              </div>
            </a>
            <a href="./press.aspx">
                <div class="menu-item" style="background-color: #cfb96e; ">
                    <div>
                        <i class="fas fa-bullhorn"></i>
                        <div>新闻公告</div>
                    </div>
                </div>
            </a>
            <a href="./ysjj.aspx">
              <div class="menu-item" style="background-color: #1fb2b4;">
                  <div>
                      <i class="fas fa-user-md"></i>
                      <div>专家简介</div>
                  </div>
              </div>
            </a>
        </div>
        <div class="banner_right">
            <img src="./imgs/10001.png" alt=""/>
        </div>
    </div>

</div>
<!-- 新闻内容区域 -->
<section class="new page-container">
    <!-- 第一部分协和·要闻 -->
    <div class="new-list">
        <h2>协和·要闻</h2>
        <a href="./press.aspx"><button class="new-center">进入新闻中心</button></a>
    </div>
    <!-- 轮播and列表 -->
    <div class="new-test">
        <!-- 轮播图 -->
        <div class="new-sild-show">
            <div id="carouselExampleIndicators" class="carousel slide">
                <div class="carousel-indicators">
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img src="./imgs/(1).jpg" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item">
                    <img src="./imgs/(2).jpg" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item">
                    <img src="./imgs/(3).jpg" class="d-block w-100" alt="...">
                  </div>
                </div>
              </div>
        </div>
        <!-- ul列表 -->
        <div class="new-ulli">
            <ul>
                <li><a href="xwgg.aspx">122</a></li>
                <li><a href="xwgg.aspx">122</a></li>
                <li><a href="xwgg.aspx">122</a></li>
                <li><a href="xwgg.aspx">122</a></li>
                <li><a href="xwgg.aspx">122</a></li>
                <li><a href="xwgg.aspx">122</a></li>
                <li><a href="xwgg.aspx">122</a></li>
            </ul>
        </div>
    </div>
</section>

<!-- Feature专题专栏部分 -->
<section class="Feature page-container">
    <div class="Feature-txt">
        <h2>专题·专栏</h2>
    </div>
    <div class="fture-img">
        <div class="Feature-img">
            <img src="./imgs/(1).png" alt="理论学习园地"/>
            <p>理论学习园地</p>
        </div>
        <div class="Feature-img">
            <img src="./imgs/(3).jpg" alt="学习贯彻党的二十大精神"/>
            <p>学习贯彻党的二十大精神</p>
        </div>
        <div class="Feature-img">
            <img src="./imgs/(2).jpg" alt="党纪学习教育"/>
            <p>党纪学习教育</p>
        </div>
    </div>
</section>

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
