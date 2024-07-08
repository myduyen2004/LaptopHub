/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package laptophub.dal;

import laptophub.utils.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import laptophub.model.Order;
import laptophub.model.User;
import laptophub.model.Wallet;
import laptophub.utils.DateTimeUtils;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import laptophub.model.CartItem;
import laptophub.model.OrderRequest;
import laptophub.model.Product;

/**
 *
 * @author admin
 */
public class OrderDAO {

    private final DBConnection db;

    public OrderDAO() {
        db = new DBConnection();
    }

    public List<Order> getAllOrder() {
        DBConnection db = DBConnection.getInstance();
        String sql = "SELECT * FROM [dbo].[Order]";
        List<Order> list = new ArrayList<>();
        UserDAO dao = new UserDAO();
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int orderId = Integer.parseInt(rs.getString(1));
                String userName = rs.getNString(2);
                User user = dao.getUser(userName);
                int totalMoney = Integer.parseInt(rs.getString(3));
                boolean status = rs.getBoolean(4);
                String payment = rs.getString(5);
                Date date = rs.getDate(6);
                String time = rs.getString(7);
                String address = rs.getString(8);
                String ward = rs.getString(9);
                String province = rs.getString(10);
                String district = rs.getString(11);
                String phone = rs.getString(12);
                Order o = new Order(orderId, user, totalMoney, status, payment, date, time, address, ward, province, district, phone);
                list.add(o);
            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getTotalRevenue() {
        DBConnection db = DBConnection.getInstance();
        String sql = "SELECT SUM(totalMoney) FROM [dbo].[Order]";
        int totalRevenue = 0;
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                totalRevenue = Integer.parseInt(rs.getString(1));
            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totalRevenue;
    }

    public int getMonthlyRevenue(String month) {
        DBConnection db = DBConnection.getInstance();
        String sql = "SELECT SUM(totalMoney) FROM [dbo].[Order] WHERE MONTH(date) = ? GROUP BY MONTH(date)";
        int monthlyRevenue = 0;
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, month);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                monthlyRevenue = Integer.parseInt(rs.getString(1));
            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return monthlyRevenue;
    }

    public int getTodayRevenue() {
        DBConnection db = DBConnection.getInstance();
        String sql = "SELECT SUM(totalMoney) AS total_revenue FROM [dbo].[Order] WHERE CAST(date AS DATE) = CAST(GETDATE() AS DATE)";
        int todayRevenue = 0;
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                todayRevenue = Integer.parseInt(rs.getString(1));
            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return todayRevenue;
    }

    public void addSubtractTrans(Wallet wallet, int amount, String time) {
        String sql = "INSERT INTO [dbo].[Transaction](walletId, amount, createdDate, status, time) VALUES" + "(?,?,?,?,?)";
        DBConnection db = DBConnection.getInstance();
        DateTimeUtils utils = new DateTimeUtils();
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, wallet.getWalletId());
            statement.setInt(2, amount);
            statement.setDate(3, new java.sql.Date(utils.converseDateNow(utils.getDateNow()).getTime()));
            statement.setBoolean(4, true);
            statement.setString(5, time);
            statement.execute();
            statement.close();
            con.close();

        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addPlusTrans(Wallet wallet, int amount, String time) {
        String sql = "INSERT INTO [dbo].[Transaction](walletId, amount, createdDate, status, time) VALUES" + "(?,?,?,?,?)";
        DBConnection db = DBConnection.getInstance();
        DateTimeUtils utils = new DateTimeUtils();
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, wallet.getWalletId());
            statement.setInt(2, amount);
            statement.setDate(3, new java.sql.Date(utils.converseDateNow(utils.getDateNow()).getTime()));

            statement.setBoolean(4, false);
            statement.setString(5, time);
            statement.execute();
            statement.close();
            con.close();

        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addOrder(User user, int total, Date date, String time, String typePayment, String address, String ward, String province, String district, String phone) {
        String sql = "INSERT INTO [dbo].[Order](date, userName, totalMoney, status, payment, time, address, ward, province, district, phone) VALUES "
                + "(?,?,?,?,?,?,?,?,?,?,?);";
        DBConnection db = DBConnection.getInstance();
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setObject(1, new java.sql.Date(date.getTime()));
            statement.setNString(2, user.getUserName());
            statement.setInt(3, total);
            statement.setBoolean(4, false);
            if (typePayment.equals("WALLET")) {
                statement.setNString(5, "Thanh toán online");
            } else if (typePayment.equals("COD")) {
                statement.setNString(5, "Thanh toán khi nhận hàng ");
            }
            statement.setString(6, time);
            statement.setString(7, address);
            statement.setString(8, ward);
            statement.setString(9, province);
            statement.setString(10, district);
            statement.setString(11, phone);
            statement.execute();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Order getOrder(User user, Date date, String time) {
        String sql = "SELECT * FROM [dbo].[Order] WHERE date=? AND time=? AND userName=?";
        DBConnection db = DBConnection.getInstance();
        Order o = new Order();
        UserDAO dao = new UserDAO();
        System.out.println(sql);
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            System.out.println(time);
            System.out.println(new java.sql.Date(date.getTime()));
            statement.setDate(1, new java.sql.Date(date.getTime()));
            statement.setString(2, time);
            statement.setNString(3, user.getUserName());
            ResultSet rs = statement.executeQuery();
            System.out.println(statement);
            if (rs.next()) {
                int orderId = Integer.parseInt(rs.getString(1));
                String userName = rs.getNString(2);
                int totalMoney = Integer.parseInt(rs.getString(3));
                boolean status = rs.getBoolean(4);
                String payment = rs.getString(5);
                System.out.println(orderId + userName + totalMoney + status + payment);
                user = dao.getUser(userName);
                String address = rs.getString(8);
                String ward = rs.getString(9);
                String province = rs.getString(10);
                String district = rs.getString(11);
                String phone = rs.getString(12);
                o = new Order(orderId, user, totalMoney, status, payment, date, time, address, ward, province, district, phone);

                System.out.println(o.getOrderId());
                System.out.println(o.getDate());
            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);

        }
        return o;
    }

    public void addOrderDetail(User user, CartItem item, Date date, String time) throws SQLException {
        String sql = "INSERT INTO [dbo].[OrderDetails] (orderId, productId, quantity, unitPrice, discount) VALUES" + "(?, ?, ?, ?, ?)";
        DBConnection db = DBConnection.getInstance();
        OrderDAO dao = new OrderDAO();
        UserDAO userDao = new UserDAO();
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, dao.getOrder(userDao.getUser(user.getUserName()), date, time).getOrderId());
            statement.setInt(2, item.getProduct().getProductId());
            statement.setInt(3, item.getQuantity());
            statement.setInt(4, item.getPriceAfter());
            statement.setFloat(5, item.getProduct().getDiscountPrice());
            statement.execute();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

//    public void addOrderDetail(ArrayList<CartItem> list, User user){
//        String sql = "SELECT orderId FROM [dbo].[Order] WHERE userName =? AND date = 0";
//        String sql2 = "INSERT INTO [dbo].[OrderDetails] (orderId, productId, quantity, unitPrice, discount) VALUES" +"(?, ?, ?, ?, ?);";
//        DBConnection db = DBConnection.getInstance();
//                
//        try{
//            Connection con = db.openConnection();
//            PreparedStatement statement = con.prepareStatement(sql2)
//        }
//    }
//    public void addTransactionNoWallet(Wallet wallet, int amount){
//        String sql = "INSERT INTO [dbo].[Transaction](walletId, amount, createdDate, transactionType, status) VALUES" +"(?,?,?,?,?)";
//        DBConnection db = DBConnection.getInstance();
//        DateTimeUtils utils = new DateTimeUtils();
//        try{
//            Connection con = db.openConnection();
//            PreparedStatement statement = con.prepareStatement(sql);
//            statement.setInt(1, wallet.getWalletId());
//            statement.setInt(2, amount);
//            statement.setDate(3, new java.sql.Date(utils.converseDateNow(utils.getDateNow()).getTime()));
//            statement.setNString(4, "Thanh toán online");
//            statement.setBoolean(5, true);
//            statement.execute();
//            statement.close();
//            con.close();
//            
//        }catch(Exception ex){
//            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
//    public static Time time;
    public String getTransactionId(Wallet wallet, Date date, boolean status, String time) {
        String sql = "SELECT transactionId FROM [dbo].[Transaction] WHERE walletId=? AND createDate=? AND time=? AND status = ?";
        DBConnection db = DBConnection.getInstance();
        String transactionId = null;
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, wallet.getWalletId());
            statement.setDate(2, new java.sql.Date(date.getTime()));
            statement.setString(3, time);
            statement.setBoolean(4, status);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                transactionId = rs.getString(1);
            }
            rs.close();
            statement.close();
            con.close();

        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return transactionId;
    }

    public Order getOrderById(int id) {
        String sql = "SELECT * FROM [dbo].[Order] WHERE orderId = ?";
        DBConnection db = DBConnection.getInstance();
        UserDAO dao = new UserDAO();
        Order o = null;
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            System.out.println(statement);
            if (rs.next()) {
                int orderId = Integer.parseInt(rs.getString(1));
                String userName = rs.getNString(2);
                int totalMoney = Integer.parseInt(rs.getString(3));
                boolean status = rs.getBoolean(4);
                String payment = rs.getString(5);
                System.out.println(orderId + userName + totalMoney + status + payment);
                User user = dao.getUser(userName);
                Date date = rs.getDate(6);
                String time = rs.getString(7);
                String address = rs.getString(8);
                String ward = rs.getString(9);
                String province = rs.getString(10);
                String district = rs.getString(11);
                String phone = rs.getString(12);
                o = new Order(orderId, user, totalMoney, status, payment, date, time, address, ward, province, district, phone);

            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return o;
    }

//    public List<OrderRequest.Product> getOrderDetail(int orderId){
//        List<OrderRequest.Product> list = new ArrayList<>();
//        String sql = "SELECT * FROM [dbo].[OrderDetails] WHERE orderId = ?";
//        DBConnection db = DBConnection.getInstance();
//        ProductDAO dao = new ProductDAO();
//        try{
//            Connection con = db.openConnection();
//            PreparedStatement statement = con.prepareStatement(sql);
//            statement.setInt(1, orderId);
//            System.out.println(statement);
//            ResultSet rs = statement.executeQuery();
//            while(rs.next()){
//                System.out.println(rs.next());
//                int productId = Integer.parseInt(rs.getString(2));
//                String productName = dao.getProduct(productId).getProductName();
//                int quantity = Integer.parseInt(rs.getString(3));
//                int unitPrice = Integer.parseInt(rs.getString(4));
//                int discount = Integer.parseInt(rs.getString(5));
//                OrderRequest.Product p = new OrderRequest.Product(productName, quantity, productId, unitPrice, discount);
//                list.add(p);
//                System.out.println(p);
//                System.out.println(rs.getString(2));
//            }
//            System.out.println(rs.next());
//            System.out.println(rs.getString(1));
//        }catch(Exception ex){
//            System.out.println(ex.getMessage());
////            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return list;
//    }
    public List<OrderRequest.Product> getOrderDetail(int orderId) {
        List<OrderRequest.Product> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[OrderDetails] WHERE orderId = ?";
        DBConnection db = DBConnection.getInstance();
        ProductDAO dao = new ProductDAO();
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, orderId);
            System.out.println(statement);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int productId = rs.getInt("productId");
                String productName = dao.getProductById(productId).getProductName();
                int quantity = rs.getInt("quantity");
                int unitPrice = rs.getInt("unitPrice");
                int discount = rs.getInt("discount");
                OrderRequest.Product p = new OrderRequest.Product(productName, quantity, productId, unitPrice, discount);
                list.add(p);
                System.out.println(p);
                System.out.println(rs.getString("productId"));
            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            // Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void deleteOrderDetails(int orderId) {
        DBConnection db = DBConnection.getInstance();
        String sql = "DELETE FROM [dbo].[OrderDetails] WHERE orderId=?";
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, orderId);
            statement.execute();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteOrder(int orderId) {
        DBConnection db = DBConnection.getInstance();
        String sql = "DELETE FROM [dbo].[Order] WHERE orderId=?";
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, orderId);
            statement.execute();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void confirmOrderStatus(int orderId) {
        DBConnection db = DBConnection.getInstance();
        String sql = "UPDATE [dbo].[Order] SET status = 1 WHERE orderId=?";
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, orderId);
            statement.execute();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


    public static void main(String[] args) throws ParseException {
        User user = new User("anhh", "password123");
        OrderDAO dao = new OrderDAO();
        DateTimeUtils u = new DateTimeUtils();
        Date date = u.converseDateNow(u.getDateNow());
        String time = u.getTime();
//        System.out.println(dao.getOrderById(2082));
//        dao.deleteOrderDetails(2081);
        dao.confirmOrderStatus(2084);
    }

}
