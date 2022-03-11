package Dao.Activity;

/**
 * @description: 活动表
 * @author: 十月
 * @create: 2021-01-05 16:52
 **/
public class activtyBean {
    private String Asno;
    private String Aname;
    private String Cname;
    private String Atime;
    private String Aplace;
    private String Acontent;
    private int Anum;

    public void setAname(String aname) {
        Aname = aname;
    }

    public void setCname(String cname) {
        Cname = cname;
    }

    public void setAtime(String atime) {
        Atime = atime;
    }

    public void setAplace(String aplace) {
        Aplace = aplace;
    }

    public void setAcontent(String acontent) {
        Acontent = acontent;
    }

    public void setAnum(int anum) {
        Anum = anum;
    }

    public void setAsno(String asno) {
        Asno = asno;
    }

    public String getAname() {
        return Aname;
    }

    public String getCname() {
        return Cname;
    }

    public String getAtime() {
        return Atime;
    }

    public String getAplace() {
        return Aplace;
    }

    public String getAcontent() {
        return Acontent;
    }

    public int getAnum() {
        return Anum;
    }

    public String getAsno() {
        return Asno;
    }
}
