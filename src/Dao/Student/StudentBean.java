package Dao.Student;

/**
 * @description: 学生信息获取
 * @author: 十月
 * @create: 2020-12-30 11:29
 **/
public class StudentBean {
    private String sno;
    private String sname;
    private String sdept;
    private String spassword;
    private String Smajor;
    private String Sgrade;
    private String Sqq;
    private String Sphone;
    private String Ssign;
    private String Ssex;


    public String getSno() {
        return sno;
    }

    public String getSname() {
        return sname;
    }

    public String getSdept() {
        return sdept;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public void setSdept(String sdept) {
        this.sdept = sdept;
    }
    public String getSpassword() {
        return spassword;
    }

    public void setSpassword(String spassword) {
        this.spassword = spassword;
    }

    public String getSmajor() {
        return Smajor;
    }

    public String getSgrade() {
        return Sgrade;
    }

    public String getSqq() {
        return Sqq;
    }

    public String getSphone() {
        return Sphone;
    }

    public String getSsign() {
        return Ssign;
    }

    public String getSsex() {
        return Ssex;
    }

    public void setSmajor(String smajor) {
        Smajor = smajor;
    }

    public void setSgrade(String sgrade) {
        Sgrade = sgrade;
    }

    public void setSqq(String sqq) {
        Sqq = sqq;
    }

    public void setSphone(String sphone) {
        Sphone = sphone;
    }

    public void setSsign(String ssign) {
        Ssign = ssign;
    }

    public void setSsex(String ssex) {
        Ssex = ssex;
    }
}
