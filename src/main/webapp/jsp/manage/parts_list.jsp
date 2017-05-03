<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://"
    + request.getServerName() + ":" + request.getServerPort()
    + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
  <base href="<%=basePath%>">
  <!-- jsp文件头和头部 -->
  <%@ include file="common.jsp" %>
  <style>
    html, body {
      height: 100%;
      width: 100%
    }
  </style>
</head>
<body class="no-skin">
<!-- 页面顶部¨ -->
<%@ include file="head.jsp" %>
<div class="main-container" id="main-container">
  <script type="text/javascript">
    try {
      ace.settings.check('main-container', 'fixed')
    } catch (e) {
    }
  </script>
  <!-- /section:basics/navbar.layout -->

  <!-- 左侧菜单 -->
  <%@ include file="left.jsp" %>
  <div class="main-content">
    <!-- #section:basics/content.breadcrumbs -->
    <div class="breadcrumbs" id="breadcrumbs">
      <script type="text/javascript">
        try {
          ace.settings.check('breadcrumbs', 'fixed')
        } catch (e) {
        }
      </script>

      <ul class="breadcrumb">
        <li>
          <i class="ace-icon fa fa-home home-icon"></i>
          <a href="#">Home</a>
        </li>

        <li>
          <a href="#">Tables</a>
        </li>
        <li class="active">Simple &amp; Dynamic</li>
      </ul><!-- /.breadcrumb -->

      <!-- #section:basics/content.searchbox -->
      <div class="nav-search" id="nav-search">
        <form class="form-search">
  							<span class="input-icon">
  								<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off"/>
  								<i class="ace-icon fa fa-search nav-search-icon"></i>
  							</span>
        </form>
      </div><!-- /.nav-search -->

      <!-- /section:basics/content.searchbox -->
    </div>

    <!-- /section:basics/content.breadcrumbs -->
    <div class="page-content">
      <!-- #section:settings.box -->
      <div class="ace-settings-container" id="ace-settings-container">
        <div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
          <i class="ace-icon fa fa-cog bigger-150"></i>
        </div>

        <div class="ace-settings-box clearfix" id="ace-settings-box">
          <div class="pull-left width-50">
            <!-- #section:settings.skins -->
            <div class="ace-settings-item">
              <div class="pull-left">
                <select id="skin-colorpicker" class="hide">
                  <option data-skin="no-skin" value="#438EB9">#438EB9</option>
                  <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                  <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                  <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                </select>
              </div>
              <span>&nbsp; Choose Skin</span>
            </div>

            <!-- /section:settings.skins -->

            <!-- #section:settings.navbar -->
            <div class="ace-settings-item">
              <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar"/>
              <label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
            </div>

            <!-- /section:settings.navbar -->

            <!-- #section:settings.sidebar -->
            <div class="ace-settings-item">
              <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar"/>
              <label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
            </div>

            <!-- /section:settings.sidebar -->

            <!-- #section:settings.breadcrumbs -->
            <div class="ace-settings-item">
              <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs"/>
              <label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
            </div>

            <!-- /section:settings.breadcrumbs -->

            <!-- #section:settings.rtl -->
            <div class="ace-settings-item">
              <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl"/>
              <label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
            </div>

            <!-- /section:settings.rtl -->

            <!-- #section:settings.container -->
            <div class="ace-settings-item">
              <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container"/>
              <label class="lbl" for="ace-settings-add-container">
                Inside
                <b>.container</b>
              </label>
            </div>

            <!-- /section:settings.container -->
          </div><!-- /.pull-left -->

          <div class="pull-left width-50">
            <!-- #section:basics/sidebar.options -->
            <div class="ace-settings-item">
              <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-hover"/>
              <label class="lbl" for="ace-settings-hover"> Submenu on Hover</label>
            </div>

            <div class="ace-settings-item">
              <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-compact"/>
              <label class="lbl" for="ace-settings-compact"> Compact Sidebar</label>
            </div>

            <div class="ace-settings-item">
              <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-highlight"/>
              <label class="lbl" for="ace-settings-highlight"> Alt. Active Item</label>
            </div>

            <!-- /section:basics/sidebar.options -->
          </div><!-- /.pull-left -->
        </div><!-- /.ace-settings-box -->
      </div><!-- /.ace-settings-container -->

      <!-- /section:settings.box -->
      <div class="page-content-area">
        <div class="page-header">
          <h1>
            Tables
            <small>
              <i class="ace-icon fa fa-angle-double-right"></i>
              Static &amp; Dynamic Tables
            </small>
          </h1>
        </div><!-- /.page-header -->

        <div class="row">
          <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->
            <div class="row">
              <div class="col-xs-12">
                <table id="sample-table-1" class="table table-striped table-bordered table-hover">
                  <thead>
                  <tr>
                    <th class="center">
                      <label class="position-relative">
                        <input type="checkbox" class="ace"/>
                        <span class="lbl"></span>
                      </label>
                    </th>
                    <th>配件编号</th>
                    <th>配件中文名</th>
                    <th class="hidden-480">配件英文名</th>

                    <th>
                      <i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
                      Update
                    </th>
                    <th class="hidden-480">Status</th>

                    <th></th>
                  </tr>
                  </thead>

                  <tbody>
                  <tr>
                    <td class="center">
                      <label class="position-relative">
                        <input type="checkbox" class="ace"/>
                        <span class="lbl"></span>
                      </label>
                    </td>

                    <td>
                      <a href="#">ace.com</a>
                    </td>
                    <td>$45</td>
                    <td class="hidden-480">3,330</td>
                    <td>Feb 12</td>

                    <td class="hidden-480">
                      <span class="label label-sm label-warning">Expiring</span>
                    </td>

                    <td>
                      <div class="hidden-sm hidden-xs btn-group">
                        <button class="btn btn-xs btn-success">
                          <i class="ace-icon fa fa-check bigger-120"></i>
                        </button>

                        <button class="btn btn-xs btn-info">
                          <i class="ace-icon fa fa-pencil bigger-120"></i>
                        </button>

                        <button class="btn btn-xs btn-danger">
                          <i class="ace-icon fa fa-trash-o bigger-120"></i>
                        </button>

                        <button class="btn btn-xs btn-warning">
                          <i class="ace-icon fa fa-flag bigger-120"></i>
                        </button>
                      </div>

                      <div class="hidden-md hidden-lg">
                        <div class="inline position-relative">
                          <button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
                            <i class="ace-icon fa fa-cog icon-only bigger-110"></i>
                          </button>

                          <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
                            <li>
                              <a href="#" class="tooltip-info" data-rel="tooltip" title="View">
  																			<span class="blue">
  																				<i class="ace-icon fa fa-search-plus bigger-120"></i>
  																			</span>
                              </a>
                            </li>

                            <li>
                              <a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
  																			<span class="green">
  																				<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
  																			</span>
                              </a>
                            </li>

                            <li>
                              <a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
  																			<span class="red">
  																				<i class="ace-icon fa fa-trash-o bigger-120"></i>
  																			</span>
                              </a>
                            </li>
                          </ul>
                        </div>
                      </div>
                    </td>
                  </tr>

                  <tr>
                    <td class="center">
                      <label class="position-relative">
                        <input type="checkbox" class="ace"/>
                        <span class="lbl"></span>
                      </label>
                    </td>

                    <td>
                      <a href="#">base.com</a>
                    </td>
                    <td>$35</td>
                    <td class="hidden-480">2,595</td>
                    <td>Feb 18</td>

                    <td class="hidden-480">
                      <span class="label label-sm label-success">Registered</span>
                    </td>

                    <td>
                      <div class="hidden-sm hidden-xs btn-group">
                        <button class="btn btn-xs btn-success">
                          <i class="ace-icon fa fa-check bigger-120"></i>
                        </button>

                        <button class="btn btn-xs btn-info">
                          <i class="ace-icon fa fa-pencil bigger-120"></i>
                        </button>

                        <button class="btn btn-xs btn-danger">
                          <i class="ace-icon fa fa-trash-o bigger-120"></i>
                        </button>

                        <button class="btn btn-xs btn-warning">
                          <i class="ace-icon fa fa-flag bigger-120"></i>
                        </button>
                      </div>

                      <div class="hidden-md hidden-lg">
                        <div class="inline position-relative">
                          <button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
                            <i class="ace-icon fa fa-cog icon-only bigger-110"></i>
                          </button>

                          <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
                            <li>
                              <a href="#" class="tooltip-info" data-rel="tooltip" title="View">
  																			<span class="blue">
  																				<i class="ace-icon fa fa-search-plus bigger-120"></i>
  																			</span>
                              </a>
                            </li>

                            <li>
                              <a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
  																			<span class="green">
  																				<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
  																			</span>
                              </a>
                            </li>

                            <li>
                              <a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
  																			<span class="red">
  																				<i class="ace-icon fa fa-trash-o bigger-120"></i>
  																			</span>
                              </a>
                            </li>
                          </ul>
                        </div>
                      </div>
                    </td>
                  </tr>

                  <tr>
                    <td class="center">
                      <label class="position-relative">
                        <input type="checkbox" class="ace"/>
                        <span class="lbl"></span>
                      </label>
                    </td>

                    <td>
                      <a href="#">max.com</a>
                    </td>
                    <td>$60</td>
                    <td class="hidden-480">4,400</td>
                    <td>Mar 11</td>

                    <td class="hidden-480">
                      <span class="label label-sm label-warning">Expiring</span>
                    </td>

                    <td>
                      <div class="hidden-sm hidden-xs btn-group">
                        <button class="btn btn-xs btn-success">
                          <i class="ace-icon fa fa-check bigger-120"></i>
                        </button>

                        <button class="btn btn-xs btn-info">
                          <i class="ace-icon fa fa-pencil bigger-120"></i>
                        </button>

                        <button class="btn btn-xs btn-danger">
                          <i class="ace-icon fa fa-trash-o bigger-120"></i>
                        </button>

                        <button class="btn btn-xs btn-warning">
                          <i class="ace-icon fa fa-flag bigger-120"></i>
                        </button>
                      </div>

                      <div class="hidden-md hidden-lg">
                        <div class="inline position-relative">
                          <button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
                            <i class="ace-icon fa fa-cog icon-only bigger-110"></i>
                          </button>

                          <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
                            <li>
                              <a href="#" class="tooltip-info" data-rel="tooltip" title="View">
  																			<span class="blue">
  																				<i class="ace-icon fa fa-search-plus bigger-120"></i>
  																			</span>
                              </a>
                            </li>

                            <li>
                              <a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
  																			<span class="green">
  																				<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
  																			</span>
                              </a>
                            </li>

                            <li>
                              <a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
  																			<span class="red">
  																				<i class="ace-icon fa fa-trash-o bigger-120"></i>
  																			</span>
                              </a>
                            </li>
                          </ul>
                        </div>
                      </div>
                    </td>
                  </tr>

                  <tr>
                    <td class="center">
                      <label class="position-relative">
                        <input type="checkbox" class="ace"/>
                        <span class="lbl"></span>
                      </label>
                    </td>

                    <td>
                      <a href="#">best.com</a>
                    </td>
                    <td>$75</td>
                    <td class="hidden-480">6,500</td>
                    <td>Apr 03</td>

                    <td class="hidden-480">
                      <span class="label label-sm label-inverse arrowed-in">Flagged</span>
                    </td>

                    <td>
                      <div class="hidden-sm hidden-xs btn-group">
                        <button class="btn btn-xs btn-success">
                          <i class="ace-icon fa fa-check bigger-120"></i>
                        </button>

                        <button class="btn btn-xs btn-info">
                          <i class="ace-icon fa fa-pencil bigger-120"></i>
                        </button>

                        <button class="btn btn-xs btn-danger">
                          <i class="ace-icon fa fa-trash-o bigger-120"></i>
                        </button>

                        <button class="btn btn-xs btn-warning">
                          <i class="ace-icon fa fa-flag bigger-120"></i>
                        </button>
                      </div>

                      <div class="hidden-md hidden-lg">
                        <div class="inline position-relative">
                          <button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
                            <i class="ace-icon fa fa-cog icon-only bigger-110"></i>
                          </button>

                          <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
                            <li>
                              <a href="#" class="tooltip-info" data-rel="tooltip" title="View">
  																			<span class="blue">
  																				<i class="ace-icon fa fa-search-plus bigger-120"></i>
  																			</span>
                              </a>
                            </li>

                            <li>
                              <a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
  																			<span class="green">
  																				<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
  																			</span>
                              </a>
                            </li>

                            <li>
                              <a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
  																			<span class="red">
  																				<i class="ace-icon fa fa-trash-o bigger-120"></i>
  																			</span>
                              </a>
                            </li>
                          </ul>
                        </div>
                      </div>
                    </td>
                  </tr>

                  <tr>
                    <td class="center">
                      <label class="position-relative">
                        <input type="checkbox" class="ace"/>
                        <span class="lbl"></span>
                      </label>
                    </td>

                    <td>
                      <a href="#">pro.com</a>
                    </td>
                    <td>$55</td>
                    <td class="hidden-480">4,250</td>
                    <td>Jan 21</td>

                    <td class="hidden-480">
                      <span class="label label-sm label-success">Registered</span>
                    </td>

                    <td>
                      <div class="hidden-sm hidden-xs btn-group">
                        <button class="btn btn-xs btn-success">
                          <i class="ace-icon fa fa-check bigger-120"></i>
                        </button>

                        <button class="btn btn-xs btn-info">
                          <i class="ace-icon fa fa-pencil bigger-120"></i>
                        </button>

                        <button class="btn btn-xs btn-danger">
                          <i class="ace-icon fa fa-trash-o bigger-120"></i>
                        </button>

                        <button class="btn btn-xs btn-warning">
                          <i class="ace-icon fa fa-flag bigger-120"></i>
                        </button>
                      </div>

                      <div class="hidden-md hidden-lg">
                        <div class="inline position-relative">
                          <button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
                            <i class="ace-icon fa fa-cog icon-only bigger-110"></i>
                          </button>

                          <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
                            <li>
                              <a href="#" class="tooltip-info" data-rel="tooltip" title="View">
  																			<span class="blue">
  																				<i class="ace-icon fa fa-search-plus bigger-120"></i>
  																			</span>
                              </a>
                            </li>

                            <li>
                              <a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
  																			<span class="green">
  																				<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
  																			</span>
                              </a>
                            </li>

                            <li>
                              <a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
  																			<span class="red">
  																				<i class="ace-icon fa fa-trash-o bigger-120"></i>
  																			</span>
                              </a>
                            </li>
                          </ul>
                        </div>
                      </div>
                    </td>
                  </tr>
                  </tbody>
                </table>
              </div><!-- /.span -->
            </div><!-- /.row -->


            <div id="modal-table" class="modal fade" tabindex="-1">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header no-padding">
                    <div class="table-header">
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        <span class="white">&times;</span>
                      </button>
                      Results for "Latest Registered Domains
                    </div>
                  </div>

                  <div class="modal-body no-padding">
                    <table class="table table-striped table-bordered table-hover no-margin-bottom no-border-top">
                      <thead>
                      <tr>
                        <th>配件编号</th>
                        <th>配件中文名</th>
                        <th>配件英文名</th>

                        <th>
                          <i class="ace-icon fa fa-clock-o bigger-110"></i>
                          Update
                        </th>
                      </tr>
                      </thead>

                      <tbody>
                      <tr>
                        <td>
                          <a href="#">ace.com</a>
                        </td>
                        <td>$45</td>
                        <td>3,330</td>
                        <td>Feb 12</td>
                      </tr>

                      <tr>
                        <td>
                          <a href="#">base.com</a>
                        </td>
                        <td>$35</td>
                        <td>2,595</td>
                        <td>Feb 18</td>
                      </tr>

                      <tr>
                        <td>
                          <a href="#">max.com</a>
                        </td>
                        <td>$60</td>
                        <td>4,400</td>
                        <td>Mar 11</td>
                      </tr>

                      <tr>
                        <td>
                          <a href="#">best.com</a>
                        </td>
                        <td>$75</td>
                        <td>6,500</td>
                        <td>Apr 03</td>
                      </tr>

                      <tr>
                        <td>
                          <a href="#">pro.com</a>
                        </td>
                        <td>$55</td>
                        <td>4,250</td>
                        <td>Jan 21</td>
                      </tr>
                      </tbody>
                    </table>
                  </div>

                  <div class="modal-footer no-margin-top">
                    <button class="btn btn-sm btn-danger pull-left" data-dismiss="modal">
                      <i class="ace-icon fa fa-times"></i>
                      Close
                    </button>

                    <ul class="pagination pull-right no-margin">
                      <li class="prev disabled">
                        <a href="#">
                          <i class="ace-icon fa fa-angle-double-left"></i>
                        </a>
                      </li>

                      <li class="active">
                        <a href="#">1</a>
                      </li>

                      <li>
                        <a href="#">2</a>
                      </li>

                      <li>
                        <a href="#">3</a>
                      </li>

                      <li class="next">
                        <a href="#">
                          <i class="ace-icon fa fa-angle-double-right"></i>
                        </a>
                      </li>
                    </ul>
                  </div>
                </div><!-- /.modal-content -->
              </div><!-- /.modal-dialog -->
            </div><!-- PAGE CONTENT ENDS -->
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.page-content-area -->
    </div><!-- /.page-content -->
  </div><!-- /.main-content -->

</div>


<script src="static/ace/js/bootstrap.min.js"></script>
<script src="static/ace/js/ace-elements.min.js"></script>
<script src="static/ace/js/ace.min.js"></script>
</body>
