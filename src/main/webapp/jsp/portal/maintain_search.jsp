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
  <title>维保查询</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width,user-scalable=0"/>
  <link rel="stylesheet" type="text/css"
        href="<%=basePath%>/static/css/parts-search.css">

  <link href="<%=basePath%>/static/css/mobiscroll.custom-3.0.0-beta2.min.css"
        rel="stylesheet">
</head>
<body>
<div class="outer u-oh">
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
  <div class="container u-oh">
    <div class="banner7"></div>
    <form class="ma-query" action="suggest" method="post">
      <div class="input-item">
        <select name="brand" id="carBrand" onchange="optionSeries()">
          <option value="">选择品牌</option>
          <option value="别克">别克</option>
          <option value="雪佛兰">雪佛兰</option>
          <option value="凯迪拉克">凯迪拉克</option>
        </select>
      </div>
      <div class="input-item">
        <select name="series" id="carSeries">
          <option value="">选择车系</option>


        </select>
      </div>

      <div class="input-item">
        <input name="mile" type="text" placeholder="行驶公里数">
        <span>公里</span>
      </div>

      <div class=" input-item">
        <input id="dateInput" class="birthday" type="text" name="time"
               placeholder="新车上路时间">
      </div>
      <button type="submit" class="query-btn ml-22">查询</button>
    </form>
  </div>
</div>

<script
  src="http://cache.shchengdian.com/js/PhotoClip-V2.05/jquery-3.1.1.min.js"></script>

<script type="text/javascript"
        src="<%=basePath%>/static/js/mobiscroll.custom-3.0.0-beta2.min.js"
        charset="UTF-8"></script>
<script>
  $(function () {
    document.documentElement.style.fontSize = document.documentElement.clientWidth / 6.4 + 'px';
    $(window).resize(function () {
      document.documentElement.style.fontSize = document.documentElement.clientWidth / 6.4 + 'px';
    });

    var winHeight = window.innerHeight || document.body.clientHeight;
    $(".outer").css("height", winHeight);


  });

  function optionSeries() {
    var brand = $("#carBrand").find("option:selected").text();
    $.get("series", {"brand": brand}, function (data) {
      $.each(data, function (index, obj) {
        $("#carSeries").append("<option>" + obj.series + "</option>")
      })

    })
  }

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

  $('#dateInput').mobiscroll().date({
    theme: 'Mobiscroll',
    lang: 'zh',
    display: 'center',
    dateFormat: 'yyyy-mm-dd',

  });
</script>

</body>
</html>
