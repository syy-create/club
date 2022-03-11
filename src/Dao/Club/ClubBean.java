package Dao.Club;

/**
 * @description: 社团相关信息
 * @author: 十月
 * @create: 2020-12-29 17:21
 **/
public class ClubBean {
    private String Cno;//社团编号
    private String Cname;//社团名称
    private String Cclass;//社团类别
    private String Csdept;//社团所属学院
    private String Cteacher;//指导老师
    private String Ccomment;//社团简介
    private int Cperson;//社团人数
    public String getCno() {
        return Cno;
    }

    public String getCname() {
        return Cname;
    }

    public String getCclass() {
        return Cclass;
    }

    public String getCsdept() {
        return Csdept;
    }

    public String getCteacher() {
        return Cteacher;
    }

    public String getCcomment() {
        return Ccomment;
    }

    public int getCperson() {
        return Cperson;
    }

    public void setCno(String cno) {
        Cno = cno;
    }

    public void setCname(String cname) {
        Cname = cname;
    }

    public void setCclass(String cclass) {
        Cclass = cclass;
    }

    public void setCsdept(String csdept) {
        Csdept = csdept;
    }

    public void setCteacher(String cteacher) {
        Cteacher = cteacher;
    }

    public void setCcomment(String ccomment) {
        Ccomment = ccomment;
    }

    public void setCperson(int cperson) {
        Cperson = cperson;
    }
}
