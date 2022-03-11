package servlet.student.apply;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "applySelect",urlPatterns = "/applySelect")
public class applySelect extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /**
         * @Description: 学生申请创建社团
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
        String Cname=request.getParameter("Cname");
        String Cclass=request.getParameter("Cclass");
        String Csdept=request.getParameter("Csdept");
        String Cteacher=request.getParameter("Cteacher");
        String Ccomment=request.getParameter("Ccomment");
        String Creason=request.getParameter("Creason");
        String sql="insert apply(Ano,Asno,Acname,Acclass,Acsdept,Acteacher,Accomment,Acreason) " +
                "values('"+Cname.hashCode()+"','"+Asno+"','"+Cname+"','"+Cclass+"','"
                +Csdept+"','"+Cteacher+"','"+Ccomment+"','"+Creason+"');";
        int i=new Dao.Apply.applyMessage().insertApply(sql);
        response.sendRedirect(request.getContextPath()+ "/student/apply/applyjoin.html");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
