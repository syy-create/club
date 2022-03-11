<%@ page import="java.util.ArrayList" %>
<%@ page import="Dao.Apply.studentApplyBean" %>
<%--
  Created by IntelliJ IDEA.
  User: 十月
  Date: 2021/1/4
  Time: 17:52
  学生加入社团审核
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

    <title>社团申请审核</title>
    <style>
        body{
            background: url("../image/背景10.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            margin: 25px;
        }
        .btn-primary{
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
    社团申请审核
</a>
<%
    String Sno=session.getAttribute("Sno").toString();
    //String Sno="01";
    String sql="select sapply.* from president,sapply where president.Cname=sapply.Cname  and president.Sno='"+Sno+"';";
    ArrayList applyStudent=new Dao.Apply.selectSApply().queryStudent(sql);
    for(int i=0;i<applyStudent.size();i++){
        studentApplyBean studentApply=(studentApplyBean) applyStudent.get(i);
%>
<form method="post" action="${pageContext.request.contextPath}/club_check">
    <input type="hidden" name="Ssno" value="<%=studentApply.getSno()%>">
    <input type="hidden" name="Cname" value="<%=studentApply.getCname()%>">
<a href="#" class="list-group-item"><%="学号为"+studentApply.getSno()+"的同学申请加入您的社团！"%>
    <button
            id="<%=i%>" name="flag" value="false" style="float: right" type="submit" class="btn btn-primary"  > 驳回
    </button>
    <button
            id="<%=i+"a"%>"  style="float: right"name="flag" value="true" type="submit" class="btn btn-primary"  > 批准
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
    社团退出审核
</a>
<%
    //String Sno=session.getAttribute("Sno").toString();
    sql="select squit.* from president,squit where president.Cname=squit.Cname  and president.Sno='"+Sno+"';";
    ArrayList quitStudent=new Dao.Apply.selectQuit().queryStudent(sql);
    for(int j=0;j<quitStudent.size();j++){
        Dao.Apply.studentQuitBean studentQuit=(Dao.Apply.studentQuitBean) quitStudent.get(j);
%>
<form method="post" action="${pageContext.request.contextPath}/club_quit_check">
    <input type="hidden" name="Ssno" value="<%=studentQuit.getSno()%>">
    <input type="hidden" name="Cname" value="<%=studentQuit.getCname()%>">
    <a href="#" class="list-group-item"><%="学号为"+studentQuit.getSno()+"的同学申请退出您的社团！"%>
        <button
                id="<%=j+"c"%>" name="flagquit" value="false" style="float: right" type="submit" class="btn btn-primary"  > 驳回
        </button>
        <button
                id="<%=j+"b"%>"  style="float: right"name="flagquit" value="true" type="submit" class="btn btn-primary"  > 批准
        </button>
    </a>
</form>
<script>
    document.getElementById("<%=j+"b"%>").onclick=function () {
        alert("批准已处理！")
    }
    document.getElementById("<%=j+"c"%>").onclick=function () {
        alert("驳回已处理！")
    }

</script>
<%
    }
%>
</body>
</html>
