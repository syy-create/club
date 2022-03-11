package servlet.login;

import Dao.Student.StudentBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(urlPatterns ="/studentLogin")
public class studentLogin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /**
         * @Description: 学生验证登录
         *@param request 浏览器申请信息
         *@param response 服务器返回信息
         * @return: void
         * @Date: 2021/1/13
         */
        String Sno=request.getParameter("Sno");
        String Spassword=request.getParameter("Spassword");
        HttpSession session=request.getSession();
        PrintWriter out=response.getWriter();
        session.setAttribute("Sno",Sno);
        session.setAttribute("Spassword",Spassword);
        String sql="select * from president where Sno='"+Sno+"';";
        boolean exit=new Dao.Student.studentMessage().exitPresident(sql);
        //判断是否是社长学号，如果是则登录社长界面，否则登录普通学生界面
        if(exit) {
            ArrayList presidents = new Dao.Student.studentMessage().queryAllPresident();
            for (Object o : presidents) {
                StudentBean president = (StudentBean) o;
                if (Sno.equals(president.getSno())) {
                    if (Spassword.equals(president.getSpassword())) {
                        response.sendRedirect(request.getContextPath()+"/president/Pmain.html");
                        break;
                    }
                }
            }
        }else {
            ArrayList students = new Dao.Student.studentMessage().queryAllStudent();
            for (Object a : students) {
                StudentBean student = (StudentBean) a;
                if (Sno.equals(student.getSno())) {
                    if (Spassword.equals(student.getSpassword())) {
                        response.sendRedirect(request.getContextPath()+ "/student/main/main.html");
                        break;
                    } else {
                        out.println("<script language='javascript'>alert('帐号或密码错误，请重新输入!');" + "window.location.href='login.html';</script>");
                    }
                }else {
                    out.println("<script language='javascript'>alert('帐号或密码错误，请重新输入!');" + "window.location.href='login.html';</script>");
                }
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
