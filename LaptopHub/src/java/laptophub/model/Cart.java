/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package laptophub.model;

import java.util.ArrayList;
import laptophub.utils.MoneyUtils;

/**
 *
 * @author admin
 */
public class Cart {
    private ArrayList<CartItem> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public ArrayList<CartItem> getItems() {
        return items;
    }
    
    public int getQuantityItemById(int id){
        return getItemById(id).getQuantity();
    }
    
    public CartItem getItemById(int id){
        for(CartItem i : items){
            if(i.getProduct().getProductId() == id){
                return i;
            }
        }
        return null;
    }
    
    public void addItem(CartItem t){
        if(getItemById(t.getProduct().getProductId())!=null){
            CartItem m = getItemById(t.getProduct().getProductId());
            m.setQuantity(m.getQuantity()+t.getQuantity());
        }else{
            items.add(t);
        }
    }
    
    public void removeItem(int id){
        if(getItemById(id)!=null){
            items.remove(getItemById(id));
        }
    }
    
    public String getTotalMoney(){
        MoneyUtils money = new MoneyUtils();
        int m = 0;
        for(CartItem i : items){
            m+=((i.getPrice()-i.getProduct().getDiscountPrice())*i.getQuantity());
        }
        return money.formatMoney(m);
    }
    
    public int getTotalPrice(){
        int m = 0;
        for(CartItem i : items){
            m+=((i.getPrice()-i.getProduct().getDiscountPrice())*i.getQuantity());
        }
        return m;
    }
    
    private Product getProductById(int id, ArrayList<Product> list){
        for(Product i : list){
            if(i.getProductId() == id){
                return i;
            }
        }
        return null;
    }
    
    public Cart(String txt, ArrayList<Product> list){
        items = new ArrayList<>();
        try{
            if(txt!=null && txt.length()!=0){
                String[] s = txt.split("/");
                for(String i : s){
                    String[] n = i.split(":");
                    int id = Integer.parseInt(n[0]);
                    int quantity = Integer.parseInt(n[1]);
                    Product p = getProductById(id, list);
                    CartItem t = new CartItem(p, quantity, p.getUnitPrice());
                    addItem(t);
                }
            } 
        }catch (NumberFormatException e){
                
        }
    }

    @Override
    public String toString() {
        return "Cart{" + "items=" + items + '}';
    }
}
