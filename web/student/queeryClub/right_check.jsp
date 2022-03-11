<%--
  Created by IntelliJ IDEA.
  User: 十月
  Date: 2020/12/29
  Time: 18:30
  显示所有的社团
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
    <link rel="stylesheet" href="../../font/iconfont.css">


    <style>
        body{
            background-image: url("../../image/背景01.jpg");
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
        .btn {

            margin-right: 15px;

            border:1px solid white;
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
<form method="post" action="select.jsp" target="right">
<input class="sbox"type="text" name="message" placeholder="search for....">
<%--<input class="but"type="submit" value="搜索" name="search">--%>
    <button class="iconfont icon-ziyuan" type="submit"> </button>
</form>
<a href="#" class="list-group-item active">
    社团信息
</a>
<%
    ArrayList clubs=new Dao.Club.clubMessage().queryAllClub();
    for(int i=0;i<clubs.size();i++){
        ClubBean club=(ClubBean) clubs.get(i);
%>
<form  method="post" action="${pageContext.request.contextPath}/apply" >
<a href="#" class="list-group-item"><%=club.getCname()%>
    <input type="hidden" name="Cname" value="<%=club.getCname()%>">
    <button type="submit" name="apply"  class="btn btn-primary btn-sm" id="<%=i+10%>" style="float: right">
        申请加入
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
    document.getElementById("<%=i+10%>").onclick=function () {
        var flag=confirm("你确定要申请加入<%=club.getCname()%>社团吗");
        if(!flag){
            return false;
        }
    }
</script>
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
</body>
</html>
