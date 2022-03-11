<%@ page import="java.util.ArrayList" %>
<%@ page import="Dao.Activity.activtyBean" %>
<%--
  Created by IntelliJ IDEA.
  User: 十月
  Date: 2021/1/5
  Time: 17:55
  学生加入的活动
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->


    <!-- Bootstrap -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="../../js/jquery-3.4.1.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="../../js/bootstrap.min.js"></script>



    <!-- Single button -->

    <style>
        body{
            background-image: url("../../image/背景10.jpg");
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }
        .btn{
            margin-right: 15px;
        }
    </style>
</head>

<body>
<a href="#" class="list-group-item active">
    我加入的活动
</a>
<%
    //String sql="select activity.* from activity,a_s where activity.Aname=a_s.Aname and a_s.Sno='01';";
    String Sno=session.getAttribute("Sno").toString();
    String sql="select activity.* from activity,a_s where activity.Aname=a_s.Aname and a_s.Sno='"+Sno+"';";
    ArrayList activitys=new Dao.Activity.activityMessage().queryActivity(sql);
    for(int i=0;i<activitys.size();i++){
        activtyBean activity=(activtyBean) activitys.get(i);
%>
<form method="post" action="${pageContext.request.contextPath}/quit_activity">
    <a href="#" class="list-group-item"><%=activity.getAname()%>
        <input type="hidden" name="Aname" value="<%=activity.getAname()%>">
        <button type="submit" name="apply"  class="btn btn-primary btn-sm" id="<%=i+10%>" style="float: right">
            退出活动
        </button>
        <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="<%="#"+i%>" style="float: right">
            详情
        </button>
    </a>
</form>
<!-- Modal -->
<div class="modal fade" id="<%=i%>"tabindex="-1" role="dialog" aria-labelledby="<%=i%>">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="<%=i%>">详情</h4>
            </div>
            <div class="modal-body">
                <div>活动名称:<%=activity.getAname()%></div>
                <div>举办社团:<%=activity.getCname()%></div>
                <div>举办时间:<%=activity.getAtime()%></div>
                <div>举办地点:<%=activity.getAplace()%></div>
                <div>活动简介:<%=activity.getAcontent()%></div>
                <div>最大参与人数:<%=activity.getAnum()%></div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<script>
    document.getElementById("<%=i+10%>").onclick=function () {
        var flag=confirm("你确定要退出<%=activity.getAname()%>活动吗？若如确定，则需等待活动举办者同意方可退出！")
         if(!flag){
            return false;
         }
     }
</script>
<%
    }
%>
</body>
</html>


