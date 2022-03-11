package Dao.Apply;

/**
 * @description: 学生退出社团
 * @author: 十月
 * @create: 2021-01-08 10:15
 **/
public class studentQuitBean {
    private String Sno;
    private String Cname;
    private String qdeal;

    public String getSno() {
        return Sno;
    }

    public String getCname() {
        return Cname;
    }

    public String getQdeal() {
        return qdeal;
    }

    public void setSno(String sno) {
        Sno = sno;
    }

    public void setCname(String cname) {
        Cname = cname;
    }

    public void setQdeal(String qdeal) {
        this.qdeal = qdeal;
    }
}
