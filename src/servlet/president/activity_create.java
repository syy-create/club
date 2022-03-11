package servlet.president;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "activity_create",urlPatterns = "/activity_create")
public class activity_create extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /**
         * @Description: 社长申请创建活动
         *@param request 浏览器申请信息
         *@param response 服务器返回信息
         * @return: void
         * @Date: 2021/1/13
         */
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session=request.getSession();
        String Asno=session.getAttribute("Sno").toString();
        //String Asno="01";
        String Aname=request.getParameter("Aname");
        String Cname=request.getParameter("Cname");
        String Atime=request.getParameter("Atime");
        String Aplace=request.getParameter("Aplace");
        String Acontent=request.getParameter("Acontent");
        String Anum=request.getParameter("Anum");
        String sql="insert activity_create(Asno,Aname,Cname,Atime,Aplace,Acontent,Anum) " +
                "values('"+Asno+"','"+Aname+"','"+Cname+"','"+Atime+"','"
                +Aplace+"','"+Acontent+"','"+Anum+"');";
        int i=new Dao.Apply.applyMessage().insertApply(sql);
        response.sendRedirect(request.getContextPath()+"/president/activity_apply.html");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
