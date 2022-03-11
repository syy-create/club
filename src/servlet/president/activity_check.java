package servlet.president;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "activity_check",urlPatterns = "/activity_check")
public class activity_check extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /**
         * @Description: 社长处理申请加入活动的学生
         *@param request 浏览器申请信息
         *@param response 服务器返回信息
         * @return: void
         * @Date: 2021/1/13
         */
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String Asno=request.getParameter("Asno");
        String Aname=request.getParameter("Aname");
        String flag=request.getParameter("flag");
        //out.print(Asno+Aname+flag);
        if("true".equals(flag)){
            String sql="insert a_s(Aname,Sno) values('"+Aname+"','"+Asno+"')";
            int k=new Dao.Apply.applyMessage().insertApply(sql);
            sql="delete from aapply where Sno='"+Asno+"'";
            k=new Dao.Apply.applyMessage().insertApply(sql);
            //sql2="update club set Cperson=Cperson+1 where Cname='"+studentApply.getCname()+"'";
            // k=new Dao.Apply.applyMessage().insertApply(sql2);
        }else{
            String sql="delete from aapply where Sno='"+Asno+"'";
            int j=new Dao.Apply.applyMessage().insertApply(sql);
        }
        response.sendRedirect(request.getContextPath()+"/president/Pright_activity_check.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
