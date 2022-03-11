<%@ page import="java.util.ArrayList" %>
<%@ page import="Dao.Club.ClubBean" %>
<%--
  Created by IntelliJ IDEA.
  User: 十月
  Date: 2021/1/4
  Time: 10:53
  学生加入的社团
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
        .btn{

            margin-right: 15px;
        }
        body{
            background-image: url("../../image/背景01.jpg");
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }
        .list-group-item{
            opacity: 0.8;
            font-size: 15px;
        }
    </style>
</head>

<body>
<a href="#" class="list-group-item active">
    我加入的社团
</a>
<%
    //String sql="select club.* from club,cs where club.Cname=cs.Cname and cs.Sno='01';";
    String Sno=session.getAttribute("Sno").toString();
    String sql="select club.* from club,cs where club.Cname=cs.Cname and cs.Sno='"+Sno+"';";
    ArrayList clubs=new Dao.Club.clubMessage().querryClub(sql);
    for(int i=0;i<clubs.size();i++){
        ClubBean club=(ClubBean) clubs.get(i);
%>
<form method="post"action="${pageContext.request.contextPath}/quitClub" >
<a href="#" class="list-group-item"><%=club.getCname()%>
    <input type="hidden" name="Cname" value="<%=club.getCname()%>">
    <button type="submit" name="apply"  class="btn btn-primary btn-sm" id="<%=i+"m"%>" style="float: right">
        退出社团
    </button>
    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="<%="#"+i%>" style="float: right">
        详情
    </button>
</a></form>
<!-- Modal -->
<div class="modal fade" id="<%=i%>"tabindex="-1" role="dialog" aria-labelledby="<%=i%>">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="<%=i%>">详情</h4>
            </div>
            <div class="modal-body">
                <div>社团名称:<%=club.getCname()%></div>
                <div>社团类别:<%=club.getCclass()%></div>
                <div>社团人数:<%=club.getCperson()+"" %></div>
                <div>社团归属学院:<%=club.getCsdept()%></div>
                <div>社团老师:<%=club.getCteacher()%></div>
                <div>社团简介:<%=club.getCcomment()%></div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<script>
    document.getElementById("<%=i+"m"%>").onclick=function () {
        var flag=confirm("你确定要退出社团吗");
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
