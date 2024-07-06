/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package laptophub.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeParseException;
import java.util.Date;

/**
 *
 * @author admin
 */
public class User {
    private String userName;
    private int userId;
    private String fullName;
    private String password;
    private int roleId;
    private String image;
    private Date birthday;
    private String address;
    private String phone;
    private boolean status;
    private String email;
    
    public User() {
    }

    public User(String userName, int userId, String fullName, String password, int roleId, String image, Date birthday, String address, String phone, boolean status, String email) {
        this.userName = userName;
        this.userId = userId;
        this.fullName = fullName;
        this.password = password;
        this.roleId = roleId;
        this.image = image;
        this.birthday = birthday;
        this.address = address;
        this.phone = phone;
        this.status = status;
        this.email = email;
    }
    
    
    public User(String userName, int userId, String fullName, String password, int roleId, String image, Date birthday, String address, String phone, boolean status) {
        this.userName = userName;
        this.userId = userId;
        this.fullName = fullName;
        this.password = password;
        this.roleId = roleId;
        this.image = image;
        this.birthday = birthday;
        this.address = address;
        this.phone = phone;
        this.status = status;
    }
    


       public User(String userName, int userId, String fullName, String password, int roleId, String image, String birthday, String address, String phone, boolean status) {
        this.userName = userName;
        this.userId = userId;
        this.fullName = fullName;
        this.password = password;
        this.roleId = roleId;
        this.image = image;
        setBirthday(birthday);
        this.address = address;
        this.phone = phone;
        this.status = status;
    }

    public User(String userName, String fullName, String password, int roleId, String image, String birthday, String address, String phone, boolean status) {
        this.userName = userName;
        this.fullName = fullName;
        this.password = password;
        this.roleId = roleId;
        this.image = image;
        setBirthday(birthday);
        this.address = address;
        this.phone = phone;
        this.status = status;
    }


       

    public User(String userName, String password) {
        this.userName = userName;
        this.password = password;
    }

public String getBirthdayString(Date birthday) {
    if (birthday == null) {
        return null;
    }
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(birthday);
}

public void setBirthdayString(String birthday) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            this.birthday = sdf.parse(birthday);
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    public void setBirthday(String birthday) {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-mm-dd");
        try {
            this.birthday=df.parse(birthday);
        } catch (ParseException e) {
            System.out.println(e.getMessage());
        }
    }
    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    

    @Override
    public String toString() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-mm-dd");
        return "User{" + "userName=" + userName + ", userId=" + userId + ", fullName=" + fullName + ", password=" + password + ", roleId=" + roleId + ", image=" + image + ", birthday=" +df.format(birthday)  + ", address=" + address + ", phone=" + phone + ", status=" + status + ", email=" + email+'}';
    }
    
    

}
