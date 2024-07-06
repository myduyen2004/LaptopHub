/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package laptophub.model;

import java.io.Serializable;

/**
 *
 * @author ADM
 */
public class ImageProduct implements Serializable{
    private int imageId;
    private int productId;
    private String imageUrl;
    private String description;

    public ImageProduct() {
    }

    public ImageProduct(int imageId, int productId, String imageUrl, String description) {
        this.imageId = imageId;
        this.productId = productId;
        this.imageUrl = imageUrl;
        this.description = description;
    }

    public ImageProduct(int productId, String imageUrl, String description) {
        this.productId = productId;
        this.imageUrl = imageUrl;
        this.description = description;
    }
    public int getImageId() {
        return imageId;
    }

    public void setImageId(int imageId) {
        this.imageId = imageId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "imageId=" + imageId + "\n, productId=" + productId + "\n, imageUrl=" + imageUrl + "\n, description=" + description + '}';
    }
    
    
}
