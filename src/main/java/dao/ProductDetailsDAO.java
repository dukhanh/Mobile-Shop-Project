package dao;

import model.Configuration;
import model.Product;
import db.DBConnect;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class ProductDetailsDAO {
    private static ProductDetailsDAO productDetailsDAO;

    public ProductDetailsDAO() {

    }

    public static ProductDetailsDAO getInstance() {
        if (productDetailsDAO == null) {
            productDetailsDAO = new ProductDetailsDAO();
        }
        return productDetailsDAO;
    }

    public Product getProductDetails(String idProduct){
        Product product = new Product();
        String sql = "SELECT *\n" +
                "from  sl_sp s JOIN san_pham sp ON s.ID_SANPHAM=sp.ID_SANPHAM join thuong_hieu th on sp.ID_THUONG_HIEU = th.ID\n" +
                "WHERE sp.ID_SANPHAM = ?";
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setInt(1, Integer.parseInt(idProduct));

            ResultSet rs = psupdate.executeQuery();
            while (rs.next()) {
                product.setId(rs.getInt("ID_SANPHAM"));
                product.setName(rs.getString("TEN_SP"));
                product.setImageUrl(rs.getString("ANH_CHINH"));
                product.setPrice(rs.getInt("GIA_SP"));
                product.setPriceSale(rs.getInt("GIA_KM"));
                product.setColor(rs.getString("MAU_SAC"));
                product.setDescription(rs.getString("MOTA_SP"));
                product.setIdBrand(rs.getInt("ID"));
                product.setBrand(rs.getString("TENTH"));
                product.setQuantity(rs.getInt("SO_LUONG"));
                product.setQuantitySale(rs.getInt("SL_DABAN"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            return null;
        }
        return product;
    }

    public List<String> getImageProduct(String idProduct){
        List<String> res = new ArrayList<>();
        String sql = "Select * \n" +
                "from hinh_anh\n" +
                "where ID_SANPHAM = ?";
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setInt(1, Integer.parseInt(idProduct));

            ResultSet rs = psupdate.executeQuery();
            while (rs.next()) {
                res.add(rs.getString("URL_ANH"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            return null;
        }
        return res;
    }

    public List<Configuration> getCauHinh(String idProduct){
        Configuration con;
        List<Configuration> res = new LinkedList<>();
        String sql = "Select * \n" +
                "from cau_hinh\n" +
                "where ID_SANPHAM = ?";
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setInt(1, Integer.parseInt(idProduct));

            ResultSet rs = psupdate.executeQuery();
            while (rs.next()) {
                con = new Configuration();
                con.setName(rs.getString("TEN_TT"));
                con.setValue(rs.getString("GIA_TRI"));
                res.add(con);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            return null;
        }
        return res;
    }

    public static void main(String[] args) {
        ProductDetailsDAO pd = new ProductDetailsDAO();
//        List<String> list = pd.getImageProduct("712616");
        Iterator<Configuration> l = pd.getCauHinh("5193379").iterator();
        while(l.hasNext()) {
            System.out.println(l.next().toString());
        }
    }
}
