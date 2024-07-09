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
import laptophub.model.Supplier;
import laptophub.utils.DBConnection;
import java.sql.SQLException;

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
    public void addSupplier(Supplier supplier) {
        String query = "INSERT INTO Supplier (companyName, homePage, country, imageLogo) VALUES (?, ?, ?, ?)";
        try (Connection con = db.openConnection(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, supplier.getCompanyName());
            ps.setString(2, supplier.getHomePage());
            ps.setString(3, supplier.getCountry());
            ps.setString(4, supplier.getImgLogo()); // Assuming getImgLogo() returns the full path to the image
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(SupplierDAO.class.getName()).log(Level.SEVERE, "Error adding supplier", e);
        } catch (Exception ex) {
            Logger.getLogger(SupplierDAO.class.getName()).log(Level.SEVERE, "Unexpected error adding supplier", ex);
        }
    }

    public void updateSupplier(Supplier supplier) {
        String sql = "UPDATE Supplier SET companyName = ?, homePage = ?, country = ?, imageLogo = ? WHERE supplierId = ?";
        try (Connection con = db.openConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, supplier.getCompanyName());
            ps.setString(2, supplier.getHomePage());
            ps.setString(3, supplier.getCountry());
            ps.setString(4, supplier.getImgLogo());
            ps.setInt(5, supplier.getSupplierId());
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(SupplierDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(SupplierDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteSupplierById(int id) {
        String sql = "DELETE FROM Supplier WHERE supplierId = ?";
        try (Connection con = db.openConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(SupplierDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(SupplierDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static void main(String[] args) {
        SupplierDAO dao = new SupplierDAO();
        System.out.println(dao.getSupplierByName("ASUS"));
    }
}
