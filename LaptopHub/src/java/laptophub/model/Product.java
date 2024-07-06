/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package laptophub.model;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import laptophub.utils.MoneyUtils;

/**
 *
 * @author admin
 */
public class Product implements Serializable{
    
    private int productId;
    private int supplierId;
    private int categoryId;
    private String productName;
    private int quantityPerUnit; //số lượng nhập vào
    private int unitPrice;
    private int unitInStock;//Số lượng còn trong kho, hiển thị lên UI
    private int quantitySold;//Số lương đã bán
    private int starRating;
    private boolean isDiscount;
    private String description;
    private Date releaseDate;
    private float discount;
    private boolean status;
    private ArrayList<ImageProduct> imageList;

    public Product() {
    }

    public Product(int productId, int supplierId, int categoryId, String productName, int quantityPerUnit, int unitPrice, int unitInStock, int quantitySold, int starRating, boolean isDiscount, String description, Date releaseDate, float discount, boolean status, ArrayList<ImageProduct> imageList) {
        this.productId = productId;
        this.supplierId = supplierId;
        this.categoryId = categoryId;
        this.productName = productName;
        this.quantityPerUnit = quantityPerUnit;
        this.unitPrice = unitPrice;
        this.unitInStock = unitInStock;
        this.quantitySold = quantitySold;
        this.starRating = starRating;
        this.isDiscount = isDiscount;
        this.description = description;
        this.releaseDate = releaseDate;
        this.discount = discount;
        this.status = status;
        this.imageList = imageList;
    }

    
    
    public Product(int productId, int supplierId, int categoryId, String productName, int quantityPerUnit, int unitPrice, int unitInStock, int quantitySold, int starRating, String isDiscount, String description, String releaseDate, float discount, String status, ArrayList<ImageProduct> imageList) {
        this.productId = productId;
        this.supplierId = supplierId;
        this.categoryId = categoryId;
        this.productName = productName;
        this.quantityPerUnit = quantityPerUnit;
        this.unitPrice = unitPrice;
        this.unitInStock = unitInStock;
        this.quantitySold = quantitySold;
        this.starRating = starRating;
        setIsDiscount(isDiscount);
        this.description = description;
        setReleaseDate(releaseDate);
        this.discount = discount;
        setStatus(status);
        this.imageList = imageList;
    }

    public Product(int supplierId, int categoryId, String productName, int quantityPerUnit, int unitPrice, boolean isDiscount, String description, Date releaseDate, float discount, boolean status) {
        this.supplierId = supplierId;
        this.categoryId = categoryId;
        this.productName = productName;
        this.quantityPerUnit = quantityPerUnit;
        this.unitPrice = unitPrice;
        this.isDiscount = isDiscount;
        this.description = description;
        this.releaseDate = releaseDate;
        this.discount = discount;
        this.status = status;
    }

    public Product(int productId, int supplierId, int categoryId, String productName, int quantityPerUnit, int unitPrice, boolean isDiscount, String description, Date releaseDate, float discount, boolean status) {
        this.productId = productId;
        this.supplierId = supplierId;
        this.categoryId = categoryId;
        this.productName = productName;
        this.quantityPerUnit = quantityPerUnit;
        this.unitPrice = unitPrice;
        this.isDiscount = isDiscount;
        this.description = description;
        this.releaseDate = releaseDate;
        this.discount = discount;
        this.status = status;
    }
    

    public Product(int productId, int supplierId, int categoryId, String productName, int quantityPerUnit, int unitPrice, int unitInStock, int quantitySold, int starRating, boolean isDiscount, String description, Date releaseDate, float discount, boolean status) {
        this.productId = productId;
        this.supplierId = supplierId;
        this.categoryId = categoryId;
        this.productName = productName;
        this.quantityPerUnit = quantityPerUnit;
        this.unitPrice = unitPrice;
        this.unitInStock = unitInStock;
        this.quantitySold = quantitySold;
        this.starRating = starRating;
        this.isDiscount = isDiscount;
        this.description = description;
        this.releaseDate = releaseDate;
        this.discount = discount;
        this.status = status;
    }
    
    
    public String getPricePerUnit(){
        MoneyUtils money = new MoneyUtils();
        return money.formatMoney(unitPrice);
    }
    public String getPricePerUnitAfterDiscount(){
        
        MoneyUtils money = new MoneyUtils();
        return money.formatMoney(unitPrice - this.getDiscountPrice());
    }
    
    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getSupplierId() {
        return supplierId;
    }
    public String getSupplierString() {
        String supplier = "";
        switch(categoryId){
            case 1:supplier = "DELL";
            break;
            case 2:supplier = "ASUS";
            break;
            case 3:supplier = "APPLE";
            break;
            case 4:supplier = "ACER";
            break;
            case 5:supplier = "LENOVO";
            break;
            case 6:supplier = "HP";
            break;
            case 7:supplier = "SAMSUNG";
            break;
            
        }
        return supplier;
    }
    public void setSupplierId(int supplierId) {
        this.supplierId = supplierId;
    }

    public int getCategoryId() {
        return categoryId;
    }
    public String getCategoryString() {
        String category = "";
        switch(categoryId){
            case 1:category = "Máy tính xách tay";
            break;
            case 2:category = "Máy tính bảng";
            break;
            case 3:category = "Máy tính để bàn - CPU";
            break;
            case 4:category = "Màn hình rời";
            break;
            
        }
        return category;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getQuantityPerUnit() {
        return quantityPerUnit;
    }

    public void setQuantityPerUnit(int quantityPerUnit) {
        this.quantityPerUnit = quantityPerUnit;
    }

    public int getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(int unitPrice) {
        this.unitPrice = unitPrice;
    }

    public int getUnitInStock() {
        return unitInStock;
    }

    public void setUnitInStock(int unitInStock) {
        this.unitInStock = unitInStock;
    }

    public int getQuantitySold() {
        return quantitySold;
    }

    public void setQuantitySold(int quantitySold) {
        this.quantitySold = quantitySold;
    }

    public int getStarRating() {
        return starRating;
    }

    public void setStarRating(int starRating) {
        this.starRating = starRating;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }
    
    public String getIsDiscount() {
        return isDiscount?"Có":"Không";
    }
    public boolean getIsDiscountBoolean() {
        return isDiscount;
    }
    
    public void setIsDiscount(String isDiscount) {
        this.isDiscount = isDiscount.equalsIgnoreCase("Có");
    }
    
    public int getDiscountPrice(){
        return (int) (this.unitPrice*this.discount);
    }

    public String getIsStatus() {
        return status?"Đang bán":"Ngừng Kinh Doanh";
    }
    public boolean getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status.equalsIgnoreCase("Đang Kinh Doanh");
    }

    public String getReleaseDate() {
        SimpleDateFormat sd = new SimpleDateFormat("dd/MM/yyyy");
        return sd.format(releaseDate);
    }
    public Date getReleaseDateForm() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        SimpleDateFormat sd = new SimpleDateFormat("dd/MM/yyyy");
        try {
            this.releaseDate = new Date(sd.parse(releaseDate).getTime());
        } catch (ParseException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<ImageProduct> getImageList(){
        return imageList;
    }

    public void setImageList(ArrayList<ImageProduct> imageList) {
        this.imageList = imageList;
    }

    @Override
    public String toString() {
        return "Product\n" + "productId=" + productId + "\n, supplierId=" + supplierId + "\n, categoryId=" + categoryId + "\n, productName=" + productName + "\n, quantityPerUnit=" + quantityPerUnit + "\n, unitPrice=" + unitPrice+ "\n, unitInStock=" + unitInStock + "\n, quantitySold=" + quantitySold + "\n, starRating=" + starRating + "\n, isDiscount=" + isDiscount + "\n, description=" + description + "\n, releaseDate=" + releaseDate + "\n, discount=" + discount + "\n, status=" + status + "\n, imageList=" + imageList + '}';
    }

    
    
}
