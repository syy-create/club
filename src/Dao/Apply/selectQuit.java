package Dao.Apply;

import Dao.sqlConnection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * @description: 学生退出相关
 * @author: 十月
 * @create: 2021-01-08 10:17
 **/
public class selectQuit {
    public ArrayList queryStudent(String sql){
        /**
        * @Description: 申请退出社团学生的相关信息
        *@param sql
        * @return: ArrayList
        * @Date: 2021/1/13
        */
        ArrayList stu=new ArrayList();
        try {
            Statement sm=new sqlConnection().getConnection().createStatement();
            ResultSet rs=sm.executeQuery(sql);
            while(rs.next()){
                studentQuitBean student=new studentQuitBean();
                student.setSno(rs.getString("Sno"));
                student.setCname(rs.getString("Cname"));
                student.setQdeal(rs.getString("qdeal"));
                stu.add(student);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return stu;
    }
    public ArrayList queryActiviy(String sql){
        /**
        * @Description: 申请退出活动学生的相关信息
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
