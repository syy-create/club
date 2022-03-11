<%--
  Created by IntelliJ IDEA.
  User: 十月
  Date: 2020/12/30
  Time: 20:36
  搜索的社团
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Dao.Club.ClubBean" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>首页</title>

    <!-- Bootstrap -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="../../js/jquery-3.4.1.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="../../js/bootstrap.min.js"></script>


    <style>
        body{
            background-image: url("../../image/背景01.jpg");
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }
    </style>
</head>
<body>
<a href="#" class="list-group-item active">
    社团信息
</a>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");
    String name=request.getParameter("message");
    String sql="select * from club where Cname like '%"+name+"%'";
    ArrayList clubs=new Dao.Club.clubMessage().querryClub(sql);
    for(int i=0;i<clubs.size();i++){
        ClubBean club=(ClubBean) clubs.get(i);
%>
<form method="post" action="${pageContext.request.contextPath}/apply">
    <a href="#" class="list-group-item"><%=club.getCname()%>
        <input type="hidden" name="Cname" value="<%=club.getCname()%>">
        <button type="submit"name="apply" class="btn btn-primary btn-sm"  style="float: right">
            加入
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
<%
    }
%>
</body>
</html>
