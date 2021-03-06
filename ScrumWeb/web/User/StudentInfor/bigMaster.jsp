<%-- 
    Document   : bigMaster
    Created on : 2015-12-7, 15:52:51
    Author     : OovEver
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>
	高校资源共享论坛
</title><link href="../../Style/studentStyle.css" rel="stylesheet" type="text/css" /><link href="../../Script/jBox/Skins/Blue/jbox.css" rel="stylesheet" type="text/css" /><link href="../../Style/ks.css" rel="stylesheet" type="text/css" />
    <script src="../../Script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../../Script/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="../../Script/jBox/i18n/jquery.jBox-zh-CN.js" type="text/javascript"></script>
    <script src="../../Script/Common.js" type="text/javascript"></script>
    <script src="../../Script/Data.js" type="text/javascript"></script>
    <script type="text/javascript">
        $().ready(function () {
            setStudMsgHeadTabCheck();
            showUnreadSysMsgCount();
        });

        //我的信息头部选项卡
        function setStudMsgHeadTabCheck() {
            var currentUrl = window.location.href;
            currentUrl = currentUrl.toLowerCase();
            var asmhm = "";
            $("#ulStudMsgHeadTab li").each(function () {
                asmhm = $(this).find('a').attr("href").toLowerCase();
                if (currentUrl.indexOf(asmhm) > 0) {
                    $(this).find('a').attr("class", "tab1");
                    return;
                }
            });
        }

        //显示未读系统信息
        function showUnreadSysMsgCount() {
            var unreadSysMsgCount = "0";
            if (Number(unreadSysMsgCount) > 0) {
                $("#unreadSysMsgCount").html("(" + unreadSysMsgCount + ")");
            }
        }

        //退出
        function loginOut() {
            if (confirm("确定退出吗？")) {
                StudentLogin.loginOut(function (data) {
                    if (data == "true") {
                        window.location = "/Login.aspx";
                    }
                    else {
                        jBox.alert("退出失败！", "提示", new { buttons: { "确定": true} });
                    }
                });
            }
        }
        //更改报考类别
        function changeCateory(thisObj, id) {
            var oldCateoryId = $("#cateoryId").val();
            var cateoryId = "";
            if (id != null) {
                cateoryId = id;
            }
            else {
                cateoryId = thisObj.val();
            }
            var studentId = $("#studentId").val();
            if (cateoryId.length <= 0) {
                jBox.tip("报考类别不能为空！");
                if (id == null) {
                    thisObj.val(oldCateoryId);
                }
            }
            else {
                studentInfo.changeStudentCateory(cateoryId, function (data) {
                    var result = $.parseJSON(data);
                    if ((String(result.ok) == "true")) {
                        window.location.href = "/Index.aspx";
                    }
                    else {
                        jBox.tip(result.message);
                    }
                });
            }
        }
    </script>
    
<script type="text/javascript">
    function showMsg(msg, obj) {
        jBox.tip(msg);
        $("#" + obj).focus();
    }

    function modifySystemMsgeStatus(smid, smtype) {
        var result = false;
        studentInfo.modifySystemMesgeStatus(smid, smtype, function (data) {
            var result = $.parseJSON(data);
            if ((String(result.ok) == "true")) {
                jBox.alert("成功标记为已读！", "提示");
                setTimeout(function () {
                    window.location.reload();
                }, 1500);
            }
            else {
                $.jBox.error(result.message, '提示');
            }
        });
        return result;
    }
</script>
</head>
<body>

    <div class="banner">
        <div class="bgh">
            <div class="page">
                <div id="logo">
                   
                </div>
                 <div class="topxx">
                     <%
                     String username = (String) session.getAttribute("username");                                      
                                    if(username==null){        
%>     
<a href="/Discuz/User/Account/Login.jsp">登录</a>
<a href="/Discuz/User/Account/Register.jsp">注册</a>        
<%
                                    }
                                    else
                                    {                                        
                                        out.print("欢迎您 ");
                                    
%>
<a href="/Discuz/MyInfo/userInfo.jsp"><%=username%></a>
<a href="/Discuz/User/Account/ChangePasswd.jsp">修改密码</a>
<a href="/Discuz/logOut">注销</a>
<%
                                    }
%>
                </div>               
            </div>
        </div>
    </div>
    <div class="page">
        <div class="box mtop">
            <div class="leftbox">
                <div class="l_nav2">     
                       <div class="ta1">
                        <strong>个人中心</strong>
                        <div class="leftbgbt">
                        </div>
                    </div>
                    <div class="cdlist">
                      <div>
                                <a href="/Discuz/User/StudentInfor/showSchoolFB.jsp?type=course">课程管理</a></div>  
                         <div>
              <a href="/Discuz/User/StudentInfor/showSchoolFB.jsp?type=add">添加课程</a></div>   
                         <div>
                                <a href="/Discuz/User/StudentInfor/showSchoolFB.jsp?type=academy">学院管理</a></div>  
                              <div>
                                <a href="/Discuz/User/StudentInfor/showSchoolFB.jsp?type=addacademy">添加学院</a></div>  
                         <div>
                                <a href="/Discuz/User/StudentInfor/showSchoolFB.jsp?type=mastermg">小版主管理</a></div>  
                           <div>
                                <a href="/Discuz/User/StudentInfor/showSchoolFB.jsp?type=masteradd">添加小版主</a></div>  
                        <div>
              <a href="/Discuz/User/StudentInfor/showSchoolFB.jsp?type=question">问答管理</a></div>   
                        <div>
                     <a href="/Discuz/User/StudentInfor/showSchoolFB.jsp?type=file">资源管理</a></div>   
                    </div>   
                </div>
            </div>
            <div class="rightbox">
                
<div class="morebt">
    
</div>
<div class="cztable">
    <table border="0" cellspacing="0" cellpadding="0" width="500px" style="margin:30px auto 0px auto;">
        <tr align="center">
            <td width="50%">
                <a href="/Discuz/User/StudentInfor/showSchool.jsp?type=submit">上传资源</a>
            </td>
            <td width="50%">
               
            </td>
        </tr>     
         <tr align="center">
            <td width="50%">
                
            </td>
            <td width="50%">
               <a href="/Discuz/User/StudentInfor/showSchool.jsp?type=download">下载资源</a>
            </td>
        </tr>    
         <tr align="center">
            <td width="50%">
                <a href="/Discuz/User/StudentInfor/showSchool.jsp?type=answer">问答</a>
            </td>
            <td width="50%">
               
            </td>
        </tr>    
            <tr align="center">
            <td width="50%">
               
            </td>
            <td width="50%">
                <a href="/Discuz/MyInfo/addCredit.jsp">积分充值</a>
            </td>
        </tr>    
    </table>
  
</div>

            </div>
        </div>
        <%--<div class="footer">--%>
            <%--<p>--%>
                <%--&copy;copyright 2015内蒙古大学计算机学院 版权所有</p>--%>
        <%--</div>--%>
    </div>
</body>
                   <script> 
//取出传回来的参数error并与yes比较
  var errori ='<%=request.getParameter("error")%>';
  if(errori=='yes'){
   alert("还未登录无法充值请先登录");
  }
  if(errori=='yes2'){
   alert("还未登录，无法上传资源");
  }
  if(errori=='yes3'){
   alert("还未登录，无法下载资源");
  }
</script>
</html>
