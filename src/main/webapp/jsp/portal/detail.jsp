<%--
  Created by IntelliJ IDEA.
  User: sukey
  Date: 2017/2/16
  Time: 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://"
    + request.getServerName() + ":" + request.getServerPort()
    + path;
%>
<html>
<head>
  <title>配件价格</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width,user-scalable=0"/>
  <link rel="stylesheet" type="text/css"
        href="<%=basePath%>/static/css/parts-search.css">
</head>
<body>
<div class="outer">
  <div class="nav clearfix">
    <div class="nav-btn">
      <span></span>
      <span></span>
      <span></span>
    </div>
    <p>上汽通用汽车有限公司</p>
    <div class="logo">
      <img src="<%=basePath%>/static/images/logo.png">
    </div>
  </div>
  <div class="catelog">
    <a href="<%=basePath%>/parts-price/search">配件查询</a>
    <a href="<%=basePath%>/maintain/search">维修计划</a>
  </div>

  <div class="container">
    <div class="pa-banner">
      <img src="<%=basePath%>/static/images/banner5.jpg">
    </div>
    <div class="info">
      <h3>配件详情</h3>
      <ul>
        <li>
          <span class="word1">配件编号</span>
          <span>${parts.partsid}</span>
        </li>
        <li>
          <span class="word1">中文名称</span>
          <span>${parts.name}</span>
        </li>
        <li>
          <span class="word1">英文名称</span>
          <span>${parts.name_en}</span>
        </li>
        <li>
          <span class="word1">价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格</span>
          <span class="pa-price">468</span>
        </li>
        <li>
          <span>配件类型:</span>
          <span>${parts.type}</span>
        </li>

        <c:if test="${type=='1'}">
          <li>
            <span>适配车型:</span>
            <span>${parts.brand} ${parts.series} ${parts.vehicleYear}款
          </li>
          <li>
            <span>其他适配车型:</span>
              ${matchVehicle}
          </li>
          <li>
            <span>品牌规格:</span>
            <span> ${parts.supplier} ${parts.size}</span>
          </li>
        </c:if>
        <c:if test="${type=='3'}">
          <li>
            <span>适配车型:</span>
            <span>${parts.brand} ${parts.series} ${parts.vehicleYear}款 ${parts.emission}</span>
          </li>
          <li>
            <span>其他适配车型:</span>
              ${matchVehicle}
          </li>
        </c:if>

      </ul>
    </div>
  </div>
</div>


<script
  src="http://cache.shchengdian.com/js/PhotoClip-V2.05/jquery-3.1.1.min.js"></script>
<script>
  $(function () {
    document.documentElement.style.fontSize = document.documentElement.clientWidth / 6.4 + 'px';
    $(window).resize(function () {
      document.documentElement.style.fontSize = document.documentElement.clientWidth / 6.4 + 'px';
    });

    var winHeight = window.innerHeight || document.body.clientHeight;
    $(".item").css("height", winHeight);
    $(".query").css("height", winHeight);

    $(".logo").on("click", function () {
      $(".part-panel").toggle();
    });

  });
  $(".nav-btn").on("click", function () {
     $(".catelog").toggle();
     if ($(".catelog").is(":hidden")) {
       $(".container").animate({
         top: "0.8rem",
         left: 0
       }, 500);
     } else {
       $(".container").animate({
         top: "3.8rem",
         left: "3.3rem"
       }, 500);
     }
   });
</script>
</body>
</html>
