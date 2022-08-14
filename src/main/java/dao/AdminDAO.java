package dao;

import db.DBConnect;
import model.Address;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

    public long sameSql(String sql){
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
        return totalIncomeTemp() + totalFeeShip();
    }

    public long countOrder(){
        String sql = "SELECT COUNT(ID_DH) FROM DON_HANG";
        return sameSql(sql);
    }

    public long soldProduct(){
        String sql = "SELECT SUM(SL_DABAN) FROM SL_SP";
        return sameSql(sql);
    }

    public long  restProduct(){
        String sql = "SELECT SUM(SO_LUONG) FROM SL_SP";
        return sameSql(sql);
    }


    public static void main(String[] args) {
        System.out.println(AdminDAO.getInstance().soldProduct());
    }

}
