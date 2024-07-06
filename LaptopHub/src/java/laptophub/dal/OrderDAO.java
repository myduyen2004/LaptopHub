/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package laptophub.dal;

import laptophub.utils.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author admin
 */
public class OrderDAO {
    private final DBConnection db;

    public OrderDAO() {
        db = new DBConnection();
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
    
}
