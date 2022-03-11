<%@ page import="java.util.ArrayList" %>
<%@ page import="Dao.Apply.applyBean" %><%--
  Created by IntelliJ IDEA.
  User: 十月
  Date: 2021/1/6
  Time: 13:21
  申请创办社团审核
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
    社团申请界面
</a>
<%
    String sql="select * from apply";
    ArrayList applyClubs = new Dao.Apply.applyMessage().queryApplyClub(sql);
    for(int i=0;i<applyClubs.size();i++){
        applyBean applyClub = (applyBean) applyClubs.get(i);
%>
<form method="post" action="${pageContext.request.contextPath}/mclub_check">
<a href="#" class="list-group-item"><%="学号为"+applyClub.getAsno()+"申请创办"+applyClub.getAcname()+"的社团！"%>
    <input type="hidden" name="Asno" value="<%=applyClub.getAsno()%>">
    <input type="hidden" name="Acname" value="<%=applyClub.getAcname()%>">
    <input type="hidden" name="Acclass" value="<%=applyClub.getAcclass()%>">
    <input type="hidden" name="Acsdept" value="<%=applyClub.getAcsdept()%>">
    <input type="hidden" name="Acteacher" value="<%=applyClub.getActeacher()%>">
    <input type="hidden" name="Accomment" value="<%=applyClub.getAccomment()%>">
    <input type="hidden" name="Acreason" value="<%=applyClub.getAcreason()%>">
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
                <div>社团名称:<%=applyClub.getAcname()%></div>
                <div>所属类别:<%=applyClub.getAcclass()%></div>
                <div>所属学院:<%=applyClub.getAcsdept()%></div>
                <div>指导老师:<%=applyClub.getActeacher()%></div>
                <div>社团简介:<%=applyClub.getAccomment()%></div>
                <div>申请理由:<%=applyClub.getAcreason()%></div>
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
