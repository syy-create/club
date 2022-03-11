package servlet.manager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "mactivity_check",urlPatterns = "/mactivity_check")
public class mactivity_check extends HttpServlet {
    /**
     * @Description: 管理员处理申请的活动
     *@param request 浏览器申请信息
     *@param response 服务器返回信息
     * @return: void
     * @Date: 2021/1/13
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String Asno=request.getParameter("Asno");
        String Aname=request.getParameter("Aname");
        String Cname=request.getParameter("Cname");
        String Atime=request.getParameter("Atime");
        String Aplace=request.getParameter("Aplace");
        String Acontent=request.getParameter("Acontent");
        String Anum=request.getParameter("Anum");
        String flag=request.getParameter("flag");
        if("true".equals(flag)){
            String sql="insert activity(Aname,Cname,Atime,Aplace,Acontent,Anum) values('"+Aname+"','"+Cname+"','"+Atime+"','"+Aplace+"','"+Acontent+"','"+Anum+"');";
            int k=new Dao.Apply.applyMessage().insertApply(sql);
            sql="delete from activity_create where ASno='"+Asno+"'";
            k=new Dao.Apply.applyMessage().insertApply(sql);
            //sql2="update club set Cperson=Cperson+1 where Cname='"+studentApply.getCname()+"'";
            // k=new Dao.Apply.applyMessage().insertApply(sql2);
        }else{
            String sql="delete from activity_create where ASno='"+Asno+"'";
            int j=new Dao.Apply.applyMessage().insertApply(sql);
        }
        response.sendRedirect(request.getContextPath()+"/manager/Mright_check_activity.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
