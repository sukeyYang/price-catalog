<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
  String path = request.getContextPath();
  String webRoot = request.getScheme() + "://"
    + request.getServerName() + ":" + request.getServerPort()
    + path + "/";
%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
  <title>上海通用汽车延保精英汇</title>
  <link href="<%=webRoot %>/static/css/common.css" rel="stylesheet" type="text/css"/>
  <link href="<%=webRoot %>/static/css/index.css" rel="stylesheet" type="text/css"/>


  <SCRIPT LANGUAGE="JavaScript">
    function checkform(form) {
      if (form.username.value == "") {
        alert('抱歉，用户名不能为空！');
        return (false);
      }
      if (form.password.value == "") {
        alert('抱歉，密码不能为空！');
        return (false);
      }
    }
  </SCRIPT>
  <SCRIPT LANGUAGE="JavaScript">
    function resetBtn(fm) {
      fm.reset();
      return false;
    }
  </SCRIPT>
  <script language="javascript" type="text/javascript">
    var sum1 = 0;
    var sum2 = 0;
    function clean(id) {
      if (id == 1) {
        if (sum1 == 0) {
          document.getElementById('1').value = '';
        }
        sum1 = sum1 + 1;
      } else {
        if (sum2 == 0) {
          document.getElementById('2').value = '';
        }
        sum2 = sum2 + 1;
      }
    }
  </script>
  <script>
    $(function () {
      $('#login_label_box div').mouseover(
        function () {
          $(this).addClass('login_move').removeClass('login_label_bottom').siblings().removeClass('login_move').addClass('login_label_bottom');
          var id = $(this).attr('id');
          $("#type").val(id);
        }
      );
    });
  </script>

  <script type="text/javascript">
    $(function () {
      var error = "${error}";
      if (error != "") {
        alert(error);
      }
    })
  </script>

</head>

<body style="background:url('<%=webRoot %>static/images/login.jpg') no-repeat top center;">
<div class="loginBox">
  <div class="shadeDiv">
    <div class="shade"></div>
    <form name="loginForm" method="post" action="<%=webRoot %>/login/go">
      <div class="pr login_input_div"><span class="pa">用户名：</span><input name="username" class="login_input username" value='${EWID}' placeholder='用户名/EWID' type="text"/></div>
      <div class="pr login_input_div"><span class="pa">密  码：</span><input name="password" class="login_input" placeholder='密码' type="password"/></div>
      <input class="login_submit" type="submit" onclick="javascript:return checkform(this.form)" value="登录"/>
      <div class='mgt20'><a href="javascript:;" class="userguide">>>用户使用手册<<</a></div>
      <div class='mgt10' style='padding-top:10px;border-top:1px solid #b5c0ae'>
        <a style='float:left;width:50px;font-size:14px;text-align:center;border-right:1px solid #9e9e9c' href="<%=webRoot %>/login/procotol?event=activate">激活</a>
        <a style='float:left;width:70px;font-size:14px;text-align:center;border-right:1px solid #9e9e9c' href="<%=webRoot %>/login/procotol?event=password">忘记密码</a>
        <a style='float:left;width:70px;font-size:14px;text-align:center;border-right:1px solid #9e9e9c' href="<%=webRoot %>/login/procotol?event=getaccount">获取账号</a>
        <a style='float:left;width:70px;font-size:14px;text-align:center;border-right:1px solid #9e9e9c' href="<%=webRoot %>/login/procotol?event=exchbonus">奖金更新 </a>
        <a style='float:left;width:50px;font-size:14px;text-align:center;' href="<%=webRoot %>/login/procotol?event=regist">注册</a>

      </div>
    </form>
  </div>
</div>
</body>
</html>
