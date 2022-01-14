package dao;

import bean.Brand;
import bean.Category;
import db.DBConnect;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class BrandDAO {
    private static BrandDAO brandDao;

    public BrandDAO() {

    }

    public static  BrandDAO getInstance() {
        if (brandDao == null) {
            brandDao = new BrandDAO();
        }
        return brandDao;
    }

    public List<Brand> getTopBrand(){
        Brand brand;
        List<Brand> res = new LinkedList<>();
        String query = "SELECT ID_THUONG_HIEU,TENTH,  count(ID_SANPHAM) as c \n" +
                "FROM san_pham sp join thuong_hieu th on sp.ID_THUONG_HIEU=th.ID\n" +
                "GROUP BY ID_THUONG_HIEU\n" +
                "ORDER BY c DESC";
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(query);

            ResultSet rs = psupdate.executeQuery();
            while (rs.next()) {
                brand = new Brand();
                brand.setId(rs.getInt("ID_THUONG_HIEU"));
                brand.setName(rs.getString("TENTH"));
                res.add(brand);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            return null;
        }
        return res;
    }

}
