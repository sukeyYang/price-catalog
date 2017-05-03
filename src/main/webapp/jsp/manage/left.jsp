<%--
  Created by IntelliJ IDEA.
  User: sukey
  Date: 2016/10/31
  Time: 16:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
  String pathl = request.getContextPath();
  String basePathl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + pathl;
%>
<!-- 本页面涉及的js函数，都在head.jsp页面中 -->
<div id="sidebar" class="sidebar responsive">


  <!-- /.sidebar-shortcuts -->


  <ul class="nav nav-list">
    <li>
      <a href="javascript:void(0)">

        <span class="menu-text"></span>
      </a>

      <b class="arrow"></b>
    </li>
    <li class="hsub ${parts}">

      <a href="javaScript:void(0)" class="dropdown-toggle">
        <i class="menu-icon fa fa-desktop"></i>
        <span class="menu-text">配件管理 </span>

        <b class="arrow fa fa-angle-down"></b>
      </a>
      <b class="arrow"></b>
      <ul class="submenu nav-show" style="display: block;">

        <li class="">
          <a href="<%=basePathl%>/parts/show-parts-list">
            <i class="menu-icon fa fa-caret-right"></i>
            配件管理
          </a>

          <b class="arrow"></b>
        </li>
        <li class="">
          <a href="<%=basePathl%>/parts/parts-oil">
            <i class="menu-icon fa fa-caret-right"></i>
            油液
          </a>

          <b class="arrow"></b>
        </li>

        <li class="">
          <a href="<%=basePathl%>/parts/show-parts-tire">
            <i class="menu-icon fa fa-caret-right"></i>
            轮胎
          </a>

          <b class="arrow"></b>
        </li>


      </ul>

    </li>


    <li class="${repair}">
      <a href="<%=basePath%>repaired/show-list">
        <i class="menu-icon fa fa-desktop"></i>
        <span class="menu-text"> 维保信息管理 </span>
      </a>
    </li>

  </ul>
  <!-- #section:basics/sidebar.layout.minimize -->
  <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
    <i class="ace-icon fa fa-angle-double-left"
       data-icon1="ace-icon fa fa-angle-double-left"
       data-icon2="ace-icon fa fa-angle-double-right"></i>
  </div>

  <!-- /section:basics/sidebar.layout.minimize -->
  <script type="text/javascript">
    try {
      ace.settings.check('sidebar', 'collapsed')
    } catch (e) {
    }
    $(".nav.nav-list>")

  </script>

</div>
<!--/#sidebar-->
