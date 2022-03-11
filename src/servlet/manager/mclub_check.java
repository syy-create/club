package servlet.manager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "mclub_check",urlPatterns = "/mclub_check")
public class mclub_check extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /**
         * @Description: 管理员处理申请的社团
         *@param request 浏览器申请信息
         *@param response 服务器返回信息
         * @return: void
         * @Date: 2021/1/13
         */
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String Asno=request.getParameter("Asno");
        String Acname=request.getParameter("Acname");
        String Acclass=request.getParameter("Acclass");
        String Acsdept=request.getParameter("Acsdept");
        String Acteacher=request.getParameter("Acteacher");
        String Accomment=request.getParameter("Accomment");
        String Acreason=request.getParameter("Acreason");
        String flag=request.getParameter("flag");
        //out.print(Asno+Acname+flag+Acclass+Accomment+Acreason);
        if("true".equals(flag)){
            String sql="insert club(Cno,Cname,Ccomment,Csdept,Cclass,Cteacher,Cperson) values('"+Asno.hashCode()+"','"+Acname+"','"+Accomment+"','"+Acsdept+"','"+Acclass+"','"+Acteacher+"','"+1+"');";
            int k=new Dao.Apply.applyMessage().insertApply(sql);
            sql="delete from apply where ASno='"+Asno+"'";
            k=new Dao.Apply.applyMessage().insertApply(sql);
            sql="insert president values('"+Asno+"','"+Acname+"')";
            k=new Dao.Apply.applyMessage().insertApply(sql);
        }else{
            String sql="delete from apply where Sno='"+Asno+"'";
            int j=new Dao.Apply.applyMessage().insertApply(sql);
        }
        response.sendRedirect(request.getContextPath()+"/manager/Mright_club_check.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
