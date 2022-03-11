package Dao.Apply;

import Dao.Student.StudentBean;
import Dao.sqlConnection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * @description: 查询已申请学生信息
 * @author: 十月
 * @create: 2021-01-04 20:47
 **/
public class selectSApply {
    /**
    * @Description: 申请加入社团学生的相关信息
    *@param sql
    * @return: null 
    * @Date: 2021/1/13
    */
    public ArrayList queryStudent(String sql){
        ArrayList stu=new ArrayList();
        try {
            Statement sm=new sqlConnection().getConnection().createStatement();
            ResultSet rs=sm.executeQuery(sql);
            while(rs.next()){
                studentApplyBean student=new studentApplyBean();
                student.setSno(rs.getString("Sno"));
                student.setCname(rs.getString("Cname"));
                student.setSdeal(rs.getString("Sdeal"));
                stu.add(student);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return stu;
    }
    public ArrayList queryActiviy(String sql){
        /**
        * @Description: 申请加入活动学生相关信息
        *@param sql 
        * @return: ArrayList 
        * @Date: 2021/1/13
        */
        ArrayList act=new ArrayList();
        try {
            Statement sm=new sqlConnection().getConnection().createStatement();
            ResultSet rs=sm.executeQuery(sql);
            while(rs.next()){
                studentActivityBean activity=new studentActivityBean();
                activity.setAname(rs.getString("Aname"));
                activity.setSno(rs.getString("Sno"));
                activity.setCname(rs.getString("Cname"));
                act.add(activity);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return act;
    }
}
