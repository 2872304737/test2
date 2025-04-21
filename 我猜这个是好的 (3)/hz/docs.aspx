<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="docs.aspx.cs" Inherits="hz.docs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>医院简介</title>
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
    <link rel="stylesheet" href="/css/hospital.css"/>
    <!-- bootstrap框架 -->
    <script src="./js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/gh/Ukenn2112/UkennWeb@3.0/index/web.js"></script>

</head>
<body>
    <form id="form1" runat="server">
            <!-- 顶部导航栏 -->
    <div class="top">
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
              <a class="navbar-brand" href="index.aspx"><img src="./imgs/zjs.jpg" alt=""/>logo</a>
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
    <!-- 顶部 -->
    <div class="hospital-top text-center">
        <img src="./imgs/新闻.jpg" alt="医院简介" class="img-fluid"/>
    </div>


    <!-- 中心导航栏 -->
    <div class="news-nav page-container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./index.aspx">首页</a></li>
              <li class="breadcrumb-item"><a href="#">通知公告</a></li>
              <li class="breadcrumb-item active" aria-current="page"></li>
            </ol>
        </nav>
    </div>
    
    
    <!-- 中心部分 -->
    <div class="hospital-center container mt-4">
        <div class="row">
            <!-- 左边导航 -->
            <div class="col-md-3">
                <div class="list-group">
                    <a href="#" class="list-group-item list-group-item-action active">医院概况</a>
                    <a href="#" class="list-group-item list-group-item-action">医院简介</a>
                </div>
            </div>
            <!-- 右边内容 -->
            <div class="col-md-9">
                <h2>医院简介</h2>
                <p>华中科技大学同济医学院附属协和医院始建于1866年，是国家卫生健康委员会（首）部的综合性公立医院，“双一流”高效附属医院（第一临床学院），国家首批三级甲等医院，全国百佳医院，荣获全国五一劳动奖状、全国文明单位等荣誉称号，被中央中央授予全国先进基层党组织、全国抗击新冠肺炎先进集体、中央中央书记视频接见的医院，国家院党委书记等称谓。</p>
                <p>历史悠久，实力雄厚。医院前身是始创于1866年的“汉口仁济医院”，高德“仁爱济世”。1928年，迁至现址联合办院，更名“汉口协和医院”（Union Hospital），新中国成立后，医院收归国有，隶属上海同济大学医学院时迁武汉并与武汉大学医学院合并，成为新组建医学学院的教学医院。附属医院。2000年，随同济医科大学组建华中科技大学，更名为华中科技大学同济医学院附属协和医院。</p>
                <p>医院坚持社会主义办院方向，促进优质医疗资源均衡布局，服务国家战略。现由主院区、肿瘤中心、车管医院和盘龙城医院组成，编制床位6000张，设49个临床和医技科室，妇产、血液、心血管内科、普通外科、泌尿外科、麻醉科等10个学科为国家重点（培育）学科，心血管内科、整形科、骨科、妇产科、消化内科、内分泌科、胸外科等25个科室入选国家临床重点专科建设项目。省级层级中专科建设科15个。临床医学进入ESI全球1%，入选教育部“双一流”学科。综合救护转移稳居全国前列。医院入选全国首批区域医疗中心试点单位。</p>
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
