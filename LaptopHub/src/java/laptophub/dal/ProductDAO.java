/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package laptophub.dal;

import java.util.ArrayList;
import laptophub.model.Product;
import laptophub.utils.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import laptophub.model.ImageProduct;
import laptophub.utils.DateTimeUtils;

/**
 *
 * @author admin
 */
public class ProductDAO {

    private final DBConnection db;

    public ProductDAO() {
        db = new DBConnection();
    }

    public ArrayList<Product> getAllProduct() {
        ArrayList<Product> productList = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Product]";

        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt(1);
                int supplierId = rs.getInt(2);
                int categoryId = rs.getInt(3);
                String productName = rs.getNString(4);
                int quantityPerUnit = rs.getInt(5);
                int unitPrice = rs.getInt(6);
                int unitInStock = rs.getInt(7);
                int quantitySold = rs.getInt(8);
                int starRating = rs.getInt(9);
                boolean isDiscount = rs.getBoolean(10);
                String description = rs.getNString(11);
                Date releaseDate = rs.getDate(12);
                float discount = rs.getFloat(13);
                boolean status = rs.getBoolean(14);
                ArrayList<ImageProduct> imageList = getImageProduct(productId);

                Product p = new Product(productId, supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, quantitySold, starRating, isDiscount, description, releaseDate, discount, status, imageList);
                productList.add(p);
            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return productList;
    }

    public ArrayList<Product> getTop10NewProduct() {

        ArrayList<Product> prdList = new ArrayList<>();
        String sql = "SELECT TOP (10) [productId],[supplierId],[categoryId],[productName],[quantityPerUnit],[unitPrice],[unitInStock], "
                + "[quantitySold],[starRating],[isDiscount],[description],[releaseDate],[discount],[status] "
                + " FROM [Product] ORDER BY releaseDate DESC";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Connection con = db.openConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {

                int productId = rs.getInt("productId");
                int supplierId = rs.getInt("supplierId");
                int categoryId = rs.getInt("categoryId");
                String productName = rs.getNString("productName");
                int quantityPerUnit = rs.getInt("quantityPerUnit");
                int unitPrice = rs.getInt("unitPrice");
                int unitInStock = rs.getInt("unitInStock");
                int quantitySold = rs.getInt("quantitySold");
                int starRating = rs.getInt("starRating");
                boolean isDiscount = rs.getBoolean("isDiscount");
                String description = rs.getNString("description");
                Date releaseDate = rs.getDate("releaseDate");
                float discount = rs.getFloat("discount");
                boolean status = rs.getBoolean("status");
                ArrayList<ImageProduct> imageList = getImageProduct(productId);

                Product p = new Product(productId, supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, quantitySold, starRating, isDiscount, description, releaseDate, discount, status, imageList);
                prdList.add(p);
            }
            rs.close();
            ps.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return prdList;
    }

    public Product getProductById(int id) {
        Product p = null;

        String sql = "SELECT [productId],[supplierId],[categoryId],[productName],[quantityPerUnit],[unitPrice],[unitInStock], "
                + "[quantitySold],[starRating],[isDiscount],[description],[releaseDate],[discount],[status] "
                + " FROM [Product] "
                + " WHERE productId = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Connection con = db.openConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("productId");
                int supplierId = rs.getInt("supplierId");
                int categoryId = rs.getInt("categoryId");
                String productName = rs.getNString("productName");
                int quantityPerUnit = rs.getInt("quantityPerUnit");
                int unitPrice = rs.getInt("unitPrice");
                int unitInStock = rs.getInt("unitInStock");
                int quantitySold = rs.getInt("quantitySold");
                int starRating = rs.getInt("starRating");
                boolean isDiscount = rs.getBoolean("isDiscount");
                String description = rs.getNString("description");
                Date releaseDate = rs.getDate("releaseDate");
                float discount = rs.getFloat("discount");
                boolean status = rs.getBoolean("status");
                ArrayList<ImageProduct> imageList = getImageProduct(productId);
                p = new Product(productId, supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, quantitySold, starRating, isDiscount, description, releaseDate, discount, status, imageList);
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return p;
    }

    public ArrayList<ImageProduct> getImageProduct(int prdId) {
        ArrayList<ImageProduct> imgList = new ArrayList<>();
        String sql = "SELECT [imageId], [productId] ,[imageUrl] ,[description] "
                + "  FROM [ImageProduct] "
                + "  WHERE productId = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Connection con = db.openConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, prdId);
            rs = ps.executeQuery();

            while (rs.next()) {
                int imageId = rs.getInt("imageId");
                int productId = rs.getInt("productId");
                String imageUrl = rs.getNString("imageUrl");
                String description = rs.getNString("description");

                ImageProduct img = new ImageProduct(imageId, productId, imageUrl, description);
                imgList.add(img);
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return imgList;
    }

    public int getNumOfProduct() {
        DBConnection db = DBConnection.getInstance();
        String sql = "SELECT COUNT(*) FROM [dbo].[Product]";
        int numOfProduct = 0;
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                numOfProduct = Integer.parseInt(rs.getString(1));

            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return numOfProduct;
    }

    public int getTotalSold() {
        DBConnection db = DBConnection.getInstance();
        String sql = "SELECT SUM(quantitySold) FROM [dbo].[Product]";
        int totalSold = 0;
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                totalSold = Integer.parseInt(rs.getString(1));

            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totalSold;
    }

    public void addProduct(Product product) {
        String sql = "INSERT INTO Product(supplierId, categoryId, productName, quantityPerUnit, unitPrice, isDiscount, description, releaseDate, discount, status)"
                + " VALUES (?,?,?,?,?,?,?,?,?,?)";

        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, product.getSupplierId());
            statement.setInt(2, product.getCategoryId());
            statement.setNString(3, product.getProductName());
            statement.setInt(4, product.getQuantityPerUnit());
            statement.setInt(5, product.getUnitPrice());
            statement.setBoolean(6, product.getIsDiscountBoolean());
            statement.setNString(7, product.getDescription());
            statement.setDate(8, new java.sql.Date(product.getReleaseDateForm().getTime()));
            statement.setFloat(9, product.getDiscount());
            statement.setBoolean(10, product.getStatus());
            statement.execute();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insertImageProduct(ImageProduct imageProduct) {
        String sql = "INSERT INTO ImageProduct(productId, imageUrl, description)"
                + " VALUES (?,?,?)";
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);

            statement.setInt(1, imageProduct.getProductId());
            statement.setNString(2, imageProduct.getImageUrl());
            statement.setNString(3, imageProduct.getDescription());
            statement.execute();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteImageProduct(int productId) {
        String sql = "DELETE FROM [dbo].[ImageProduct] WHERE productId = ?";
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);

            statement.setInt(1, productId);
            statement.execute();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateProduct(Product product) {
        DateTimeUtils utils = new DateTimeUtils();
        String sql = """
                UPDATE Product SET supplierId = ?,categoryId =?,productName = ?,quantityPerUnit=?,unitPrice=?,isDiscount = ?,description=?, releaseDate = ?,discount=?, status = ?
                 WHERE productId = ?""";
        try (Connection con = db.openConnection()) {
            PreparedStatement statement = con.prepareStatement(sql);

            statement.setInt(1, product.getSupplierId());
            statement.setInt(2, product.getCategoryId());
            statement.setNString(3, product.getProductName());
            statement.setInt(4, product.getQuantityPerUnit());
            statement.setInt(5, product.getUnitPrice());
            statement.setBoolean(6, product.getIsDiscountBoolean());
            statement.setNString(7, product.getDescription());
            statement.setDate(8, new java.sql.Date(product.getReleaseDateForm().getTime()));
            statement.setFloat(9, product.getDiscount());
            statement.setBoolean(10, product.getStatus());
            statement.setInt(11, product.getProductId());
            statement.execute();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getMaxId() {
        int id = 0;
        String sql = "SELECT MAX(productId) FROM Product";
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                id = Integer.parseInt(rs.getString(1));
            }
            rs.close();
            statement.close();
            con.close();

        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);

        }
        return id;
    }

    public Product getProduct(int id) {
        String sql = "SELECT * FROM Product WHERE productId=?";
        Product p = null;
        try (Connection con = db.openConnection()) {
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            
            if (rs.next()) {
                int productId = rs.getInt("productId");
                int supplierId = rs.getInt("supplierId");
                int categoryId = rs.getInt("categoryId");
                String productName = rs.getNString("productName");
                int quantityPerUnit = rs.getInt("quantityPerUnit");
                int unitPrice = rs.getInt("unitPrice");
                int unitInStock = rs.getInt("unitInStock");
                int quantitySold = rs.getInt("quantitySold");
                int starRating = rs.getInt("starRating");
                boolean isDiscount = rs.getBoolean("isDiscount");
                String description = rs.getNString("description");
                Date releaseDate = rs.getDate("releaseDate");
                float discount = rs.getFloat("discount");
                boolean status = rs.getBoolean("status");
                p = new Product(productId, supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock,
                        quantitySold, starRating, isDiscount, description, releaseDate, discount, status);
            }
            rs.close();
            statement.close();

        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);

        }
        return p;
    }

    public void deleteProduct(int productId) {
        String sql = "DELETE FROM Product WHERE productId=?";
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, productId);
            statement.execute();
            con.close();
            statement.close();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Product> getLaptopProducts() {
        ArrayList<Product> laptopList = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE categoryId = 1"; // Assuming categoryId 1 represents laptops
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {

                int productId = rs.getInt(1);
                int supplierId = rs.getInt(2);
                int categoryId = rs.getInt(3);
                String productName = rs.getNString(4);
                int quantityPerUnit = rs.getInt(5);
                int unitPrice = rs.getInt(6);
                int unitInStock = rs.getInt(7);
                int quantitySold = rs.getInt(8);
                int starRating = rs.getInt(9);
                boolean isDiscount = rs.getBoolean(10);
                String description = rs.getNString(11);
                Date releaseDate = rs.getDate(12);
                float discount = rs.getFloat(13);
                boolean status = rs.getBoolean(14);
                ArrayList<ImageProduct> imageList = getImageProduct(productId);

                Product p = new Product(productId, supplierId, categoryId, productName, quantityPerUnit, unitPrice,
                        unitInStock, quantitySold, starRating, isDiscount, description, releaseDate, discount, status,
                        imageList);
                laptopList.add(p);
            }

            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return laptopList;
    }

    public ArrayList<Product> getProductsByCriteria(String columnName, Object value) {
        ArrayList<Product> productList = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE " + columnName + " = ?";

        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setObject(1, value);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt(1);
                int supplierId = rs.getInt(2);
                int categoryId = rs.getInt(3);
                String productName = rs.getNString(4);
                int quantityPerUnit = rs.getInt(5);
                int unitPrice = rs.getInt(6);
                int unitInStock = rs.getInt(7);
                int quantitySold = rs.getInt(8);
                int starRating = rs.getInt(9);
                boolean isDiscount = rs.getBoolean(10);
                String description = rs.getNString(11);
                Date releaseDate = rs.getDate(12);
                float discount = rs.getFloat(13);
                boolean status = rs.getBoolean(14);
                ArrayList<ImageProduct> imageList = getImageProduct(productId);

                Product p = new Product(productId, supplierId, categoryId, productName, quantityPerUnit, unitPrice,
                        unitInStock, quantitySold, starRating, isDiscount, description, releaseDate, discount, status,
                        imageList);
                productList.add(p);
            }

            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return productList;
    }

    public static void main(String[] args) throws ParseException {
        ProductDAO p = new ProductDAO();
        System.out.println(p.getProductById(2));
    }
}
