package dao;

import model.Brand;
import db.DBConnect;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class BrandDAO {
    private static BrandDAO brandDao;

    public BrandDAO() {

    }

    public static BrandDAO getInstance() {
        if (brandDao == null) {
            brandDao = new BrandDAO();
        }
        return brandDao;
    }

    public List<Brand> getTopBrand() {
        Brand brand;
        List<Brand> res = new LinkedList<>();
        String query = "SELECT ID_THUONG_HIEU,TENTH,  count(ID_SANPHAM) as c \n" +
                "FROM SAN_PHAM sp join THUONG_HIEU th on sp.ID_THUONG_HIEU=th.ID\n" +
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


    public List<Brand> getBrandLogo() {
        Brand brand;
        int quantityBrand = 8;
        List<Brand> res = new LinkedList<>();
        String query = "SELECT ID_THUONG_HIEU,TENTH, LOGO,  count(ID_SANPHAM) as c\n" +
                "                FROM SAN_PHAM sp join THUONG_HIEU th on sp.ID_THUONG_HIEU=th.ID\n" +
                "\t\t\t\t\t\t\t\tWHERE LOGO <> \"\"\n" +
                "                GROUP BY ID_THUONG_HIEU\n" +
                "                ORDER BY c DESC\n" +
                "\t\t\t\t\t\t\t\tLIMIT 0,?";
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(query);
            psupdate.setInt(1, quantityBrand);
            ResultSet rs = psupdate.executeQuery();
            while (rs.next()) {
                brand = new Brand();
                brand.setId(rs.getInt("ID_THUONG_HIEU"));
                brand.setName(rs.getString("TENTH"));
                brand.setLogo(rs.getString("LOGO"));
                res.add(brand);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            return null;
        }
        return res;
    }

    public List<Brand> showAllBrand() {

        String sql = "SELECT sp.ID_THUONG_HIEU, th.TENTH, SUM(SO_LUONG) as SL\n" +
                "FROM SAN_PHAM sp JOIN SL_SP ss on sp.ID_SANPHAM = ss.ID_SANPHAM\n" +
                "JOIN THUONG_HIEU th ON th.ID = sp.ID_THUONG_HIEU\n" +
                "GROUP BY sp.ID_THUONG_HIEU";

        List<Brand> brand = new ArrayList<Brand>();
        try {
            PreparedStatement statement = DBConnect.connect().getConnection().prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Brand br = new Brand(rs.getInt("ID_THUONG_HIEU"), rs.getString("TENTH"), rs.getInt("SL"));
                brand.add(br);
            }

            return brand;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

//    public static void main(String[] args) {
//        BrandDAO brand = new BrandDAO();
//        Iterator<Brand> list = (Iterator<Brand>) brand.getBrandLogo().iterator();
//        while (list.hasNext()) {
//            System.out.println(list.next().getName());
//        }
//    }

}
