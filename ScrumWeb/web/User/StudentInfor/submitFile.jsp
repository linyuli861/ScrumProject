<%-- 
    Document   : submitFile
    Created on : 2015-12-3, 12:55:08
    Author     : OovEver
--%>

<%@page contentType="text/html" pageEncoding="gbk"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>
	��У��Դ������̳
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

        //�ҵ���Ϣͷ��ѡ�
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

        //��ʾδ��ϵͳ��Ϣ
        function showUnreadSysMsgCount() {
            var unreadSysMsgCount = "0";
            if (Number(unreadSysMsgCount) > 0) {
                $("#unreadSysMsgCount").html("(" + unreadSysMsgCount + ")");
            }
        }

        //�˳�
        function loginOut() {
            if (confirm("ȷ���˳���")) {
                StudentLogin.loginOut(function (data) {
                    if (data == "true") {
                        window.location = "/Login.aspx";
                    }
                    else {
                        jBox.alert("�˳�ʧ�ܣ�", "��ʾ", new { buttons: { "ȷ��": true} });
                    }
                });
            }
        }
        //���ı������
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
                jBox.tip("���������Ϊ�գ�");
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
                jBox.alert("�ɹ����Ϊ�Ѷ���", "��ʾ");
                setTimeout(function () {
                    window.location.reload();
                }, 1500);
            }
            else {
                $.jBox.error(result.message, '��ʾ');
            }
        });
        return result;
    }
</script>
    <script type="text/javascript">  
  
  
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
<a href="/Discuz/User/Account/Login.jsp">��¼</a>
<a href="/Discuz/User/Account/Register.jsp">ע��</a>        
<%
                                    }
                                    else
                                    {                                        
                                        out.print("��ӭ�� ");
                                    
%>
<a href="/Discuz/MyInfo/userInfo.jsp"><%=username%></a>
<a href="/Discuz/User/Account/ChangePasswd.jsp">�޸�����</a>
<a href="/Discuz/logOut">ע��</a>
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
                </div>
            </div>
            <div class="rightbox">
     <%
                     String school=(String)session.getAttribute("school");
                     String academy=(String)session.getAttribute("academy");
                     String Course=request.getParameter("school");
                     if(Course==null)
                     {
                         Course=(String)session.getAttribute("Course");
                     }
                session.setAttribute("Course", Course);
          String file=request.getParameter("file");
%>
           
<h2 class="mbx"><%=school%> &gt;<%=academy%> &gt;<%=Course%></h2>
<div class="morebt">
    


</div>

<div class="cztable">
    <table width="100%" cellpadding="0" cellspacing="0">   
        <form name="upload" action="../../upload?file=upLoadByjs" method="post" ENCTYPE="multipart/form-data">
        <tr>
            <td width="15%" align="right"><div align="right">�ϴ��ļ�</div></td>
            <td>            
                    <input type="file" name=file1" size="30">                                                
                                         
            
            </td>
         </tr>  
             
            <tr>
                   <td width="15%" align="right"><div align="right">
                    ����
                </div></td>
                <td>
                    <input type="text" name="credit" onkeyup="if(!/^\d+$/.test(this.value)) {alert('ֻ���������� !'); this.value=this.value.replace(/[^\d]+/g,'');}" >
                </td>
            </tr>
              <tr>
                   <td width="15%" align="right"><div align="right">
      <input type="submit" value="�ϴ�">           
          </td>
              </tr>
</form>
   </table>
  
</div>

            </div>
        </div>
        <%--<div class="footer">--%>
            <%--<p>--%>
                <%--&copy;copyright 2015���ɹŴ�ѧ�����ѧԺ ��Ȩ����</p>--%>
        <%--</div>--%>
    </div>
</body>
</html>


