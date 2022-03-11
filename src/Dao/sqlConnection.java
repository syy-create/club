package Dao;

import java.sql.*;

/**
 * @description: 数据库连接
 * @author: 十月
 * @create: 2020-12-29 16:15
 **/
public class sqlConnection {
    public  Connection getConnection() {
        String driver = "com.mysql.cj.jdbc.Driver";//使用Jar包驱动
        String url = "jdbc:mysql://localhost/dao?serverTimezone=UTC";//链接数据库端口，数据库名
        String username = "root";//数据库用户名
        String password = "root";//数据库密码
        Connection conn = null;
        try {
            Class.forName(driver); //classLoader,加载对应驱动
            conn = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException e) {//异常捕获
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
    public  ResultSet execute(String sql) {
        try{
            Statement stmt=getConnection().createStatement();
            ResultSet rs=stmt.executeQuery(sql);
            return rs;
        }catch (SQLException e){
           e.printStackTrace();
        }
        return null;
    }
    public  int update(String sql) {
        try{
            Statement stmt=getConnection().createStatement();
            int count=stmt.executeUpdate(sql);
            return count;
        }catch (SQLException e){
            e.printStackTrace();
        }
        return 0;
    }
}
