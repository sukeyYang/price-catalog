<%--
  Created by IntelliJ IDEA.
  User: sukey
  Date: 2017/2/16
  Time: 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://"
    + request.getServerName() + ":" + request.getServerPort()
    + path;
%>
<html>
<head>
  <title>维保查询</title>
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
  <div class="container" >
    <div class="vehicle">
      <p>当前车型：<span>${brand} ${series}</span></p>
      <p>行驶公里数：<span>${mile}公里</span></p>
      <p>新车上路时间：<span>${time}</span></p>
    </div>
    <div class="plan">
      <c:forEach var="item" items="${maintenanceList}">
        <div class="plan-item">
          <ul>
            <li>
              <span>保养类型：</span>
              <span>${item.type}</span>
            </li>
            <li>
              <span>保养操作：</span>
              <span>${item.operation}</span>
            </li>
            <li>
              <span>操作说明：</span>
              <span>${item.frequency}</span>
            </li>
            <li>
              <span>配件类型：</span>
              <span>${item.parts}</span>
            </li>
          </ul>
          <c:if test="${fn:length(item.operation)>18}">
            <div class="detailed-btn down-btn" style="top:0.72rem">
              <span></span>
              <span></span>
            </div>
            <p class="detailed" style="top:0.72rem">
                ${item.operation}
            </p>
          </c:if>

          <c:if test="${fn:length(item.frequency)>18}">
            <div class="detailed-btn down-btn">
              <span></span>
              <span></span>
            </div>
            <p class="detailed">
                ${item.frequency}
            </p>
          </c:if>

        </div>
      </c:forEach>

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
    $(".plan-container").css("height", winHeight);

    $(".detailed-btn").on("click", function () {
      var $btn = $(this),
        $det = $btn.next();
      $det.toggle();
      if ($det.is(":hidden")) {
        if ($btn.hasClass("up-btn")) {
          $btn.removeClass("up-btn");
        }
        $btn.addClass("down-btn");
      } else {
        if ($btn.hasClass("down-btn")) {
          $btn.removeClass("down-btn");
        }
        $btn.addClass("up-btn");
      }
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
