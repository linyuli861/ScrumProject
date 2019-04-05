<%-- 
    Document   : submitHomework
    Created on : 2015-10-7, 19:36:11
    Author     : OovEver
--%>

<%@page contentType="text/html" pageEncoding="gbk"%>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
    <head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>
            ѧ����Ϣ����ƽ̨
        </title><link href="../../Style/studentStyle.css" rel="stylesheet" type="text/css" /><link href="../../Script/jBox/Skins/Blue/jbox.css" rel="stylesheet" type="text/css" /><link href="../../Style/ks.css" rel="stylesheet" type="text/css" />
        <script src="../../Script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
        <script src="../../Script/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
        <script src="../../Script/jBox/i18n/jquery.jBox-zh-CN.js" type="text/javascript"></script>
        <script src="../../Script/Common.js" type="text/javascript"></script>
        <script src="../../Script/Data.js" type="text/javascript"></script>
        <script type="text/javascript">
            $().ready(function() {
                setStudMsgHeadTabCheck();
                showUnreadSysMsgCount();
            });

            //�ҵ���Ϣͷ��ѡ�
            function setStudMsgHeadTabCheck() {
                var currentUrl = window.location.href;
                currentUrl = currentUrl.toLowerCase();
                var asmhm = "";
                $("#ulStudMsgHeadTab li").each(function() {
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
                    StudentLogin.loginOut(function(data) {
                        if (data == "true") {
                            window.location = "/Login.aspx";
                        }
                        else {
                            jBox.alert("�˳�ʧ�ܣ�", "��ʾ", new {buttons: {"ȷ��": true}});
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
                    studentInfo.changeStudentCateory(cateoryId, function(data) {
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
            function returnIndex() {
                window.location = "/Index.aspx";
            }
            function showMsg(msg, obj) {
                jBox.tip(msg);
                $("#" + obj).focus();
            }
            function saveClick(studentId) {
                var Ctitle = $("#Ctitle").val();   //��Ϣ����
                if (Ctitle == "" || Ctitle.length > 20) {
                    showMsg("����������Ϣ����,�Ҳ�����20���֣�", "Ctitle");
                    return false;
                }
                var Ctype = $("#Ctype").val();  //��Ϣ����
                if (Ctype == ("Unselected")) {
                    showMsg("����ѡ��Ͷ�����ͣ�", "Ctype");
                    return false;
                }
                var Ccontent = $("#Ccontent").val(); //��Ϣ����
                if (Ccontent == "" || Ccontent.length > 80) {
                    showMsg("����������Ϣ���ݣ��Ҳ�����80���֣�", "Ccontent");
                    return false;
                }
                StudentCompain.insertCompain(studentId, Ctitle, Ctype, Ccontent, function(data) {
                    var obj = $.parseJSON(data);
                    if (obj.ok == true) {
                        jBox.alert(obj.message, "��ʾ");
                        setTimeout(function() {
                            window.location.reload();
                        }, 1500);
                    }
                    else {
                        jBox.tip(obj.message);
                    }
                });
            }
        </script>
    </head>
    <body>

        <div class="banner">
            <div class="bgh">
                <div class="page">
                    <div id="logo">
                        <a href="../../Index.aspx.html">
                            <img src="../../Images/Student/logo.gif" alt="" width="165" height="48" />
                        </a>
                    </div>
                    <div class="topxx">
                        <select onchange="changeCateory($(this))" style="font-size: 11px; background: #4991cf;
                                color: #fff;">

                            <option 
                                value="4">
                                Զ��</option>

                            <option selected='selected'
                                    value="1">
                                �Կ�</option>

                        </select>
                        910513201419ѧԱ�����ǣ���ӭ���� <a href="../../MyInfo/Index.aspx.html">�ҵ���Ϣ</a> <a href="systemMsge.aspx.html">
                            ֪ͨ</a> <a href="../Account/ChangePasswd.aspx.html">�����޸�</a> <a onclick="loginOut()"
                                                                                       href="javascript:">��ȫ�˳�</a>
                    </div>
                    <div class="blog_nav">
                        <ul>
                            <li><a href="../../Index.aspx.html">�ҵ���Ϣ</a></li>
                            <li><a href="../../EducationCenter/Score.aspx.html">��������</a></li>
                            <li><a href="../../MyAccount/wdcw.aspx.html">�ҵ�ѧ��</a></li>
                            <li><a href="../../OnlineTeaching/StudentMaterial.aspx.html">��������</a></li>
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
                            <strong>��������</strong>
                            <div class="leftbgbt">
                            </div>
                        </div>
                        <div class="cdlist">
                            <div>
                                <a href="../../MyInfo/Index.aspx.html">�ҵ���Ϣ</a></div>
                            <div>
                                <a href="../../MyInfo/ClassInfo.aspx.html">�༶��Ϣ </a>
                            </div>
                            <div>
                                <a href="Letter.aspx.html">����Ϣ</a></div>
                            <div>
                                <a href="systemMsge.aspx.html">ѧԺ֪ͨ</a></div>
                            <div>
                                <a href="../../MyInfo/Objection.aspx.html">�ҵ�����</a></div>
                        </div>
                        <div class="ta1">
                            <strong>��������</strong>
                            <div class="leftbgbt2">
                            </div>
                        </div>
                        <div class="cdlist">
                            <div>
                                <a href="../../EducationCenter/Application.aspx.html">�ҵı���</a></div>
                            <div>
                                <a href="../../EducationCenter/Score.aspx.html">�ҵĳɼ�</a></div>
                            <div>
                                <a href="../../EducationCenter/Book.aspx.html">�ҵ��鼮</a></div>
                        </div>
                        <div class="ta1">
                            <strong>ѧϰ����</strong><div class="leftbgbt2">
                            </div>
                        </div>
                        <div class="cdlist">
                            <div>
                                <a href="../../OnlineTeaching/StudentMaterial.aspx.html">��������</a></div>
                            <div>
                                <a href="../../OnlineTeaching/StudentStudyRecordList.aspx.html">ѧϰ����</a></div>
                        </div>

                        <div class="ta1">
                            <strong>��������</strong><div class="leftbgbt2">
                            </div>
                        </div>
                        <div class="cdlist">
                            <div>
                                <a href="../../MyAccount/wdcw.aspx.html">�ҵĲ���</a></div>
                        </div>
                        <div class="ta1">
                            <a href="http://www.csgb.net/login.aspx?userLoginName=2014&userName=����&professionId=F40C998A-D9AC-421F-99C9-C024C1DC53AD&flag=sm" target="_blank"><strong>��ѧϵͳ</strong></a>
                            <div class="leftbgbt2">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="rightbox">

                    <h2 class="mbx">�ҵ���Ϣ &gt; ����Ϣ</h2>
                    <div class="morebt">


                        <ul id="ulStudMsgHeadTab">
                            <li><a class="tab2" onclick="" href="../../MyInfo/Index.aspx.html">��������</a> </li>
                            <li><a class="tab2" onclick="" href="../../MyInfo/ClassInfo.aspx.html">�༶��Ϣ</a></li>
                            <li><a class="tab1" onclick="" href="../User/StudentInfor/Letter.aspx.html">����Ϣ</a></li>
                            <li><a class="tab2" onclick="" href="systemMsge.aspx.html">֪ͨ<span style="color:#ff0000; padding-left:5px;" id="unreadSysMsgCount"></span></a></li>
                            <li><a class="tab2" onclick="" href="../../MyInfo/Objection.aspx.html">�ҵ�����</a></li>
                        </ul>

                    </div>
                    <div class="cztable">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <th style="text-align:center;" width="5%">���</th>
                                <th style="text-align:center;" width="10%">����</th>
                                <th width="15%">����</th>
                                <th width="20%">����</th>
                                <th style="text-align:center;" width="18%">���ʱ��</th>
                                <th style="text-align:center;" width="13%">״̬</th>
                            </tr>

                            <tr style="height: 28px" class="tdbg" align="center">
                                <td colspan="13" align="left" style="color: Red; font-weight:bold;">������Ϣ!</td>
                            </tr>

                        </table>
                    </div>

                    <div class="cztable">
                        <h2 class="mbx">�ҵ���Ϣ &gt; �������η�����</h2>

                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="15%" align="right"><div align="right">�ύ��ҵ�� </div></td>
                                <td>

                                    <form action="../../upload?file=upLoadByjs" method="post" ENCTYPE="multipart/form-data">
                                        <input type="file" name=file1" size="30">                                                
                                                                        <input type="submit" value="�ϴ�">
                                                                            </form>

                                                                            </td>
                                                                            </tr>       
                                                                            <tr>
                                                                                <td colspan="2" align="center">
                                                                                    <div align="center" >
                                                                                        <input type="submit" value="�ύ" onclick="saveClick('7c50f70a-775b-4aef-8bf2-5010ec612c0d')" class="input2" />
                                                                                        <input type="submit" value="����" onclick="returnIndex()" class="input2" />
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            </table>
                                                                            </div>

                                                                            </div>
                                                                            </div>
                                                                            <div class="footer">
                                                                                <p>
                                                                                    &copy;copyright 2012 �㲩���� csgb.net ��Ȩ���� վ��ͳ��</p>
                                                                            </div>
                                                                            </div>
                                                                            </body>
                                                                            </html>
