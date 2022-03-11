package Dao.Apply;

/**
 * @description: 申请加入社团的表
 * @author: 十月
 * @create: 2021-01-04 09:43
 **/
public class studentApplyBean {
    private String Sno;
    private String Cname;
    private String Sdeal;

    public String getSno() {
        return Sno;
    }

    public String getCname() {
        return Cname;
    }

    public String getSdeal() {
        return Sdeal;
    }

    public void setSno(String sno) {
        Sno = sno;
    }

    public void setCname(String cname) {
        Cname = cname;
    }

    public void setSdeal(String sdeal) {
        Sdeal = sdeal;
    }
}
