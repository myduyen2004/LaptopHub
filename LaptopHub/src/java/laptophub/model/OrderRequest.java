/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package laptophub.model;

import java.util.List;
import laptophub.utils.MoneyUtils;

/**
 *
 * @author admin
 */
public class OrderRequest {
    private List<Product> products;
    private Order order;

    public OrderRequest() {
    }
    
    public OrderRequest(List<Product> products, Order order) {
        this.products = products;
        this.order = order;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }
    
    public static class Product {
        private String name;
        private double weight;
        private int quantity;
        private int productId;
        private int unitPrice;
        private int discount;

        public Product() {
        }
        
        // Getters và Setters

        public Product(String name, int quantity, int productId, int unitPrice, int discount) {
            this.name = name;
            this.quantity = quantity;
            this.productId = productId;
            this.unitPrice = unitPrice;
            this.discount = discount;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public double getWeight() {
            return weight;
        }

        public void setWeight(double weight) {
            this.weight = weight;
        }

        public int getQuantity() {
            return quantity;
        }

        public void setQuantity(int quantity) {
            this.quantity = quantity;
        }

        public int getProductId() {
            return productId;
        }

        public void setProductId(int productId) {
            this.productId = productId;
        }

        public int getUnitPrice() {
            return unitPrice;
        }
        public String getPricePerUnit(){
        MoneyUtils money = new MoneyUtils();
        return money.formatMoney(unitPrice);
        }
        public void setUnitPrice(int unitPrice) {
            this.unitPrice = unitPrice;
        }

        public int getDiscount() {
            return discount;
        }

        public void setDiscount(int discount) {
            this.discount = discount;
        }
        
    }
    public static class Order {
        private String note;
        private String deliver_option;
        private String address;
        private String hamlet;
        private String pick_ward;
        private String ward;
        private String transport;
        private String pick_tel;
        private String pick_option;
        private String pick_name;
        private String is_freeship;
        private int pick_money;
        private String pick_province;
        private String province;
        private String district;
        private String pick_address;
        private String name;
        private String pick_date;
        private String tel;
        private String id;
        private String pick_district;
        private int value;
        private int pick_session;
        private String booking_id;
        private List<Integer> tags;

        // Getters và Setters
        public String getNote() {
            return note;
        }

        public void setNote(String note) {
            this.note = note;
        }

        public String getDeliver_option() {
            return deliver_option;
        }

        public void setDeliver_option(String deliver_option) {
            this.deliver_option = deliver_option;
        }

        public String getAddress() {
            return address;
        }

        public void setAddress(String address) {
            this.address = address;
        }

        public String getHamlet() {
            return hamlet;
        }

        public void setHamlet(String hamlet) {
            this.hamlet = hamlet;
        }

        public String getPick_ward() {
            return pick_ward;
        }

        public void setPick_ward(String pick_ward) {
            this.pick_ward = pick_ward;
        }

        public String getWard() {
            return ward;
        }

        public void setWard(String ward) {
            this.ward = ward;
        }

        public String getTransport() {
            return transport;
        }

        public void setTransport(String transport) {
            this.transport = transport;
        }

        public String getPick_tel() {
            return pick_tel;
        }

        public void setPick_tel(String pick_tel) {
            this.pick_tel = pick_tel;
        }

        public String getPick_option() {
            return pick_option;
        }

        public void setPick_option(String pick_option) {
            this.pick_option = pick_option;
        }

        public String getPick_name() {
            return pick_name;
        }

        public void setPick_name(String pick_name) {
            this.pick_name = pick_name;
        }

        public String getIs_freeship() {
            return is_freeship;
        }

        public void setIs_freeship(String is_freeship) {
            this.is_freeship = is_freeship;
        }

        public int getPick_money() {
            return pick_money;
        }
        
        public void setPick_money(int pick_money) {
            this.pick_money = pick_money;
        }

        public String getPick_province() {
            return pick_province;
        }

        public void setPick_province(String pick_province) {
            this.pick_province = pick_province;
        }

        public String getProvince() {
            return province;
        }

        public void setProvince(String province) {
            this.province = province;
        }

        public String getDistrict() {
            return district;
        }

        public void setDistrict(String district) {
            this.district = district;
        }

        public String getPick_address() {
            return pick_address;
        }

        public void setPick_address(String pick_address) {
            this.pick_address = pick_address;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getPick_date() {
            return pick_date;
        }

        public void setPick_date(String pick_date) {
            this.pick_date = pick_date;
        }

        public String getTel() {
            return tel;
        }

        public void setTel(String tel) {
            this.tel = tel;
        }

        public String getId() {
            return id;
        }

        public void setId(String id) {
            this.id = id;
        }

        public String getPick_district() {
            return pick_district;
        }

        public void setPick_district(String pick_district) {
            this.pick_district = pick_district;
        }

        public int getValue() {
            return value;
        }

        public void setValue(int value) {
            this.value = value;
        }

        public int getPick_session() {
            return pick_session;
        }

        public void setPick_session(int pick_session) {
            this.pick_session = pick_session;
        }

        public String getBooking_id() {
            return booking_id;
        }

        public void setBooking_id(String booking_id) {
            this.booking_id = booking_id;
        }

        public List<Integer> getTags() {
            return tags;
        }

        public void setTags(List<Integer> tags) {
            this.tags = tags;
        }
    }
    
}
