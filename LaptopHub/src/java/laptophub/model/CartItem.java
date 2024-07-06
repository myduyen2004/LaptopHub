/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package laptophub.model;

import laptophub.utils.MoneyUtils;

/**
 *
 * @author ADM
 */
public class CartItem {
    private Product product;
    private int quantity, price;

    public CartItem() {
    }

    public CartItem(Product product, int quantity, int price) {
        this.product = product;
        this.quantity = quantity;
        this.price = price;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
    
    public String getMoney(){
        MoneyUtils money = new MoneyUtils();
        return money.formatMoney(price);
    }
    
    public String getPricePerUnitAfterDiscount(){
        MoneyUtils money = new MoneyUtils();
        return money.formatMoney(price - product.getDiscountPrice());
    }
    public int getPriceAfter() {
        return price- - product.getDiscountPrice();
    }

    @Override
    public String toString() {
        return "CartItem{" + "product=" + product + ", quantity=" + quantity + ", price=" + price + '}';
    }
    public String getTotalMoney(){
        MoneyUtils money = new MoneyUtils();
        return money.formatMoney(quantity*(price - product.getDiscountPrice()));
    }
}
