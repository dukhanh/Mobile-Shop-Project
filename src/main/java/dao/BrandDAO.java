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


    public List<Brand> getBrandLogo(){
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
    public List<Brand> showAllBrand(){

        String sql = "SELECT DISTINCT TH.ID, TH.TENTH, SL.SO_LUONG FROM thuong_hieu TH JOIN san_pham SP ON TH.ID = SP.ID_THUONG_HIEU \n" +
                "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tJOIN sl_sp SL ON SP.ID_SANPHAM = SL.ID_SANPHAM";
        Brand br;
        List<Brand> brand = new ArrayList<Brand>();
        ResultSet rs;
        PreparedStatement statement;
        try {
            statement = DBConnect.connect().getConnection().prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                br = new Brand(rs.getInt("ID"),rs.getString("TENTH"), rs.getInt("SO_LUONG"));
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
