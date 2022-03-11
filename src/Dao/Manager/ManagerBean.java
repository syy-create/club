package Dao.Manager;

/**
 * @description: 管理员表
 * @author: 十月
 * @create: 2020-12-30 16:14
 **/
public class ManagerBean {
    private String Mno;
    private String Mname;
    private String Mpassword;

    public String getMno() {
        return Mno;
    }

    public String getMname() {
        return Mname;
    }

    public String getMpassword() {
        return Mpassword;
    }

    public void setMno(String mno) {
        Mno = mno;
    }

    public void setMname(String mname) {
        Mname = mname;
    }

    public void setMpassword(String mpassword) {
        Mpassword = mpassword;
    }
}
