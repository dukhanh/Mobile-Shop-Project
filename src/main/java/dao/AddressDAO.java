package dao;

import db.DBConnect;
import model.Address;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AddressDAO {
    private static AddressDAO addressDAO;

    // constructor null
    private AddressDAO() {
    }

    public static AddressDAO getInstance() {
        if (addressDAO == null) {
            addressDAO = new AddressDAO();
        }
        return addressDAO;
    }

    // get address by userId from DIA CHI table
    public Address getAddressByUserId(int userId) {
        String sql = "SELECT * FROM DIA_CHI WHERE ID_USER=?";
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setInt(1, userId);
            ResultSet rs = psupdate.executeQuery();
            while (rs.next()) {
                Address address = new Address();
                address.setUserId(rs.getInt("ID_USER"));
                address.setFullName(rs.getString("HO_TEN"));
                address.setPhone(rs.getString("SDT"));
                address.setProvince(rs.getString("TINH"));
                address.setDistrict(rs.getString("HUYEN"));
                address.setWard(rs.getString("XA"));
                address.setDetail(rs.getString("CHI_TIET"));
                address.setTypeAddress(rs.getString("LOAI_DC"));
                return address;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            return null;
        }
        return null;

    }

    // update DIA CHI table by userId
    public boolean updateAddressByUserId(Address address) {
        String sql = "UPDATE DIA_CHI SET HO_TEN=?,SDT=?,TINH=?,HUYEN=?,XA=?,CHI_TIET=?,LOAI_DC=? WHERE ID_USER=?";
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setString(1, address.getFullName());
            psupdate.setString(2, address.getPhone());
            psupdate.setString(3, address.getProvince());
            psupdate.setString(4, address.getDistrict());
            psupdate.setString(5, address.getWard());
            psupdate.setString(6, address.getDetail());
            psupdate.setString(7, address.getTypeAddress());
            psupdate.setInt(8, address.getUserId());
            if (psupdate.executeUpdate() > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            return false;
        }
        return false;
    }

}
