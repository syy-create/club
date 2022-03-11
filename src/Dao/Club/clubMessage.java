package Dao.Club;

import Dao.sqlConnection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * @description: 查看社团相关信息
 * @author: 十月
 * @create: 2020-12-29 16:22
 **/
public class clubMessage {
    public ArrayList queryAllClub(){
        /**
        * @Description: 查询所有社团相关信息
        *@param
        * @return: ArrayList
        * @Date: 2021/1/13
        */
        ArrayList clubs=new ArrayList();
        try {
            Statement sm=new sqlConnection().getConnection().createStatement();
            ResultSet rs=sm.executeQuery("select * from club;");
            while(rs.next()){
                ClubBean club =new ClubBean();
                club.setCname(rs.getString("Cname"));
                club.setCclass(rs.getString("Cclass"));
                club.setCsdept(rs.getString("Csdept"));
                club.setCteacher(rs.getString("Cteacher"));
                club.setCcomment(rs.getString("Ccomment"));
                club.setCperson(rs.getInt("Cperson"));
                clubs.add(club);
            }
            rs.close();
        }catch (SQLException e){
            e.printStackTrace();
        }
        return clubs;
    }

    public ArrayList querryClub(String sql){
        /**
        * @Description: 查询指定社团相关信息
        *@param sql
        * @return: ArrayList
        * @Date: 2021/1/13
        */
        ArrayList clubs=new ArrayList();
        try {
            Statement sm=new sqlConnection().getConnection().createStatement();
            ResultSet rs=sm.executeQuery(sql);
            while(rs.next()){
                ClubBean club =new ClubBean();
                club.setCname(rs.getString("Cname"));
                club.setCclass(rs.getString("Cclass"));
                club.setCsdept(rs.getString("Csdept"));
                club.setCteacher(rs.getString("Cteacher"));
                club.setCcomment(rs.getString("Ccomment"));
                club.setCperson(rs.getInt("Cperson"));
                clubs.add(club);
            }
            rs.close();
        }catch (SQLException e){
            e.printStackTrace();
        }
        return clubs;
    }
}
