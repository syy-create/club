<%@ page import="java.util.ArrayList" %>
<%@ page import="Dao.Student.presidentBean" %>
<%@ page import="Dao.Student.StudentBean" %>
<%@ page import="Dao.Club.ClubBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<%--查看已创建社团--%>
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
    <link rel="stylesheet" href="../font/iconfont.css">

    <style>
        body{
            background-image: url("../image/背景01.jpg");
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


<form method="post" action="search_club.jsp" target="right">
    <input id="sousuo" class="sbox"type="text" placeholder="search for...."name="info">
<%--    <input class="but"type="submit" value="搜索" name="search">--%>
    <button class="iconfont icon-ziyuan" type="submit"> </button>
</form>

<a href="#" class="list-group-item active">
    社团信息
</a>

<%

    String sql="select * from president ";

    ArrayList presidents = new Dao.Student.studentMessage().queryPresident(sql);
    for(int i=0;i<presidents.size();i++){
        presidentBean president = (presidentBean) presidents.get(i);

        String sql1="select * from student where Sno='"+president.getSno()+"';";
        ArrayList students= new Dao.Student.studentMessage().queryStudent(sql1);
        StudentBean student = (StudentBean) students.get(0);

        sql1="select * from club where Cname='"+president.getCname()+"'";
        ArrayList list2 = new Dao.Club.clubMessage().querryClub(sql1);
        ClubBean club = (ClubBean) list2.get(0);

%>

<a href="#" class="list-group-item"><%=president.getCname()%>
    <%out.print("——————");%>
    <button type="button" class="btn btn-primary btn-default" data-toggle="modal" data-target="<%="#"+i%>" style="float: right">
        社团详情
    </button>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;社长姓名：<%=student.getSname()%>

</a>

<!-- Modal -->
<div class="modal fade" id="<%=i%>" tabindex="-1" role="dialog" aria-labelledby="<%=i%>">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel02">Modal title</h4>
            </div>
            <div class="modal-body">
                <div>社团名称:<%=club.getCname()%></div>
                <div>社团归属系:<%=club.getCsdept()%></div>
                <div>社团类别:<%=club.getCclass()%></div>
                <div>指导老师:<%=club.getCteacher()%></div>
                <div>社团人数:<%=club.getCperson()%></div>
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
