package dao;

import db.DBConnect;
import model.Bill;
import model.BillDetail;
import model.Feedback;
import service.BillService;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class BillDAO {
    private static BillDAO instance;

    public BillDAO() {
    }

    public static BillDAO getInstance() {
        if (instance == null) {
            instance = new BillDAO();
        }
        return instance;
    }

    // save bill to don hang table
    public void saveBill(Bill bill) {
        String sql = "INSERT INTO DON_HANG (ID_DH,ID_USER,PHI_VC,DIA_CHI_GH,TRANG_THAI,CREATE_DATE) VALUES(?,?,?,?,?,now())";
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setString(1, bill.getIdBill());
            psupdate.setInt(2, bill.getIdUser());
            psupdate.setInt(3, bill.getShipFee());
            psupdate.setString(4, bill.getAddress());
            psupdate.setInt(5, BillService.statusBillCode(bill.getStatus()));
            psupdate.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // save bill detail to chi tiet don hang table
    public void saveBillDetail(BillDetail billDetail) {
        String sql = "INSERT INTO CHITIET_DH (ID_DH,ID_SP,SL_SP,GIA_SP) VALUES(?,?,?,?)";
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setString(1, billDetail.getIdBill());
            psupdate.setInt(2, billDetail.getIdProduct());
            psupdate.setInt(3, billDetail.getQuantity());
            psupdate.setInt(4, billDetail.getPriceBill());
            psupdate.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // update trang thai don hang
    public boolean updateStatusBill(String billId, int status) {
        String sql = "UPDATE DON_HANG SET TRANG_THAI = ? WHERE ID_DH = ?";
        try {
            PreparedStatement psupdate = DBConnect.connect().getConnection().prepareStatement(sql);
            psupdate.setInt(1, status);
            psupdate.setString(2, billId);
            psupdate.executeUpdate();
            return true;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    // get last id bill
    public String getLastIdBill() {
        String sql = "SELECT ID_DH FROM DON_HANG";
        try {
            PreparedStatement ps = DBConnect.connect().getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                if (rs.isLast()) {
                    return rs.getString("ID_DH");
                }
            }


        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    // get bill by user id
    public List<Bill> getBillsByUserId(int idUser) {
        String sql = "SELECT * FROM DON_HANG WHERE ID_USER = ?";
        List<Bill> list = new LinkedList<>();
        try {
            PreparedStatement ps = DBConnect.connect().getConnection().prepareStatement(sql);
            ps.setInt(1, idUser);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Bill bill = new Bill();
                bill.setIdBill(rs.getString("ID_DH"));
                bill.setIdUser(rs.getInt("ID_USER"));
                bill.setShipFee(rs.getInt("PHI_VC"));
                bill.setStatus(BillService.statusBill(rs.getInt("TRANG_THAI")));
                bill.setCreatedAt(rs.getString("CREATE_DATE"));
                list.add(bill);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return list;
    }


    // get bill by id
    public Bill getBillById(String id) {
        String sql = "SELECT * FROM DON_HANG WHERE ID_DH = ?";
        Bill bill = new Bill();
        try {
            PreparedStatement ps = DBConnect.connect().getConnection().prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                bill.setIdBill(rs.getString("ID_DH"));
                bill.setIdUser(rs.getInt("ID_USER"));
                bill.setShipFee(rs.getInt("PHI_VC"));
                bill.setAddress(rs.getString("DIA_CHI_GH"));
                bill.setStatus(BillService.statusBill(rs.getInt("TRANG_THAI")));
                bill.setCreatedAt(rs.getString("CREATE_DATE"));
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return bill;
    }

    public List<BillDetail> getProductBillById(String id) {
        String sql = "SELECT * FROM CHITIET_DH ct JOIN SAN_PHAM sp ON ct.ID_SP = sp.ID_SANPHAM WHERE ID_DH = ?";
        List<BillDetail> billList = new LinkedList<>();
        try {
            PreparedStatement ps = DBConnect.connect().getConnection().prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BillDetail bill = new BillDetail();
                bill.setIdBill(rs.getString("ID_DH"));
                bill.setIdProduct(rs.getInt("ID_SP"));
                bill.setProductName(rs.getString("TEN_SP"));
                bill.setImageProduct(rs.getString("ANH_CHINH"));
                bill.setColorProduct(rs.getString("MAU_SAC"));
                bill.setQuantity(rs.getInt("SL_SP"));
                bill.setPriceBill(rs.getInt("GIA_SP"));
                billList.add(bill);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return billList;
    }

    public int totalBill(String id) {
        String sql = "SELECT SUM(GIA_SP*SL_SP) FROM CHITIET_DH WHERE ID_DH = ?";
        try {
            PreparedStatement ps = DBConnect.connect().getConnection().prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // show on admin view, need to update
    public List<Bill> showAllBill() {

        String sql = "select ID_DH, ID_USER, CREATE_DATE from DON_HANG";
        Bill b;
        List<Bill> bill = new ArrayList<Bill>();
        ResultSet rs;
        PreparedStatement statement;
        try {
            statement = DBConnect.connect().getConnection().prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                b = new Bill(rs.getString("ID_DH"), rs.getInt("ID_USER"), rs.getString("CREATE_DATE"));
                bill.add(b);
            }

            return bill;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    // show on admin view, need to update
    public List<Bill> showAllBillHasBeenCancel() {

        String sql = "select ID_DH, ID_USER, CREATE_DATE from don_hang WHERE TRANG_THAI = 4";
        Bill b;
        List<Bill> bill = new ArrayList<Bill>();
        ResultSet rs;
        PreparedStatement statement;
        try {
            statement = DBConnect.connect().getConnection().prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                b = new Bill(rs.getString("ID_DH"), rs.getInt("ID_USER"), rs.getString("CREATE_DATE"));
                bill.add(b);
            }

            return bill;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Bill> getAllBills() {
        String sql = "select dh.ID_DH, ID_USER, SUM(GIA_SP*SL_SP) as total, CREATE_DATE, TRANG_THAI\n" +
                "from DON_HANG dh join CHITIET_DH ch on dh.ID_DH = ch.ID_DH\n" +
                "group by dh.ID_DH\n";
        List<Bill> billList = new LinkedList<>();
        try {
            PreparedStatement ps = DBConnect.connect().getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
               Bill bill = new Bill();
               bill.setIdBill(rs.getString("ID_DH"));
               bill.setIdUser(rs.getInt("ID_USER"));
               bill.setTotal(rs.getLong("total"));
               bill.setCreatedAt(rs.getString("CREATE_DATE"));
               bill.setStatus(BillService.statusBill(rs.getInt("TRANG_THAI")));
               billList.add(bill);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return billList;
    }

    public Map<String, String> showInforReceipt(String receiptId){
        String sql = "select * \n" +
                "from DON_HANG dh join TAI_KHOAN tk on dh.ID_USER = tk.ID_USER\n" +
                "where ID_DH = ?";
        Map<String, String> result =new LinkedHashMap<>();
        try {
            PreparedStatement ps = DBConnect.connect().getConnection().prepareStatement(sql);
            ps.setString(1, receiptId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                result.put("ID_DH", rs.getString("ID_DH"));
                result.put("TEN_ND", rs.getString("TEN_ND"));
                result.put("SDT", rs.getString("SDT"));
                result.put("DIA_CHI", rs.getString("DIA_CHI_GH"));
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return result;
    }

    // test getBillById method
    public static void main(String[] args) {
         Map<String, String> test = BillDAO.getInstance().showInforReceipt("DH001");
         System.out.println(test);
    }

}
