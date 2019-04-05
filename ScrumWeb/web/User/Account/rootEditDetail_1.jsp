<%-- 
    Document   : rootEditDetail
    Created on : 2015-10-6, 15:37:22
    Author     : OovEver
--%>

<%@page import="java.util.List"%>
<%@page import="com.StudentMS.DAO.UserManagerDao"%>
<%@page import="com.StudentMS.bean.User"%>
<%@page import="com.StudentMS.bean.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>
	学生信息管理平台
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
        
          function t(obj)
{
if(obj.value=="2")
{
document.getElementById("grade").style.display = ""
 if (grade == "") {
            $.jBox.tip("班级不能为空！", 'error');
            return false;
        }
}
else
document.getElementById("grade").style.display = "none"
}
    </script>
    
<script type="text/javascript" language="javascript">
    function changePassword() {
        var oldPwd = $("#txtOldPwd").val();
        var newPwd = $("#txtNewPwd").val();
        var confirmNewPwd = $("#txtConfirmNewPwd").val();
        var studentName=$("#studentName").val();
        var studentID=$("#studentID").val();
        var grade=$("#grade").val();
       
        if (studentID == "") {
            $.jBox.tip("学号不能为空！", 'error');
            return false;
        }
        if (studentName == "") {
            $.jBox.tip("姓名不能为空！", 'error');
            return false;
        }
        if (newPwd == "") {
            $.jBox.tip("密码或确认密码不能为空！", 'error');
            return false;
        }       
        if (newPwd.length < 6 || newPwd.length > 16) {
            $.jBox.tip("密码为6~16个字符，区分大小写！", 'error');
            return false;
        }
      
         if (grade == "") {
            $.jBox.tip("班级不能为空！", 'error');
            return false;
        }
         

        studentAccount.changePassword(studentName,oldPwd, newPwd, function (data) {
            var obj = $.parseJSON(data);
            if (obj.ok) {
                jBox.alert(obj.message, "提示");
                setTimeout(function () {
                    window.location.reload();
                }, 1500);
            }
            else {
                jBox.tip(obj.message, 'error');
            }
        });
    }
</script>
<style type="text/css">
    .txtinput1{width:180px;}
</style>
</head>
<body>

    <div class="banner">
        <div class="bgh">
            <div class="page">
               
                  <div class="topxx">
                    <%
                        
                     String username = (String) session.getAttribute("username");     
                      if(username==null)
                      {
                         response.sendRedirect("/StudentManageSystem/User/StudentInfor/index.jsp");
                      }
                                            
                                            out.print("欢迎您");
                                            out.print(username);
                                            %>
                                       
                   <a href="/StudentManageSystem/MyInfo/rootInfo.jsp">我的信息</a>  <a href="/StudentManageSystem/User/Account/ChangePasswd.jsp">密码修改</a> <a
                            href="/StudentManageSystem/loginOut">安全退出</a>
                </div>
                <div class="blog_nav">
                    <ul>
                         <li><a href="/StudentManageSystem/MyInfo/rootInfo.jsp">我的信息</a></li>
                    </ul>
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
                            <a href="/StudentManageSystem/MyInfo/rootInfo.jsp">我的信息</a></div>
                        <div>
                            <a href="/StudentManageSystem/User/Account/rootAdd.jsp">添加人员 </a>
                        </div>
                        <div>
                            <a href="/StudentManageSystem/MyInfo/rootEdit.jsp">人员管理</a></div>
            
                       
                    </div>   
                    
                </div>
            </div>
            <div class="rightbox">
                
<h2 class="mbx">我的信息 &gt; 编辑人员</h2>
<div class="cztable">
    
<table border="0" cellspacing="0" cellpadding="0" width="500px" style="margin:30px auto 0px auto;">
     <%     // String userName=request.getParameter("name");                                  
            int id;
            String idString=request.getParameter("id");
            id=Integer.parseInt(idString);            
             List<User> list = UserManagerDao.getInstance().selectEditRootInfo(id);
                            if (list == null || list.size() < 1) {
                                out.println("没有数据");
                            } else {
                                for (User pu : list) {
                              

                        %>
                        
    <form action="../../rootEditServlet?id=<%=idString%>" method="post" >
     <tr align="center">
        <th style="width:20%; text-align:left;">账号：</th>
        <td style="width:70%; text-align:left;"><input id="studentID" name="studentID" value="<%=pu.getUserName()%>" type="text" class="input_2 txtinput1" readonly/></td>
    </tr>
    <tr align="center">
        <th style="width:20%; text-align:left;">姓名：</th>
        <td style="width:70%; text-align:left;"><input id="studentName" name="studentName" value="<%=pu.getName()%>" type="text" class="input_2 txtinput1" /></td>
    </tr>
    <tr align="center">
        <th style="width:20%; text-align:left;">密码：</th>
        <td style="width:70%; text-align:left;"><input id="txtNewPwd" name="txtNewPwd" value="<%=pu.getPassWord()%>" type="text" class="input_2 txtinput1" />&nbsp;&nbsp;6~16个字符，区分大小写</td>
    </tr>
      <tr align="center">
        <th style="width:20%; text-align:left;">班级：</th>
        <td style="width:20%; text-align:left;"><input id="grade" name="grade" value="<%=pu.getGrade()%>" type="text" class="input_2 txtinput1" /></td>
    </tr>
              <tr align="center">
        <th style="width:20%; text-align:left;">级别：</th>
        <td style="width:20%; text-align:left;">
            <%
            String vipString="";
            if(pu.getVip()==1)
            {
                vipString="管理员";
            }
            else if(pu.getVip()==2)
            {
                vipString="教师";
            }
            
            %>
           <select name="select" size="1" onchange="t(this)">
                 <option value="<%= pu.getVip()%>" > <%=vipString%></option>
				    <option value="2">教师</option>
				    <option value="1">管理员</option>				   
			      </select>             
            
        </td>
  
    </tr>
    <tr>
    <td colspan="2" style="text-align:center;"><input type="submit" id="btnSubmit" value="更改信息" onclick="return changePassword()" class="input2" /></td>
    </tr>
     </form>
         <%
                                }
                            }
                        %>
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
   alert("用户已存在错误");
  }
  
</script>
</html>