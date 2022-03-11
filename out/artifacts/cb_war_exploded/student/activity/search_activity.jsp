<%@ page import="java.util.ArrayList" %>
<%@ page import="Dao.Activity.activtyBean" %><%--
  Created by IntelliJ IDEA.
  User: 十月
  Date: 2021/1/5
  Time: 20:20
  搜索特定的活动
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
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="../../js/jquery-3.4.1.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="../../js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../../font/iconfont.css">

    <style>
        body{
            background-image: url("../../image/背景10.jpg");
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }
        input{
            position: relative;
            display: inline-block;
            font-size: 15px;
            box-sizing: border-box;
            transition: 5s;
        }
        .sbox{
            padding-left: 10px;
            background:#fffdef;
            margin: 15px -5px 15px 40%;
            outline: none;
            border-radius: 25px 0 0 25px;
            width:200px;
            height: 35px;
            box-sizing: border-box;
        }
        .iconfont{
            background:#fffdef;
            position: relative;
            width: 50px;
            height: 35px;
            border-radius: 0 25px 25px 0;
            outline: none;
            cursor: pointer;
            background-color:#c4e3f3 ;

        }
        .list-group-item{
            opacity: 0.8;
            font-size: 15px;
        }
    </style>
</head>
<body>


<form method="post" action="second_search_activity.jsp" target="right">
    <input id="sousuo" class="sbox"type="text" placeholder="search for...."name="info">
<%--    <input class="but"type="submit" value="搜索" name="search">--%>
    <button class="iconfont icon-ziyuan" type="submit"> </button>
</form>

<a href="#" class="list-group-item active">
    活动信息
</a>

<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");
    String name=request.getParameter("info");
    String sql="select * from activity where Aname like '%"+name+"%'";
    ArrayList activitys = new Dao.Activity.activityMessage().queryActivity(sql);
    for(int i=0;i<activitys.size();i++){
        activtyBean activity = (activtyBean) activitys.get(i);
%>

<form method="post" action="${pageContext.request.contextPath}/apply_activity">
<a href="#" class="list-group-item"><%=activity.getAname()%>
    <input type="hidden" name="Aname" value="<%=activity.getAname()%>">
    <input type="hidden" name="Aname" value="<%=activity.getCname()%>">
    <button type="button" class="btn btn-primary btn-default" data-toggle="modal" data-target="<%="#"+i%>" style="float: right">
        详情
    </button>
    <button type="submit" id="join" class="btn btn-primary btn-default" name="join_bad" style="float: right">
        申请加入
    </button>
</a>
</form>
<!-- Modal -->
<div class="modal fade" id="<%=i%>" tabindex="-1" role="dialog" aria-labelledby="<%=i%>">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel02">活动详情</h4>
            </div>
            <div class="modal-body">
                <div>活动名称:<%=activity.getAname()%></div>
                <div>社团名称:<%=activity.getCname()%></div>
                <div>时间:<%=activity.getAtime()%></div>
                <div>地点:<%=activity.getAplace()%></div>
                <div>内容:<%=activity.getAcontent()%></div>
                <div>参加人数:<%=activity.getAnum()%></div>
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

<ul class="pagination">
    <li><a href="#">&laquo;</a></li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li><a href="#">&raquo;</a></li>
</ul>

<script>
    document.getElementById("join").onclick=function () {
        var flag=confirm("确定加入该社团吗?");
        if(!flag){
            return false;
        }
    }
</script>

</body>
</html>
