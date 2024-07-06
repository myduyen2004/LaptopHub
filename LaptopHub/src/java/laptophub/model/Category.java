/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package laptophub.model;

import java.io.Serializable;

/**
 *
 * @author admin
 */
public class Category implements Serializable{
    private int categoryId;
    private String categoryName;
    private String description;
    private String imageCat;

    public Category() {
    }

    public Category(int categoryId, String categoryName, String description, String imageCat) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.description = description;
        this.imageCat = imageCat;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImageCat() {
        return imageCat;
    }

    public void setImageCat(String imageCat) {
        this.imageCat = imageCat;
    }

    @Override
    public String toString() {
        return "Category{" + "categoryId=" + categoryId + ", categoryName=" + categoryName + ", description=" + description + ", imageCat=" + imageCat + '}';
    }
    
    
}
