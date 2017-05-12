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
  <style>
    @keyframes moveLeft {
      0% {
        right: -3.2rem;
      }
      100% {
        right: 0;
      }

    }

    @-webkit-keyframes moveLeft {
      0% {
        right: -3.2rem;
      }
      100% {
        right: 0;
      }

    }

    .moveLeft {
      animation: moveLeft 800ms ease-in-out both;
      -webkit-animation: moveLeft 800ms ease-in-out both;
    }

    @keyframes moveRight {
      0% {
        right: 0;

      }
      100% {
        right: -3.2rem;
      }

    }

    @-webkit-keyframes moveRight {
      0% {
        right: 0;
      }
      100% {
        right: -3.2rem;

      }

    }

    .moveRight {
      animation: moveRight 800ms ease-in-out both;
      -webkit-animation: moveRight 800ms ease-in-out both;
    }
  </style>
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
    <div class="part-panel">
      <table>
        <tr>
          <td><a href="javaScript:quickSearch('冷却液')">冷却液</a></td>
          <td><a href="javaScript:quickSearch('燃油滤清器')">燃油滤清器</a></td>
        </tr>
        <tr>
          <td><a href="javaScript:quickSearch('制动液')">制动液</a></td>
          <td><a href="javaScript:quickSearch('前制动片')">前制动片</a></td>
        </tr>
        <tr>
          <td><a href="javaScript:quickSearch('空调制冷剂')">空调制冷剂</a></td>
          <td><a href="javaScript:quickSearch('后制动片')">后制动片</a></td>
        </tr>
        <tr>
          <td><a href="javaScript:quickSearch('变速箱油液')">变速箱油液</a></td>
          <td><a href="javaScript:quickSearch('乘客厢空气滤清器')">乘客厢空气滤清器</a></td>
        </tr>
        <tr>
          <td><a href="javaScript:quickSearch('养护品')">养护品</a></td>
          <td><a href="javaScript:quickSearch('空气滤清器')">空气滤清器</a></td>
        </tr>
        <tr>
          <td><a href="javaScript:quickSearch('机油')">机油</a></td>
          <td><a href="javaScript:quickSearch('门铰链')">门铰链</a></td>
        </tr>
        <tr>
          <td><a href="javaScript:quickSearch('轮胎')">轮胎</a></td>
          <td><a href="javaScript:quickSearch('蓄电池总成')">蓄电池总成</a></td>
        </tr>
        <tr>
          <td><a href="javaScript:quickSearch('火花塞')">火花塞</a></td>
          <td></td>
        </tr>
        <tr>
          <td><a href="javaScript:quickSearch('皮带')">皮带</a></td>
          <td></td>
        </tr>
        <tr>
          <td><a href="javaScript:quickSearch('正时皮带')">正时皮带</a></td>
          <td></td>
        </tr>
        <tr>
          <td><a href="javaScript:quickSearch('皮带惰轮')">皮带惰轮</a></td>
          <td></td>
        </tr>
        <tr>
          <td><a href="javaScript:quickSearch('张紧器')">张紧器</a></td>
          <td></td>
        </tr>
        <tr>
          <td><a href="javaScript:quickSearch('油液滤清器总成')">油液滤清器总成</a></td>
          <td></td>
        </tr>
        <tr>
          <td><a href="javaScript:quickSearch('自动变速器油滤清器')">自动变速器油滤清器</a></td>
          <td></td>
        </tr>

      </table>
    </div>
    <div class="fixbtn">
      <span></span>
      <span></span>
    </div>
    <div class="main">
      <form class="search-bar">
        <input type="search" name="keywords" placeholder="快速搜索：请输入配件名称">
        <span id="keywordsSearch">
    			<img src="<%=basePath%>/static/images/search.png">
    		</span>
      </form>
      <ul class="hot-parts" id="hot-parts">

        <c:forEach var="item" items="${result}">
          <li>
            <a href="detail/${type}?id=${item.id}">
              <h3>${item.name}</h3>
              <p>类&nbsp;&nbsp;型 <span class="type">${item.type}</span></p>
              <c:if test="${type != '2'}">
                <p>适配车型 <span class="model1"> ${item.brand} ${item.series}</span></p>
              </c:if>

              <p class="mes-price">建议价格 <span class="price">55</span>元</p>
            </a>
          </li>

        </c:forEach>
      </ul>

      <div class="query-layer u-oh">
        <form class="query" action="parts-list" method="POST">
          <div class="input-item" id="type">
            <select name="partType" id="partType" class="form-column">
              <option selected="selected" class="type-opt">配件类型</option>
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
            <select name="vehicleYear" id="vehicleYear" class="form-column"
                    onchange="optionEmission()">
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
  </div>
  <form action="parts-list" id="quickSearch" method="POST">
    <input name="partType" id="pType" type="hidden" >
    <input name="carBrand" type="hidden" value="${brand}">
    <input name="carSeries" type="hidden" value="${series}">
    <input name="vehicleYear" type="hidden" value="${vehicle_year}">
    <input name="vehicleEmission" type="hidden" value="${emission}">
    <input name="tireSize" type="hidden" value="${size}">
  </form>
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


    /*
     var winHeight = window.innerHeight || document.body.clientHeight;
     var navHeight = document.documentElement.clientWidth / 8;
     var trHeight = ( winHeight - navHeight ) / 14 + "px";
     $(".part-panel tr").css("width", trHeight);
     */
  });

  $(".logo").on("click", function () {
    $(".part-panel").toggle();
  });

  $("#keywordsSearch").on("click", function () {
    var keywords = $("input[name='keywords']").val();
    $.ajax({
      url: "keywords-search",
      method: "POST",
      data: {"keywords": keywords},
      success: function (res) {
        var data = "";
        $.each(res, function () {
          data += '<li> <a href="detail/'+ this.ptype +'?id=' + this.id + '"> <h3>' + this.name + '</h3><p>类&nbsp;&nbsp;型 <span class="type">' + this.type + '</span></p>' +
            '<p>适配车型 <span class="model1">' + this.brand + " " + this.series + +this.vehicle_year + "款" + this.emission + "</span></p>" + ' <p class="mes-price">建议价格 <span class="price">55</span>元</p> </a></li>'

        });

        $("#hot-parts").html(data);
      }
    })
  });

  (function ($) {
    var old = $.fn.swipe;

    $.fn.swipe = function (option) {
      var opt = {
        'left': $.noop,
        'right': $.noop,
        'up': $.noop,
        'down': $.noop
      };

      if ($.type(option) == 'string') {
        switch (option.toLowerCase()) {
          case 'left':
            if (this.data('opt').left && $.isFunction(this.data('opt').left)) {
              this.data('opt').left.call(this);
            }
            break;
          case 'right':
            if (this.data('opt').right && $.isFunction(this.data('opt').right)) {
              this.data('opt').right.call(this);
            }
            break;
          case 'up':
            if (this.data('opt').up && $.isFunction(this.data('opt').up)) {
              this.data('opt').up.call(this);
            }
            break;
          case 'down':
            if (this.data('opt').down && $.isFunction(this.data('opt').down)) {
              this.data('opt').down.call(this);
            }
            break;
          default:
            break;
        }

        return this;
      } else if ($.isPlainObject(option)) {
        var clone = {};

        //大小写不敏感处理
        $.each(option, function (k, v) {
          clone[k.toLowerCase()] = v;
        });

        $.extend(opt, clone);

        return this.each(function (index, ele) {
          //敏感距离
          var dis = 120;
          //各元素赋值，备直接触发时用
          $(ele).data('opt', $.extend({}, opt)).on('touchstart mousedown', function (e) {
            var ev = e.type == 'touchstart' ? e.originalEvent.touches[0] : e,
              startX = ev.pageX,
              startY = ev.pageY,
              startLeft = $(this).position().left,
              startTop = $(this).position().top,
              start = {
                left: startLeft,
                top: startTop
              },
              disX = startX - startLeft,
              disY = startY - startTop;

            $(document).on('touchmove.swipe.founder mousemove.swipe.founder', function (e) {
              var ev = e.type == 'touchmove' ? e.originalEvent.touches[0] : e;

              if (opt.left != $.noop || opt.right != $.noop) {
                $(ele).css('left', ev.pageX - disX - $(ele).offsetParent().offset().left + 'px');
              }

              if (opt.up != $.noop || opt.down != $.noop) {
                $(ele).css('top', ev.pageY - disY - $(ele).offsetParent().offset().top + 'px');
              }

              e.preventDefault();
            });

            $(document).on('touchend.swipe.founder mouseup.swipe.founder', function (e) {
              var ev = e.type == 'touchend' ? e.originalEvent.changedTouches[0] : e,
                endX = ev.pageX,
                endY = ev.pageY,
                x = Math.abs(endX - startX),
                y = Math.abs(endY - startY),
                direction = null;

              //必须在指定dis大小外，消除敏感距离
              direction = x >= y ? (endX < startX ? (Math.abs(endX - startX) > dis ? 'left' : null) : (Math.abs(endX - startX) > dis ? 'right' : null)) : (endY < startY ? (Math.abs(endY - startY) > dis ? 'up' : null) : (Math.abs(endY - startY) > dis ? 'down' : null));

              switch (direction) {
                case 'left':
                  if (opt.left && $.isFunction(opt.left)) {
                    opt.left.call(ele);
                  }
                  break;
                case 'right':
                  if (opt.right && $.isFunction(opt.right)) {
                    opt.right.call(ele);
                  }
                  break;
                case 'up':
                  if (opt.up && $.isFunction(opt.up)) {
                    opt.up.call(ele);
                  }
                  break;
                case 'down':
                  if (opt.down && $.isFunction(opt.down)) {
                    opt.down.call(ele);
                  }
                  break;
                default:
                  //复位
                  $(ele).animate({
                    'left': start.left + 'px',
                    'top': start.top + 'px'
                  });
                  break;
              }

              $(document).off('.swipe.founder');
            });
          });
        });
      } else {
        throw new Error('%E5%8F%82%E6%95%B0%E9%94%99%E8%AF%AF！');
      }
    };

    $.fn.swipe.noConflict = function () {
      $.fn.swipe = old;
      return this;
    };
  })(jQuery);

  $('body').swipe({
    left: function () {
      $(".part-panel").removeClass("moveRight")
      $(".part-panel").addClass("moveLeft")
      console.log('向左运动');
    },
    right: function () {
      $(".part-panel").removeClass("moveLeft")
      $(".part-panel").addClass("moveRight")
      console.log('向右运动');
    }
  });

  $(".nav-btn").on("click", function () {
    $(".catelog").toggle();
    if ($(".catelog").is(":hidden")) {
      $(".container").animate({
        top: "0.8rem",
        left: 0
      }, 500);
      $(".fixbtn").show();
    } else {
      $(".container").animate({
        top: "3.8rem",
        left: "3.3rem"
      }, 500);
      $(".fixbtn").hide();
      if ($(".part-panel").is(":visible")) {
        $(".part-panel").hide();
      }
    }
  });

  var $fixbtn = $(".fixbtn"),
    $ql = $(".query-layer");
  $fixbtn.on("click", function () {
    $ql.css("display", "block");
    if ($fixbtn.hasClass("mis-icon")) {
      $fixbtn.removeClass("mis-icon");
      $ql.hide();
    } else {
      $fixbtn.addClass(" mis-icon");
      $ql.show();
    }
  });

  $("#type").on("change", function () {
    var $type = $(".type-opt"),
      $fluid_opt = $(".fluid-opt"),
      $tire_opt = $(".tire-opt"),
      $fluid = $(".fluid"),
      $tire = $(".tire"),
      $btn = $(".query-btn"),
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
    $(".query-btn").show();
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

  function quickSearch(partsType) {
    $("#pType").val(partsType);
    $("#quickSearch").submit();
  }
</script>
</body>
</html>
