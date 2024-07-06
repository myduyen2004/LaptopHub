/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package laptophub.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import laptophub.model.Category;
import laptophub.model.Supplier;
import laptophub.model.User;
import laptophub.utils.DBConnection;

/**
 *
 * @author admin
 */
public class SupplierDAO {
     private final DBConnection db;

    public SupplierDAO() {
        db = DBConnection.getInstance();
    }

    public List<Supplier> getAllSupplier() {
        List<Supplier> supplierList = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Supplier]";
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                
                int userId = rs.getInt(1);
                String companyName = rs.getString(2);
                String homePage = rs.getString(3);
                
                String country = rs.getNString(4);
                String logoImg = rs.getString(5);
                Supplier supplier = new Supplier(userId, companyName, homePage, country, logoImg);
                supplierList.add(supplier);

            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return supplierList;
    }
    public Supplier getSupplierByName(String supplierName){
        
        String sql = """
                     SELECT supplierId, companyName, homePage, country, imageLogo
                     FROM Supplier WHERE companyName = ?""";
        
        Supplier supplier = null;
        
        try {
            Connection con = db.openConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setNString(1, supplierName);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                int supplierId = rs.getInt(1);
                supplierName = rs.getNString(2);
                String homePage = rs.getNString(3);
                String country = rs.getNString(4);
                String image = rs.getNString(5);
                supplier = new Supplier(supplierId, homePage, homePage, country, image);
            }
        } catch (Exception ex) {
            Logger.getLogger(SupplierDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return supplier;
    }
    public static void main(String[] args) {
        SupplierDAO dao = new SupplierDAO();
        System.out.println(dao.getSupplierByName("ASUS"));
    }
}
