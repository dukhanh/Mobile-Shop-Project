package dao;

import db.DBConnect;
import mode_utility.Encrypt;
import model.Account;
import model.Assess;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class AssessDAO {
    private static AssessDAO instance;

    private AssessDAO() {
    }

    public static AssessDAO getInstance() {
        if (instance == null) {
            instance = new AssessDAO();
        }
        return instance;
    }

    public boolean insertAssess(Assess assess) {
        String sql = "insert into DANH_GIA_SP(ID_SP, ID_USER,MUC_DANHGIA,NOIDUNG_DG,NGAY_DG) values(?, ?, ?, ?, now())";
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setInt(1, assess.getIdProduct());
            psupdate.setInt(2, assess.getIdUser());
            psupdate.setInt(3, assess.getRate());
            psupdate.setString(4, assess.getReview());
            psupdate.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException ignored) {

        }
        return false;
    }

    public List<Assess> getListAssess(int idProduct) {
        List<Assess> list = new LinkedList<>();
        String sql = "select * from DANH_GIA_SP d join TAI_KHOAN t on d.ID_USER=t.ID_USER where ID_SP = ?";
        try {
            PreparedStatement ps = DBConnect.connect().getConnection().prepareStatement(sql);
            ps.setInt(1, idProduct);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Assess assess = new Assess();
                assess.setIdProduct(rs.getInt("ID_SP"));
                assess.setIdUser(rs.getInt("ID_USER"));
                assess.setNameAssess(rs.getString("TEN_ND"));
                assess.setRate(rs.getInt("MUC_DANHGIA"));
                assess.setReview(rs.getString("NOIDUNG_DG"));
                assess.setCreatedAt(rs.getString("NGAY_DG"));
                list.add(assess);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return list;
    }

    public double getRateProduct(int idProduct) {
        double rate = 0;
        String sql = "select avg(MUC_DANHGIA) as rate from DANH_GIA_SP where ID_SP = ?";
        try {
            PreparedStatement ps = DBConnect.connect().getConnection().prepareStatement(sql);
            ps.setInt(1, idProduct);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                rate = rs.getDouble("rate");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return rate;
    }

    // count number of review
    public int getNumberReview(int idProduct) {
        int number = 0;
        String sql = "select count(*) as number from DANH_GIA_SP where ID_SP = ?";
        try {
            PreparedStatement ps = DBConnect.connect().getConnection().prepareStatement(sql);
            ps.setInt(1, idProduct);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                number = rs.getInt("number");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return number;
    }

    public static void main(String[] args) {
        AssessDAO assessDAO = AssessDAO.getInstance();
        System.out.println(assessDAO.getNumberReview(123547404));

    }
}
