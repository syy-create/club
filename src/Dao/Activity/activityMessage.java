package Dao.Activity;
import Dao.sqlConnection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * @description: 查询活动表信息
 * @author: 十月
 * @create: 2021-01-05 17:06
 **/
public class activityMessage {
    public ArrayList queryActivity(String sql){
        /**
        * @Description: 查看指定活动相关信息
        *@param sql
        * @return: ArrayList
        * @Date: 2021/1/13
        */
        ArrayList activitys=new ArrayList();
        try {
            Statement sm=new sqlConnection().getConnection().createStatement();
            ResultSet rs=sm.executeQuery(sql);
            while(rs.next()){
                activtyBean activity=new activtyBean();
                activity.setAname(rs.getString("Aname"));
                activity.setCname(rs.getString("Cname"));
                activity.setAtime(rs.getString("Atime"));
                activity.setAplace(rs.getString("Aplace"));
                activity.setAcontent(rs.getString("Acontent"));
                activity.setAnum(rs.getInt("Anum"));
                activitys.add(activity);

            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return activitys;
    }
    public ArrayList queryApplyActivity(String sql){
        /**
        * @Description: 查看申请创建活动的信息
        *@param sql
        * @return: ArrayList
        * @Date: 2021/1/13
        */
        ArrayList activitys=new ArrayList();
        try {
            Statement sm=new sqlConnection().getConnection().createStatement();
            ResultSet rs=sm.executeQuery(sql);
            while(rs.next()){
                activtyBean activity=new activtyBean();
                activity.setAsno(rs.getString("Asno"));
                activity.setAname(rs.getString("Aname"));
                activity.setCname(rs.getString("Cname"));
                activity.setAtime(rs.getString("Atime"));
                activity.setAplace(rs.getString("Aplace"));
                activity.setAcontent(rs.getString("Acontent"));
                activity.setAnum(rs.getInt("Anum"));
                activitys.add(activity);

            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return activitys;
    }
}
