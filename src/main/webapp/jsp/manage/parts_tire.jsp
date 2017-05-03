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

    .form-group {
      padding: 0 15px;
    }

    .btn {
      display: inline-block;
      padding: 6px 12px;
      margin-bottom: 0;
      font-size: 14px;
      font-weight: 400;
      line-height: 1.42857143;
      text-align: center;
      white-space: nowrap;
      vertical-align: middle;
      -ms-touch-action: manipulation;
      touch-action: manipulation;
      cursor: pointer;
      -webkit-user-select: none;
      -moz-user-select: none;
      -ms-user-select: none;
      user-select: none;
      background-image: none;
      border: 1px solid transparent;
      border-radius: 4px !important;
    }

    .btn-group > .btn {
      display: inline-block;
      padding: 6px 12px;
      margin-bottom: 0;
      font-size: 14px;
      font-weight: 400;
      line-height: 1.42857143;
      text-align: center;
      white-space: nowrap;
      vertical-align: middle;
      -ms-touch-action: manipulation;
      touch-action: manipulation;
      cursor: pointer;
      -webkit-user-select: none;
      -moz-user-select: none;
      -ms-user-select: none;
      user-select: none;
      background-image: none;
      border: 1px solid transparent;
      border-radius: 4px !important;
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
  <!-- /section:basics/sidebar -->
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
          <a href="#">配件信息管理</a>

      </ul><!-- /.breadcrumb -->

      <!-- /section:basics/content.searchbox -->
    </div>

    <!-- /section:basics/content.breadcrumbs -->
    <div class="page-content">

      <!-- #section:settings.box -->
      <div class="ace-settings-container" id="ace-settings-container">
        <div class="btn btn-app btn-xs btn-warning ace-settings-btn"
             id="ace-settings-btn">
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
              <input type="checkbox" class="ace ace-checkbox-2"
                     id="ace-settings-navbar"/>
              <label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
            </div>

            <!-- /section:settings.navbar -->

            <!-- #section:settings.sidebar -->
            <div class="ace-settings-item">
              <input type="checkbox" class="ace ace-checkbox-2"
                     id="ace-settings-sidebar"/>
              <label class="lbl" for="ace-settings-sidebar"> Fixed
                Sidebar</label>
            </div>

            <!-- /section:settings.sidebar -->

            <!-- #section:settings.breadcrumbs -->
            <div class="ace-settings-item">
              <input type="checkbox" class="ace ace-checkbox-2"
                     id="ace-settings-breadcrumbs"/>
              <label class="lbl" for="ace-settings-breadcrumbs"> Fixed
                Breadcrumbs</label>
            </div>

            <!-- /section:settings.breadcrumbs -->

            <!-- #section:settings.rtl -->
            <div class="ace-settings-item">
              <input type="checkbox" class="ace ace-checkbox-2"
                     id="ace-settings-rtl"/>
              <label class="lbl" for="ace-settings-rtl"> Right To Left
                (rtl)</label>
            </div>

            <!-- /section:settings.rtl -->

            <!-- #section:settings.container -->
            <div class="ace-settings-item">
              <input type="checkbox" class="ace ace-checkbox-2"
                     id="ace-settings-add-container"/>
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
              <input type="checkbox" class="ace ace-checkbox-2"
                     id="ace-settings-hover"/>
              <label class="lbl" for="ace-settings-hover"> Submenu on
                Hover</label>
            </div>

            <div class="ace-settings-item">
              <input type="checkbox" class="ace ace-checkbox-2"
                     id="ace-settings-compact"/>
              <label class="lbl" for="ace-settings-compact"> Compact
                Sidebar</label>
            </div>

            <div class="ace-settings-item">
              <input type="checkbox" class="ace ace-checkbox-2"
                     id="ace-settings-highlight"/>
              <label class="lbl" for="ace-settings-highlight"> Alt. Active
                Item</label>
            </div>

            <!-- /section:basics/sidebar.options -->
          </div><!-- /.pull-left -->
        </div><!-- /.ace-settings-box -->
      </div><!-- /.ace-settings-container -->
      <div style="padding:36px 0;">
        <form class="form-inline" id="search">
          <div class="form-group">
            <label>配件号：</label>
            <input type="text" name="partsId" class="form-control"
                   placeholder="请输入配件ID">
          </div>

          <div class="form-group">
            <label>品牌：</label>
            <select name="carBrand" id="carBrand" class="form-control"
                    onchange="optionSeries()">
              <option value="">选择品牌</option>
              <option value="别克">别克</option>
              <option value="凯迪拉克">凯迪拉克</option>
              <option value="雪佛兰">雪佛兰</option>
            </select>
          </div>

          <div class="form-group">
            <label>车系：</label>
            <select name="carSeries" id="carSeries" class="form-control">
              <option value="">选择车系</option>
            </select>
          </div>
          <div class="btn-group">
            <button id="doSearch" type="button" class="btn btn-primary ">
              查&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;询
            </button>

          </div>

        </form>

      </div>

      <!-- /section:settings.box -->
      <div class="page-content-area">


        <div class="row">
          <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->


            <table id="grid-table"></table>

            <div id="grid-pager"></div>
            <input type="file" name="file" id="upload_data" style="opacity: 0">
            <a href="http://localhost/price-catalog/parts/download">下载</a>
            <script type="text/javascript">
              var $path_base = "..";//in Ace demo this will be used for editurl parameter
            </script>

            <!-- PAGE CONTENT ENDS -->
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.page-content-area -->
    </div><!-- /.page-content -->
  </div><!-- /.main-content -->

</div>
<script type="text/javascript">
  if ('ontouchstart' in document.documentElement) document.write("<script src='../assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>
<script src="static/ace/js/bootstrap.min.js"></script>

<!-- page specific plugin scripts -->
<script src="static/ace/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="static/ace/js/jqGrid/jquery.jqGrid.min.js"></script>
<script src="static/ace/js/jqGrid/i18n/grid.locale-en.js"></script>

<!-- ace scripts -->
<script src="static/ace/js/ace-elements.min.js"></script>
<script src="static/ace/js/ace.min.js"></script>
<script src="static/js/ajaxfileupload.js"></script>
<!-- inline scripts related to this page -->
<script type="text/javascript">
  $("#upload_data").on("change", function () {
    $.ajaxFileUpload({
      url: "<%=basePath%>/parts/fileupload",
      secureuri: false,
      fileElementId: "upload_data",
      data: {"name": "template"},
      success: function (msg, status) {
        alert("success")
      }
    })
    alert("submit");
  })
  jQuery(function ($) {
    var grid_selector = "#grid-table";
    var pager_selector = "#grid-pager";

    //resize to fit page size
    $(window).on('resize.jqGrid', function () {
      $(grid_selector).jqGrid('setGridWidth', $(".page-content").width());
    })
    //resize on sidebar collapse/expand
    var parent_column = $(grid_selector).closest('[class*="col-"]');
    $(document).on('settings.ace.jqGrid', function (ev, event_name, collapsed) {
      if (event_name === 'sidebar_collapsed' || event_name === 'main_container_fixed') {
        //setTimeout is for webkit only to give time for DOM changes and then redraw!!!
        setTimeout(function () {
          $(grid_selector).jqGrid('setGridWidth', parent_column.width());
        }, 0);
      }
    })


    $(grid_selector).jqGrid({
      url: "parts/parts-tire-list",
      mtype: "POST",
      datatype: "json",
      height: 620,
      colNames: ['配件编号', '配件中文名', '配件英文名','规格','供应商', '价格', '配件类型', '品牌', '车系','年款'],
      colModel: [
        {name: 'partsid', index: 'partsid', autowidth: true, align: "center"},
        {name: 'name_en', index: 'name_en', autowidth: true, align: "center"},
        {name: 'name', index: 'name', autowidth: true, align: "center"},
        {name: 'size', index: 'size', autowidth: true, align: "center"},
        {name: 'supplier', index: 'size', autowidth: true, align: "center"},
        {name: 'price', index: 'price', autowidth: true, align: "center"},
        {name: 'type', index: 'type', autowidth: true, align: "center"},
        {name: 'brand', index: 'brand', autowidth: true, align: "center"},
        {name: 'series', index: 'series', autowidth: true, align: "center"},
        {name: 'vehicle_year', index: 'vehicle_year', autowidth: true, align: "center"}
      ],
      viewrecords: true,
      rowNum: 15,
      rowList: [15, 30],
      rowheight: 38,
      pager: pager_selector,
      altRows: true,
      //toppager: true,

      multiselect: false,
      //multikey: "ctrlKey",
      multiboxonly: false,
      jsonReader: {
        repeatitems: true,
        cell: "cell",
        id: "0"
      },

      loadComplete: function () {
        var table = this;
        setTimeout(function () {
          styleCheckbox(table);

          updateActionIcons(table);
          updatePagerIcons(table);
          enableTooltips(table);
          var grid = $(grid_selector);
          var ids = grid.getDataIDs();
          for (var i = 0; i < ids.length; i++) {
            grid.setRowData(ids[i], false, {height: 40});
          }
        }, 0);
      },

      editurl: "/dummy.html",//nothing is saved
      caption: "配件信息"

      //,autowidth: true,


      /**
       ,
       grouping:true,
       groupingView : {
						 groupField : ['name'],
						 groupDataSorted : true,
						 plusicon : 'fa fa-chevron-down bigger-110',
						 minusicon : 'fa fa-chevron-up bigger-110'
					},
       caption: "Grouping"
       */

    });
    $(window).triggerHandler('resize.jqGrid');//trigger window resize to make the grid get the correct size


    //enable search/filter toolbar
    //jQuery(grid_selector).jqGrid('filterToolbar',{defaultSearch:true,stringResult:true})
    //jQuery(grid_selector).filterToolbar({});


    //switch element when editing inline
    function aceSwitch(cellvalue, options, cell) {
      setTimeout(function () {
        $(cell).find('input[type=checkbox]')
          .addClass('ace ace-switch ace-switch-5')
          .after('<span class="lbl"></span>');
      }, 0);
    }

    //enable datepicker
    function pickDate(cellvalue, options, cell) {
      setTimeout(function () {
        $(cell).find('input[type=text]')
          .datepicker({format: 'yyyy-mm-dd', autoclose: true});
      }, 0);
    }


    //navButtons
    jQuery(grid_selector).jqGrid('navGrid', pager_selector,
      { 	//navbar options
        edit: false,

        add: false,
        addicon: 'ace-icon fa fa-plus-circle purple',
        del: false,
        delicon: 'ace-icon fa fa-trash-o red',
        search: false,
        searchicon: 'ace-icon fa fa-search orange',
        refresh: true,
        refreshicon: 'ace-icon fa fa-refresh green',
        view: true,
        viewicon: 'ace-icon fa fa-search-plus grey',
      }
    ).jqGrid('navButtonAdd', pager_selector, {
      caption: "",
      buttonicon: "ace-icon fa fa-download green",
      onClickButton: function () {
        window.location.href = "<%=basePath%>parts/download"
      },
      position: "first",
      title: "download template",
      cursor: "pointer"
    })
      .jqGrid('navButtonAdd', pager_selector, {
        caption: "",
        buttonicon: "ace-icon fa fa-upload blue",
        onClickButton: function () {
          return $("#upload_data").click()
        },
        position: "last",
        title: "upload data",
        cursor: "pointer"
      })


    function style_edit_form(form) {
      //enable datepicker on "sdate" field and switches for "stock" field
      form.find('input[name=sdate]').datepicker({
        format: 'yyyy-mm-dd',
        autoclose: true
      })
        .end().find('input[name=stock]')
        .addClass('ace ace-switch ace-switch-5').after('<span class="lbl"></span>');
      //don't wrap inside a label element, the checkbox value won't be submitted (POST'ed)
      //.addClass('ace ace-switch ace-switch-5').wrap('<label class="inline" />').after('<span class="lbl"></span>');

      //update buttons classes
      var buttons = form.next().find('.EditButton .fm-button');
      buttons.addClass('btn btn-sm').find('[class*="-icon"]').hide();//ui-icon, s-icon
      buttons.eq(0).addClass('btn-primary').prepend('<i class="ace-icon fa fa-check"></i>');
      buttons.eq(1).prepend('<i class="ace-icon fa fa-times"></i>')

      buttons = form.next().find('.navButton a');
      buttons.find('.ui-icon').hide();
      buttons.eq(0).append('<i class="ace-icon fa fa-chevron-left"></i>');
      buttons.eq(1).append('<i class="ace-icon fa fa-chevron-right"></i>');
    }

    function style_delete_form(form) {
      var buttons = form.next().find('.EditButton .fm-button');
      buttons.addClass('btn btn-sm btn-white btn-round').find('[class*="-icon"]').hide();//ui-icon, s-icon
      buttons.eq(0).addClass('btn-danger').prepend('<i class="ace-icon fa fa-trash-o"></i>');
      buttons.eq(1).addClass('btn-default').prepend('<i class="ace-icon fa fa-times"></i>')
    }

    function style_search_filters(form) {
      form.find('.delete-rule').val('X');
      form.find('.add-rule').addClass('btn btn-xs btn-primary');
      form.find('.add-group').addClass('btn btn-xs btn-success');
      form.find('.delete-group').addClass('btn btn-xs btn-danger');
    }

    function style_search_form(form) {
      var dialog = form.closest('.ui-jqdialog');
      var buttons = dialog.find('.EditTable')
      buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-sm btn-info').find('.ui-icon').attr('class', 'ace-icon fa fa-retweet');
      buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-sm btn-inverse').find('.ui-icon').attr('class', 'ace-icon fa fa-comment-o');
      buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-sm btn-purple').find('.ui-icon').attr('class', 'ace-icon fa fa-search');
    }

    function beforeDeleteCallback(e) {
      var form = $(e[0]);
      if (form.data('styled')) return false;

      form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
      style_delete_form(form);

      form.data('styled', true);
    }

    function beforeEditCallback(e) {
      var form = $(e[0]);
      form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
      style_edit_form(form);
    }


    //it causes some flicker when reloading or navigating grid
    //it may be possible to have some custom formatter to do this as the grid is being created to prevent this
    //or go back to default browser checkbox styles for the grid
    function styleCheckbox(table) {
      /**
       $(table).find('input:checkbox').addClass('ace')
       .wrap('<label />')
       .after('<span class="lbl align-top" />')


       $('.ui-jqgrid-labels th[id*="_cb"]:first-child')
       .find('input.cbox[type=checkbox]').addClass('ace')
       .wrap('<label />').after('<span class="lbl align-top" />');
       */
    }


    //unlike navButtons icons, action icons in rows seem to be hard-coded
    //you can change them like this in here if you want
    function updateActionIcons(table) {
      /**
       var replacement =
       {
         'ui-ace-icon fa fa-pencil' : 'ace-icon fa fa-pencil blue',
         'ui-ace-icon fa fa-trash-o' : 'ace-icon fa fa-trash-o red',
         'ui-icon-disk' : 'ace-icon fa fa-check green',
         'ui-icon-cancel' : 'ace-icon fa fa-times red'
       };
       $(table).find('.ui-pg-div span.ui-icon').each(function(){
						var icon = $(this);
						var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
						if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
					})
       */
    }

    //replace icons with FontAwesome icons like above
    function updatePagerIcons(table) {
      var replacement =
      {
        'ui-icon-seek-first': 'ace-icon fa fa-angle-double-left bigger-140',
        'ui-icon-seek-prev': 'ace-icon fa fa-angle-left bigger-140',
        'ui-icon-seek-next': 'ace-icon fa fa-angle-right bigger-140',
        'ui-icon-seek-end': 'ace-icon fa fa-angle-double-right bigger-140'
      };
      $('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function () {
        var icon = $(this);
        var $class = $.trim(icon.attr('class').replace('ui-icon', ''));

        if ($class in replacement) icon.attr('class', 'ui-icon ' + replacement[$class]);
      })
    }

    function enableTooltips(table) {
      $('.navtable .ui-pg-button').tooltip({container: 'body'});
      $(table).find('.ui-pg-div').tooltip({container: 'body'});
    }

    //var selr = jQuery(grid_selector).jqGrid('getGridParam','selrow');

    $(document).on('ajaxloadstart', function (e) {
      $(grid_selector).jqGrid('GridUnload');
      $('.ui-jqdialog').remove();
    });

    (function ($) {
      $.fn.serializeJson = function () {
        var serializeObj = {};
        var array = this.serializeArray();
        var str = this.serialize();
        $(array).each(function () {
          if (serializeObj[this.name]) {
            if ($.isArray(serializeObj[this.name])) {
              serializeObj[this.name].push(this.value);
            } else {
              serializeObj[this.name] = [serializeObj[this.name], this.value];
            }
          } else {
            serializeObj[this.name] = this.value;
          }
        });
        return serializeObj;
      };
    })(jQuery);

    $("#doSearch").click(function () {
      //此处可以添加对查询数据的合法验证

      $(grid_selector).jqGrid('setGridParam', {
        datatype: 'json',
        postData: $("#search").serializeJson()
      }).trigger("reloadGrid");
    });
  });

  function optionSeries() {
    var brand = $("#carBrand").find("option:selected").text();
    $.get("<%=basePath%>/vehicle/series", {"brand": brand}, function (data) {
      $("#carSeries>:first").nextAll().remove();
      $.each(data, function (index, obj) {

        $("#carSeries").append("<option>" + obj.series + "</option>")
      })

    })
  }
</script>

</body>
