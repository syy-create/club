package Dao.Student;
import Dao.sqlConnection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * @description: 学生相关信息
 * @author: 十月
 * @create: 2020-12-30 13:41
 **/
public class studentMessage {
    public ArrayList queryAllStudent(){
        /**
        * @Description: 查询所有学生相关信息
        *@param
        * @return: ArrayList
        * @Date: 2021/1/13
        */
        ArrayList students=new ArrayList();
        try {
            Statement sm=new sqlConnection().getConnection().createStatement();
            ResultSet rs=sm.executeQuery("select * from student,studentpassword where student.Sno=studentpassword.Sno;");
            while(rs.next()){
                StudentBean student=new StudentBean();
                student.setSno(rs.getString("Sno"));
                student.setSname(rs.getString("Sname"));
                student.setSdept(rs.getString("Sdept"));
                student.setSpassword(rs.getString("Spassword"));
                students.add(student);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return students;
    }
    public ArrayList queryStudent(String sql){
        /**
        * @Description: 查询特定学生相关信息
        *@param sql sql语句
        * @return: ArrayList
        * @Date: 2021/1/13
        */
        ArrayList stu=new ArrayList();
        try {
            Statement sm=new sqlConnection().getConnection().createStatement();
            ResultSet rs=sm.executeQuery(sql);
            while(rs.next()){
                StudentBean student=new StudentBean();
                student.setSno(rs.getString("Sno"));
                student.setSname(rs.getString("Sname"));
                student.setSdept(rs.getString("Sdept"));
                student.setSmajor(rs.getString("Smajor"));
                student.setSgrade(rs.getString("Sgrade"));
                student.setSqq(rs.getString("Sqq"));
                student.setSphone(rs.getString("Sphone"));
                student.setSsign(rs.getString("Ssign"));
                student.setSsex(rs.getString("Ssex"));
                stu.add(student);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return stu;
    }
    public ArrayList queryAllPresident(){
        /**
        * @Description: 查询所有社长相关信息
        *@param
        * @return: ArrayList
        * @Date: 2021/1/13
        */
        ArrayList students=new ArrayList();
        try {
            Statement sm=new sqlConnection().getConnection().createStatement();
            ResultSet rs=sm.executeQuery("select distinct(cs.Sno),Spassword from cs,studentpassword where cs.Sno=studentpassword.Sno;");
            while(rs.next()){
                StudentBean student=new StudentBean();
                student.setSno(rs.getString("Sno"));
                student.setSpassword(rs.getString("Spassword"));
                students.add(student);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return students;
    }
    public boolean exitPresident(String sql){
        /**
        * @Description: 判断社长是否存在
        *@param sql
        * @return: boolean
        * @Date: 2021/1/13
        */
        ArrayList students=new ArrayList();
        try {
            Statement sm=new sqlConnection().getConnection().createStatement();
            ResultSet rs=sm.executeQuery(sql);
            while(rs.next()){
                StudentBean student=new StudentBean();
                students.add(student);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return students.size()>0;
    }
    public ArrayList queryPresident(String sql){
        /**
        * @Description: 查询指定社长及其社团名称
        *@param sql
        * @return: ArrayList
        * @Date: 2021/1/13
        */
        ArrayList stu=new ArrayList();
        try {
            Statement sm=new sqlConnection().getConnection().createStatement();
            ResultSet rs=sm.executeQuery(sql);
            while(rs.next()){
                presidentBean student=new presidentBean();
                student.setSno(rs.getString("Sno"));
                student.setCname(rs.getString("Cname"));
                stu.add(student);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return stu;
    }
    public  int execuUpdate(String sql) {
        /**
        * @Description: 进行更新语句
        *@param sql
        * @return: int
        * @Date: 2021/1/13
        */
        try{
            Statement sm=new sqlConnection().getConnection().createStatement();
            int count=sm.executeUpdate(sql);
            return count;
        }catch (SQLException e){
            e.printStackTrace();
        }
        return 0;
    }
}
