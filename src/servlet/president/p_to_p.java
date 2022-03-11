package servlet.president;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "p_to_p",urlPatterns = "/p_to_p")
public class p_to_p extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /**
         * @Description: 社长进行权限转让
         *@param request 浏览器申请信息
         *@param response 服务器返回信息
         * @return: void
         * @Date: 2021/1/13
         */
        String newSno=request.getParameter("newSno");
        HttpSession session=request.getSession();
        String oldSno=session.getAttribute("Sno").toString();
        //String oldSno="01";
        String sql="update president set Sno='"+newSno+"' where Sno='"+oldSno+"'";
        int i=new Dao.Apply.applyMessage().insertApply(sql);
        response.sendRedirect(request.getContextPath()+"/login/login.html");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
