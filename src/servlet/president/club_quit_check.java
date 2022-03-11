package servlet.president;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "club_quit_check",urlPatterns = "/club_quit_check")
public class club_quit_check extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /**
         * @Description: 社长处理申请退出社团的学生
         *@param request 浏览器申请信息
         *@param response 服务器返回信息
         * @return: void
         * @Date: 2021/1/13
         */
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String Ssno=request.getParameter("Ssno");
        String Cname=request.getParameter("Cname");
        String flagquit=request.getParameter("flagquit");
        //out.print(Ssno+Cname+flagquit);
        if("true".equals(flagquit)){
            String sql="delete cs where Sno='"+Ssno+"' and Cname='"+Cname+"'";
            int k=new Dao.Apply.applyMessage().insertApply(sql);
            sql="delete from squit where Sno='"+Ssno+"'";
            k=new Dao.Apply.applyMessage().insertApply(sql);
            sql="update club set Cperson=Cperson-1 where Cname='"+Cname+"'";
            k=new Dao.Apply.applyMessage().insertApply(sql);
        }else{
            String sql="delete from squit where Sno='"+Ssno+"'";
            int k=new Dao.Apply.applyMessage().insertApply(sql);
        }
        response.sendRedirect(request.getContextPath()+"/president/Pright_club_check.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
