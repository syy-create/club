<%@ page import="java.util.ArrayList" %>
<%@ page import="Dao.Student.StudentBean" %><%--
  Created by IntelliJ IDEA.
  User: 十月
  Date: 2021/1/5
  Time: 14:04
  查看社团相关人员
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
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="../js/jquery-3.4.1.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="../js/bootstrap.min.js"></script>
    <title>查看社团人员</title>



    <!-- Single button -->

    <style>
        body{
            background-image: url("../image/背景01.jpg");
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }
        .btn{
            margin-right: 15px;
        }
        .list-group-item{
            opacity: 0.8;
            font-size: 15px;
        }
    </style>
</head>

<body>
<a href="#" class="list-group-item active">
    社团人员
</a>
<%
    String Sno=session.getAttribute("Sno").toString();
    String sql="select student.* from president,cs,student where president.Cname=cs.Cname  and cs.Sno=student.Sno and president.Sno='"+Sno+"';";
    ArrayList students=new Dao.Student.studentMessage().queryStudent(sql);
    for(int i=0;i<students.size();i++){
        StudentBean student=(StudentBean) students.get(i);
%>
<a href="#" class="list-group-item"><%=student.getSname()%>

    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="<%="#"+i%>" style="float: right">
        详情
    </button>
</a>
<!-- Modal -->
<div class="modal fade" id="<%=i%>"tabindex="-1" role="dialog" aria-labelledby="<%=i%>">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="<%=i%>">详情</h4>
            </div>
            <div class="modal-body">
                <div>学号:<%=student.getSno()%></div>
                <div>姓名:<%=student.getSname()%></div>
                <div>系别:<%=student.getSdept() %></div>

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
