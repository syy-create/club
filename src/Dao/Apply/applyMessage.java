package Dao.Apply;

import Dao.Activity.activtyBean;
import Dao.Club.ClubBean;
import Dao.sqlConnection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * @description: 描述申请信息
 * @author: 十月
 * @create: 2020-12-31 11:21
 **/
public class applyMessage {
    public int insertApply(String sql){
        /**
        * @Description: 插入、删除语句
        *@param sql 
        * @return: int 
        * @Date: 2021/1/13
        */
        try {
            Statement sm=new sqlConnection().getConnection().createStatement();
            int i=sm.executeUpdate(sql);
            return i;
        }catch (SQLException e){
            e.printStackTrace();
        }
       return 0;
    }
    public ArrayList queryApplyClub(String sql){
        /**
        * @Description: 查询申请创办的社团
        *@param sql 
        * @return: ArrayList 
        * @Date: 2021/1/13
        */
        ArrayList applyClubs=new ArrayList();
        try {
            Statement sm=new sqlConnection().getConnection().createStatement();
            ResultSet rs=sm.executeQuery(sql);
            while(rs.next()){
                applyBean applyclub=new applyBean();
                applyclub.setAsno(rs.getString("Asno"));
                applyclub.setAcname(rs.getString("Acname"));
                applyclub.setAcclass(rs.getString("Acclass"));
                applyclub.setAcsdept(rs.getString("Acsdept"));
                applyclub.setActeacher(rs.getString("Acteacher"));
                applyclub.setAccomment(rs.getString("Accomment"));
                applyclub.setAcreason(rs.getString("Acreason"));
                applyClubs.add(applyclub);

            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return applyClubs;
    }

}
