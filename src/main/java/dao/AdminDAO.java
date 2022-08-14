package dao;

import db.DBConnect;
import model.Address;
import model.Turnover;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminDAO {
    private static AdminDAO adminDAO;

    // constructor null
    private AdminDAO() {
    }

    public static AdminDAO getInstance() {
        if (adminDAO == null) {
            adminDAO = new AdminDAO();
        }
        return adminDAO;
    }

    public long sameSql(String sql) {
        long result = 0;
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            ResultSet rs = psupdate.executeQuery();
            while (rs.next()) {
                result = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            return 0;
        }
        return result;
    }

    public long totalIncomeTemp() {
        String sql = "SELECT SUM(GIA_SP*SL_SP) as total FROM  CHITIET_DH";
        return sameSql(sql);
    }

    public long totalFeeShip() {
        String sql = "SELECT SUM(PHI_VC) FROM DON_HANG ";
        return sameSql(sql);
    }

    public long totalIncome() {
        return totalIncomeTemp();
    }

    public long countOrder() {
        String sql = "SELECT COUNT(ID_DH) FROM DON_HANG";
        return sameSql(sql);
    }

    public long soldProduct() {
        String sql = "SELECT SUM(SL_DABAN) FROM SL_SP";
        return sameSql(sql);
    }

    public long restProduct() {
        String sql = "SELECT SUM(SO_LUONG) FROM SL_SP";
        return sameSql(sql);
    }


    public List<Turnover> turnoverByMonth() {
        String sql = "select MONTH(CREATE_DATE) as mth, YEAR(CREATE_DATE) as y, count(DISTINCT dh.ID_DH) as count_order,  SUM(GIA_SP*SL_SP) as total, SUM(SL_SP) as sl\n" +
                "from DON_HANG dh join CHITIET_DH cd on dh.ID_DH = cd.ID_DH\n" +
                "group by mth";
        List<Turnover> result = new ArrayList<>();
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            ResultSet rs = psupdate.executeQuery();
            while (rs.next()) {
                Turnover t = new Turnover();
                t.setMonth(rs.getInt("mth"));
                t.setYear(rs.getInt("y"));
                t.setSoldProduct(rs.getInt("sl"));
                t.setCountOrder(rs.getInt("count_order"));
                t.setTotalIncome(rs.getLong("total"));
                result.add(t);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            return null;
        }
        return result;
    }

    public static void main(String[] args) {

        ArrayList<Turnover> tests = (ArrayList<Turnover>) AdminDAO.getInstance().turnoverByMonth();
        for(Turnover t :tests){
            System.out.println(t.toString());
        }

    }

}
