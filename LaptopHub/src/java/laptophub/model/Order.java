/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package laptophub.model;

import java.time.LocalDateTime;
import java.util.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import laptophub.utils.MoneyUtils;


/**
 *
 * @author admin
 */
public class Order {
    private int orderId;
    private User userName;
    private int totalMoney;
    private boolean status;
    private String payment;
    private Date date;
    private String time;
    private String address; 
    private String ward; 
    private String province;
    private String district;
    private String phone;
    public Order() {
    }

    public Order(int orderId, User userName, int totalMoney, boolean status, String payment, Date date, String time, String address, String ward, String province, String district, String phone) {
        this.orderId = orderId;
        this.userName = userName;
        this.totalMoney = totalMoney;
        this.status = status;
        this.payment = payment;
        this.date = date;
        this.time = time;
        this.address = address;
        this.ward = ward;
        this.province = province;
        this.district = district;
        this.phone = phone;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public User getUserName() {
        return userName;
    }

    public void setUserName(User userName) {
        this.userName = userName;
    }

    public int getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(int totalMoney) {
        this.totalMoney = totalMoney;
    }
    public String getTotalMoneyString(){
        MoneyUtils m = new MoneyUtils();
        return m.formatMoney(totalMoney);
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    public String getStatusString(){
        return status? "Đã xác nhận" : "Chưa xác nhận";
    }
    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public Date getDate() {
        return date;
    }
    public String getDateString(){
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDate = formatter.format(date);
        return formattedDate;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "Order{" + "orderId=" + orderId + ", userName=" + userName + ", totalMoney=" + totalMoney + ", status=" + status + ", payment=" + payment + ", date=" + date + ", time=" + time + ", address=" + address + ", ward=" + ward + ", province=" + province + ", district=" + district + ", phone=" + phone + '}';
    }

}
