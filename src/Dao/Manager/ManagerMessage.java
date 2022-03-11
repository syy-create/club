package Dao.Manager;
import Dao.sqlConnection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * @description: 获取管理员信息
 * @author: 十月
 * @create: 2020-12-30 16:14
 **/
public class ManagerMessage {
        public ArrayList queryAllManager() {
            /**
            * @Description: 查询所有管理员信息
            *@param
            * @return: ArrayList
            * @Date: 2021/1/13
            */
            ArrayList managers = new ArrayList();
            try {
                Statement sm = new sqlConnection().getConnection().createStatement();
                ResultSet rs = sm.executeQuery("select * from manager;");
                while (rs.next()) {
                    ManagerBean manager = new ManagerBean();
                    manager.setMno(rs.getString("Mno"));
                    manager.setMname(rs.getString("Mname"));
                    manager.setMpassword(rs.getString("Mpassword"));
                    System.out.println(manager.getMno());
                    System.out.println(manager.getMpassword());
                    managers.add(manager);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return managers;
        }
}
