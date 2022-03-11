<%@ page import="java.util.ArrayList" %>
<%@ page import="Dao.Apply.studentActivityBean" %><%--
  Created by IntelliJ IDEA.
  User: 十月
  Date: 2021/1/6
  Time: 9:49
  学生申请活动审核
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->


    <!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="../js/jquery-3.4.1.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="../js/bootstrap.min.js"></script>

    <title>活动申请审核</title>
    <style>
        body{
            background: url("../image/背景10.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            margin: 25px;
        }
        .btn-primary{
            background-color: slateblue;
            margin-left:15px;
        }
        .list-group-item{
            opacity: 0.8;
            font-size: 15px;
        }
    </style>

</head>
<body>
<a href="#" class="list-group-item active">
    活动人员申请审核
</a>
<%
    String Sno=session.getAttribute("Sno").toString();
    //String Sno="01";
    String sql="select aapply.* from president,aapply where president.Cname=aapply.Cname  and president.Sno='"+Sno+"';";
    ArrayList applyActivitys=new Dao.Apply.selectSApply().queryActiviy(sql);
    for(int i=0;i<applyActivitys.size();i++){
        studentActivityBean activityApply=(studentActivityBean) applyActivitys.get(i);
%>
<form method="post" action="${pageContext.request.contextPath}/activity_check">
<a href="#" class="list-group-item"><%="学号为"+activityApply.getSno()+"的同学申请加入您社团的"+activityApply.getAname()+"活动！"%>
    <input type="hidden" name="Asno" value="<%=activityApply.getSno()%>">
    <input type="hidden" name="Aname" value="<%=activityApply.getAname()%>">
    <button
            id="<%=i%>" style="float: right" type="submit" name="flag" value="false" class="btn btn-primary"  > 驳回
    </button>
    <button
            id="<%=i+"a"%>"  style="float: right" type="submit" name="flag" value="true" class="btn btn-primary"  > 批准
    </button>
</a>
</form>
<script>
    document.getElementById("<%=i+"a"%>").onclick=function () {
        alert("批准已处理！")
    }
    document.getElementById("<%=i%>").onclick=function () {
        alert("驳回已处理！")
    }

</script>
<%
    }
%>
<a href="#" class="list-group-item active">
    活动人员退出审核
</a>
<%
    sql="select aquit.* from president,aquit where president.Cname=aquit.Cname  and president.Sno='"+Sno+"';";
    ArrayList quitActivitys=new Dao.Apply.selectSApply().queryActiviy(sql);
    for(int j=0;j<quitActivitys.size();j++){
        studentActivityBean activityQuit=(studentActivityBean) applyActivitys.get(j);
%>
<form method="post" action="${pageContext.request.contextPath}/activity_quit_check">
    <a href="#" class="list-group-item"><%="学号为"+activityQuit.getSno()+"的同学申请加入您社团的"+activityQuit.getAname()+"活动！"%>
        <input type="hidden" name="Asno" value="<%=activityQuit.getSno()%>">
        <input type="hidden" name="Aname" value="<%=activityQuit.getAname()%>">
        <button
                id="<%=j+"b"%>" style="float: right" type="submit" name="flagquit" value="false" class="btn btn-primary"  > 驳回
        </button>
        <button
                id="<%=j+"c"%>"  style="float: right" type="submit" name="flagquit" value="true" class="btn btn-primary"  > 批准
        </button>
    </a>
</form>
<script>
    document.getElementById("<%=j+"c"%>").onclick=function () {
        alert("批准已处理！")
    }
    document.getElementById("<%=j+"b"%>").onclick=function () {
        alert("驳回已处理！")
    }

</script>
<%
    }
%>
</body>
</html>
