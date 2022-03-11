package Dao.Student;

/**
 * @description: 社长表
 * @author: 十月
 * @create: 2021-01-04 15:41
 **/
public class presidentBean {
    private String Sno;
    private String Cname;

    public void setSno(String sno) {
        Sno = sno;
    }

    public void setCname(String cname) {
        Cname = cname;
    }

    public String getSno() {
        return Sno;
    }

    public String getCname() {
        return Cname;
    }
}
