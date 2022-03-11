package servlet.login;

import Dao.Manager.ManagerBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "managerLogin",urlPatterns = "/managerLogin")
public class managerLogin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /**
        * @Description: 管理员验证登录
        *@param request 浏览器申请信息
         *@param response 服务器返回信息
        * @return: void
        * @Date: 2021/1/13
        */
        String Mno=request.getParameter("Mno");
        String Mpassword=request.getParameter("Mpassword");
        HttpSession session=request.getSession();
        PrintWriter out=response.getWriter();
        session.setAttribute("Mno",Mno);
        session.setAttribute("Mpassword",Mpassword);
        ArrayList managers=new Dao.Manager.ManagerMessage().queryAllManager();

        for(int i=0;i<managers.size();i++){
            ManagerBean manager=(ManagerBean) managers.get(i);
            if (Mno.equals(manager.getMno())) {
                if (Mpassword.equals(manager.getMpassword())) {
                    response.sendRedirect(request.getContextPath()+"/manager/Mmain.html");
                    break;
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
