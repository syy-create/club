<%@ page import="java.util.ArrayList" %>
<%@ page import="Dao.Activity.activtyBean" %><%--
  Created by IntelliJ IDEA.
  User: 十月
  Date: 2021/1/6
  Time: 15:17
  社团申请活动审核
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>首页</title>

    <!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="../js/jquery-3.4.1.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="../js/bootstrap.min.js"></script>


    <style>
        body{
            background-image: url("../image/背景09.jpg");
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }
        .btn{
            margin-left: 15px;
        }
        .list-group-item{
            opacity: 0.8;
            font-size: 15px;
        }
    </style>
</head>
<body>

<a href="#" class="list-group-item active">
    活动申请界面
</a>
    <%
    String sql="select * from activity_create";
    ArrayList applyActivitys = new Dao.Activity.activityMessage().queryApplyActivity(sql);
    for(int i=0;i<applyActivitys.size();i++){
        activtyBean applyActivity = (activtyBean) applyActivitys.get(i);
%>
<form method="post" action="${pageContext.request.contextPath}/mactivity_check">
    <a href="#" class="list-group-item"><%="社团"+applyActivity.getCname()+"申请创办"+applyActivity.getAname()+"的活动！"%>
        <input type="hidden" name="Asno" value="<%=applyActivity.getAsno()%>">
        <input type="hidden" name="Aname" value="<%=applyActivity.getAname()%>">
        <input type="hidden" name="Cname" value="<%=applyActivity.getCname()%>">
        <input type="hidden" name="Atime" value="<%=applyActivity.getAtime()%>">
        <input type="hidden" name="Aplace" value="<%=applyActivity.getAplace()%>">
        <input type="hidden" name="Acontent" value="<%=applyActivity.getAcontent()%>">
        <input type="hidden" name="Anum" value="<%=applyActivity.getAnum()%>">
        <button
                id="badminton" style="float: right" type="submit" name="flag" value="false" class="btn btn-primary"  > 不通过
        </button>
        <button
                style="float: right" type="submit" name="flag" value="true" class="btn btn-primary" > 通过
        </button>
        <button type="button" class="btn btn-primary btn-default" data-toggle="modal" data-target="<%="#"+i%>" style="float: right">
            申请详情
        </button>
    </a>
</form>
<!-- Modal -->
<div class="modal fade" id="<%=i%>" tabindex="-1" role="dialog" aria-labelledby="<%=i%>">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="<%=i%>">活动详情</h4>
            </div>
            <div class="modal-body">
                <div>活动名称:<%=applyActivity.getAname()%></div>
                <div>举办社团:<%=applyActivity.getCname()%></div>
                <div>举办时间:<%=applyActivity.getAtime()%></div>
                <div>举办地点:<%=applyActivity.getAplace()%></div>
                <div>活动简介:<%=applyActivity.getAcontent()%></div>
                <div>最大人数:<%=applyActivity.getAnum()%></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">确认</button>
            </div>
        </div>
    </div>
</div>
    <%
    }
%>
</body>
</html>