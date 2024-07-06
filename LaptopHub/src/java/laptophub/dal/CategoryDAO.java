/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package laptophub.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import laptophub.model.Category;
import laptophub.utils.DBConnection;

/**
 *
 * @author admin
 */
public class CategoryDAO {
    private final DBConnection db;

    public CategoryDAO() {
        db = new DBConnection();
    }
    
    public ArrayList<Category> getCategory(){
        ArrayList<Category> categoryList = new ArrayList<>();
        String sql = "SELECT [categoryId] ,[categoryName] ,[description] ,[imageCat]" +
                     " FROM [Category]";
        
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Connection con = db.openConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while(rs.next()){
                int categoryId = rs.getInt("categoryId");
                String categoryName = rs.getNString("categoryName");
                String description = rs.getNString("description");
                String imageCat = rs.getNString("imageCat");
                
                Category c = new Category(categoryId, categoryName, description, imageCat);
                categoryList.add(c);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return categoryList;
    }
    
    public Category getCategoryByName(String categoryName){
        
        String sql = """
                     SELECT categoryId, categoryName, description, imageCat
                     From Category Where description = ?""";
        
        Category category = null;
        
        try {
            Connection con = db.openConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setNString(1, categoryName);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                int categoryId = rs.getInt(1);
                categoryName = rs.getNString(2);
                String description = rs.getNString(3);
                String imageCat = rs.getNString(4);
                
                category = new Category(categoryId, categoryName, description, imageCat);
                
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return category;
    }
    
    public static void main(String[] args) {
        CategoryDAO dao = new CategoryDAO();
        System.out.println(dao.getCategoryByName("Máy tính bảng"));
    }
}
