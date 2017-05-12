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
  <title>查询</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width,user-scalable=0"/>
  <link rel="stylesheet" type="text/css"
        href="<%=basePath%>/static/css/parts-search.css">
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
    <form class="query" action="parts-list" method="POST">
      <div class="input-item" id="type">
        <select name="partType" id="partType" class="form-column">
          <option selected="selected" class="type-opt"  value="">配件类型</option>
          <option class="fluid-opt">油液</option>
          <option class="tire-opt">轮胎</option>
          <option>火花塞</option>
          <option>皮带</option>
          <option>正时皮带</option>
          <option>皮带惰轮</option>
          <option>张紧器</option>
          <option>油液滤清器总成</option>
          <option>自动变速器油滤清器</option>
          <option>燃油滤清器</option>
          <option>前制动片</option>
          <option>后制动片</option>
          <option>乘客厢空气滤清器</option>
          <option>空气滤清器</option>
          <option>蓄电池总成</option>
          <option>门铰链</option>
        </select>
      </div>
      <div class="input-item fluid">
        <select name="oilType" class="form-column">
          <option value="">选择油液</option>
          <option value="冷却液">冷却液</option>
          <option>制动液</option>
          <option>变速箱油液</option>
          <option>养护品</option>
          <option>空调制冷剂</option>
        </select>
      </div>
      <div class="input-item">
        <select name="carBrand" id="carBrand" class="form-column" onchange="optionSeries()">
          <option value="">选择品牌</option>
          <option value="别克">别克</option>
          <option value="凯迪拉克">凯迪拉克</option>
          <option value="雪佛兰">雪佛兰</option>
        </select>
      </div>
      <div class="input-item">
        <select name="carSeries" id="carSeries" class="form-column" onchange="optionVehicleYear()">
          <option value="">选择车系</option>

        </select>
      </div>
      <div class="input-item">
        <select name="vehicleYear" id="vehicleYear" class="form-column" onchange="optionEmission()">
          <option value="">选择年款</option>
        </select>
      </div>
      <div class="input-item displacement">
        <select name="vehicleEmission" id="vehicleEmission" class="form-column">
          <option value="">选择排量</option>
        </select>
      </div>
      <div class="input-item tire">
        <select name="tireSize" id="tireSize" class="form-column">
          <option value="">选择规格</option>
        </select>
      </div>
      <button type="submit" class="btn-submit">查询</button>
    </form>
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

    $(".outer").css("height", winHeight);

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

    $("select>:first").attr("selected", "selected");

    $("#type").on("change", function () {
      var $type = $(".type-opt"),
        $fluid_opt = $(".fluid-opt"),
        $tire_opt = $(".tire-opt"),
        $fluid = $(".fluid"),
        $tire = $(".tire"),
        $btn = $(".query button"),
        $dpm = $(".displacement");
      if (!($fluid_opt || $tire_opt).is(":checked")) {
        $(this).nextAll().show();
        $fluid.hide();
        $tire.hide();
      }
      if ($fluid_opt.is(":checked")) {
        $fluid.show().nextAll().hide();
      }
      if ($tire_opt.is(":checked")) {
        $(this).nextAll().show();
        $fluid.hide();
        $dpm.hide();
        $tire.show();
      }
      $btn.show();
    });

  });

  function optionSeries() {
    var brand = $("#carBrand").find("option:selected").text();
    $.get("../vehicle/series", {"brand": brand}, function (data) {
      $("#carSeries>:first").nextAll().remove();
      $.each(data, function (index, obj) {

        $("#carSeries").append("<option>" + obj.series + "</option>")
      })

    })
  }

  function optionVehicleYear() {
    var series = $("#carSeries").find("option:selected").text();
    $("#vehicleYea>:first").nextAll().remove();
    $.get("../vehicle/vehicleYear", {"series": series}, function (data) {
      $.each(data, function (index, obj) {
        $("#vehicleYear").append("<option value='" + obj.vehicle_year + "'>" + obj.vehicle_year + "</option>")
      })

    })
  }

  function optionEmission() {
    var series = $("#carSeries").find("option:selected").text();
    var vehicleYear = $("#vehicleYear").find("option:selected").text();
    var partType = $("#partType").find("option:selected").text();
    if (partType == '轮胎') {
      $("#tireSize>:first").nextAll().remove();
      $.get("../vehicle/trieSize", {
        "series": series,
        "vehicleYear": vehicleYear
      }, function (data) {
        $.each(data, function (index, obj) {
          $("#tireSize").append("<option value='" + obj.size + "'>" + obj.size + "</option>")
        })

      })
    } else {
      $("#vehicleEmission>:first").nextAll().remove();
      $.get("../vehicle/emission", {
        "series": series,
        "vehicleYear": vehicleYear
      }, function (data) {
        $.each(data, function (index, obj) {
          $("#vehicleEmission").append("<option value='" + obj.emission + "'>" + obj.emission + "</option>")
        })

      })
    }

  }
</script>
</body>
</html>
