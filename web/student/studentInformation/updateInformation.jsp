<%@ page import="Dao.Student.StudentBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%--更新信息界面--%>
<head>
    <title>Title</title>
    <style media="screen">
        body{
            background-image: url("../../image/个人信息美化.png");
            color: #552100;
            background-repeat: no-repeat;
            background-size: cover;
        }
        .mask{
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background:  no-repeat;
            background-size: cover;
            filter: blur(5px);
            z-index: -1;
        }
        .popup{
            position: absolute;
            width: 850px;
            height: 500px;
            left: 35%;
            top: 60%;
            margin-left: -260px;
            margin-top: -320px;
            background-color:#dff9fb;
            border: 3px solid #7ed6df;
            padding:5px;
            background-clip: content-box;
            border-radius: 10px;
            color: #552100;
        }
        .title{
            text-align: center;
            font-size: 34px;
            color: #362e2b;
            display: flex;
        }
        .title .tip{
            padding: 0 20px;
        }
        .title .line{
            flex: 1;
            background:linear-gradient(
                    to bottom,
                    rgba(0,0,0,0) 49%,
                    #000 49%,
                    #000 51%,
                    rgba(0,0,0,0) 51%
            );
        }
        table{
            width: 100%;
        }
        input,select,textarea{
            padding:0;
            outline: none;
        }
        .form_left{
            text-align: right;
            font-size: 18px;
            width: 150px;
        }
        .form_right input[type="text"],
        .form_right input[type="password"]{
            height: 40px;
            width: 230px;
            background: transparent;
            border: none;
            border-bottom: 2px solid #999;
            text-indent: 20px;
            transition: .3s;
        }
        .form_right input[type="text"]:hover,
        .form_right input[type="password"]:hover{
            border-color:#888;
        }
        .popup tr{
            height: 65px;
        }
        .btn input{
            width:100px;
            height: 30px;
            background: #362e2b;
            color: #fff;
        }
        .form_right input[type="text"]:focus,
        .form_right input[type="password"]:focus{
            border-bottom-color: #562d2b;
        }
        .form_right input[type="text"]:focus~.move:after{
            transform: translateX(220px);
        }
        .form_right input[type="password"]::-webkit-input-placeholder,
        .form_right input[type="text"]::-webkit-input-placeholder
        {
            transition: .5s;
            font-size: 14px;
            transform-origin: top left;
        }
        .form_right input[type="password"]:focus::-webkit-input-placeholder,
        .form_right input[type="text"]:focus::-webkit-input-placeholder{
            transform: scale(.8) translateY(-15px);
        }
        input[name="gender"]{
            display: none;
        }
        .sex{
            padding-left: 30px;
            position: relative;
        }
        .sex:before{
            content: '';
            display: inline-block;
            width: 8px;
            height: 8px;
            border: 1px solid #000;
            border-radius: 50%;
            position:absolute;
            right: 25px;
            top: 1px;
            padding:5px;
        }
        input[name="gender"]:checked+label:before{
            background: #362e2b;
            background-clip: content-box;
        }
        .college{
            width: 15px;
            height: 15px;
            border: 1px solid #000;
            border-radius: 3px;
            display: inline-block;
            margin-right: 5px;
            position: relative;
        }
        .submit
        {

        }
    </style>
</head>
<body>
<div class="mask"></div>
<section class="popup">
    <h2 class="title">
            <span class="line">
            </span><span class="tip">个人信息</span>
        <span class="line"></span>
    </h2>
        <%
        String Sno=session.getAttribute("Sno").toString();
        //String Sno="01";
        String sql="select * from student where Sno='"+Sno+"';";
        //String sql="select * from student where Sno='01';";
        ArrayList students=new Dao.Student.studentMessage().queryStudent(sql);
        StudentBean student=(StudentBean)students.get(0);
    %>
    <form action="updateAfter.jsp">
        <table>
            <tbody>
            <tr>
                <td class="form_left">姓名：</td>
                <td class="form_right">


                    <input  type="text" name="Sname" placeholder="姓名不可修改" value="<%=student.getSname()%>">


                </td>
                <td class="form_left">性别：</td>
                <td class="form_right">
                    <input  type="text" name="Ssex" placeholder="性别不可修改" value="<%=student.getSsex()%>">
                </td>
            </tr>
            <tr>

                <td class="form_left">学号：</td>
                <td class="form_right">


                    <input  type="text" name="Sno" placeholder="学号不可修改" value="<%=student.getSno()%>">

                </td>
                <td class="form_left">所属学院：</td>
                <td class="form_right">
                    <input type="text" name="Sdept" placeholder="请输入学院名称" value="<%=student.getSdept()%>">
                </td>
            </tr>
            <tr>
                <td class="form_left">所属专业：</td>
                <td class="form_right">
                    <input type="text" name="Smajor" placeholder="请输入专业班级" value="<%=student.getSmajor()%>">
                </td>
                <td class="form_left">年级：</td>
                <td class="form_right">
                    <input type="text" name="Sgrade" placeholder="请输入所属年级" value="<%=student.getSgrade()%>">
                </td>
            </tr>
            <tr>
                <td class="form_left">联系电话：</td>
                <td class="form_right">
                    <input type="text" name="Sphone" placeholder="请输入本人联系电话" value="<%=student.getSphone()%>">
                </td>
                <td class="form_left">QQ：</td>
                <td class="form_right">
                    <input type="text" name="Sqq" placeholder="请输入QQ账号" value="<%=student.getSqq()%>">
                </td>
            </tr>
            <tr>
                <td class="form_left">个性签名：</td>
                <td class="form_right">
                    <input type="text" name="Ssign" placeholder="励志图存  自强不息" value="<%=student.getSsign()%>">
                </td>
            </tr>
            <tr>
                <td></td>
                <td class="form_left"></td>
                <td class="form_right btn">
                    <input type="submit" value="保存" >
                </td>
            </tr>
            </tbody>
        </table>
    </form>
</section>
</body>
</html>
