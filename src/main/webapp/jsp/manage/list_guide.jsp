<%--
  Created by IntelliJ IDEA.
  User: sukey
  Date: 2016/11/3
  Time: 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://"
    + request.getServerName() + ":" + request.getServerPort()
    + path + "/";
%>
<html>
<head>
  <title>办事指南</title>
  <%@ include file="common.jsp" %>
</head>
<body>
<!--
<table id="grid-table"></table>
<div id="pager"></div>
-->
<!-- /section:settings.box -->
					<div class="page-content-area">
						<div class="page-header">
							<h1>
								jqGrid
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									Dynamic tables and grids using jqGrid plugin
								</small>
							</h1>
						</div><!-- /.page-header -->

						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="well well-sm">
									<button type="button" class="close line-height-0" data-dismiss="alert">
										<i class="ace-icon fa fa-times smaller-75"></i>
									</button>

									You can have a custom jqGrid download here:
									<a href="http://www.trirand.com/blog/?page_id=6" target="_blank">
										http://www.trirand.com/blog/?page_id=6
										<i class="fa fa-external-link bigger-110"></i>
									</a>
								</div>

								<table id="grid-table"></table>

								<div id="pager"></div>

								<script type="text/javascript">
									var $path_base = "..";//in Ace demo this will be used for editurl parameter
								</script>

								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content-area -->
<script src="<%=basePath%>static/js/jquery.min.js"></script>
<script src="<%=basePath%>static/ace/js/jqGrid/jquery.jqGrid.min.js"></script>
<script src="<%=basePath%>static/ace/js/jqGrid/i18n/grid.locale-en.js"></script>
<script src="<%=basePath%>static/ace/js/ace-elements.min.js"></script>
<script src="<%=basePath%>static/ace/js/ace.min.js"></script>

<script>
  function setGrid() {
    $("#grid-table").jqGrid({
      url: "search_guide",
      datatype: "json",
      mtype: "POST",
      colNames: ["标题", "分类", "点击量", "是否置顶", "状态", "创建时间"],
      colModel: [

        {name: "title"},
        {name: "subtype"},
        {name: "hits", align: "center"},
        {name: "top", align: "center"},
        {name: "state", sortable: false},
        {name: "createtime", align: "center"}
      ],
      pager: "#pager",
      rowNum: 10,
      rowList: [10, 20, 30],
      viewrecords: true,
      altRows: true,
      gridview: true,
      autoencode: true,
      caption: "My first grid"
    });
  }
  $(function () {
    setGrid();
  })
</script>
</body>
</html>
