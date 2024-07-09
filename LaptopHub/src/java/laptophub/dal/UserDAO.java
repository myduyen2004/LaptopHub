/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package laptophub.dal;

import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import laptophub.model.User;
import laptophub.model.Wallet;
import laptophub.utils.DBConnection;

/**
 *
 * @author admin
 */
public class UserDAO {

    private final DBConnection dbConnection;

    public UserDAO() {
        dbConnection = DBConnection.getInstance();
    }

    public List<User> getAllUSer() {
        List<User> userList = new ArrayList<>();
        DBConnection db = DBConnection.getInstance();
        String sql = "Select*from [dbo].[User]";
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                String userName = rs.getString(1);
                int userId = rs.getInt(2);
                String fullName = rs.getString(3);
                String password = rs.getString(4);
                int roleID = rs.getInt(5);
                String image = rs.getString(6);
                String birthday = rs.getString(7);
                String address = rs.getString(8);
                String phone = rs.getString(9);
                Boolean status = rs.getBoolean(10);
                String email = rs.getString("Email");
                User user = new User(userName, userId, fullName, password, roleID, image, birthday, address, phone,status,email);
                userList.add(user);

            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return userList;
    }

    public User checkLogin(User user) {
        User temp = null;
        for (User u : new UserDAO().getAllUSer()) {
            if (u.getUserName().equalsIgnoreCase(user.getUserName())
                    && u.getPassword().equals(user.getPassword()) && u.isStatus()) {
                temp = user;
                break;
            }
        }
        return temp;
    }

    public boolean checkUsernameExists(String userName) throws SQLException {
        Connection jdbcConnection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            try {
                jdbcConnection = dbConnection.openConnection();
            } catch (Exception ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }

            String sql = "SELECT COUNT(*) FROM [User] WHERE userName = ?";
            statement = jdbcConnection.prepareStatement(sql);
            statement.setString(1, userName);

            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                return resultSet.getInt(1) > 0;
            }

            return false;
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (statement != null) {
                statement.close();
            }
            if (jdbcConnection != null) {
                jdbcConnection.close();
            }
        }
    }

    public boolean insertUser(User user) throws SQLException {
        Connection jdbcConnection = null;
        PreparedStatement statement = null;

        try {
            try {
                jdbcConnection = dbConnection.openConnection();
            } catch (Exception ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }

            String sql = "INSERT INTO [User] (userName, fullName, password, roleId, image, birthday, address, phone, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            statement = jdbcConnection.prepareStatement(sql);
            statement.setString(1, user.getUserName());
            statement.setString(2, user.getFullName());
            statement.setString(3, user.getPassword());
            statement.setInt(4, user.getRoleId());
            statement.setString(5, user.getImage());
            statement.setDate(6, new java.sql.Date(user.getBirthday().getTime()));
            statement.setString(7, user.getAddress());
            statement.setString(8, user.getPhone());
            statement.setBoolean(9, user.isStatus());

            return statement.executeUpdate() > 0;
        } finally {
            if (statement != null) {
                statement.close();
            }
            if (jdbcConnection != null) {
                jdbcConnection.close();
            }
        }
    }

    //for admin statistic
    public int getNumOfCustomer() {
        DBConnection db = DBConnection.getInstance();
        String sql = "SELECT COUNT(*) FROM [dbo].[User] WHERE roleId = 1";
        int numOfCus = 0;
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                numOfCus = Integer.parseInt(rs.getString(1));

            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return numOfCus;
    }

    public List<User> getTop5Customer() {
        List<User> top5Cus = new ArrayList<>();
        DBConnection db = DBConnection.getInstance();
        String sql = """
                     SELECT TOP 5 [dbo].[User].userName, [dbo].[User].fullName, [dbo].[Wallet].balance
                                          FROM [dbo].[User]
                                          INNER JOIN [dbo].[Wallet] ON [dbo].[User].userName = [dbo].[Wallet].userName
                                          ORDER BY [dbo].[Wallet].balance DESC""";

        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                String userName = rs.getString(1);
                String fullName = rs.getNString(2);
                int balance = rs.getInt(3);
                User user = getUser(userName);
                top5Cus.add(user);
            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return top5Cus;

    }

    public User getUser(String userNameIn) {
        DBConnection db = DBConnection.getInstance();
        String sql = "SELECT * FROM [dbo].[User] WHERE userName = ?";
        User user = null;
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, userNameIn);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                String userName = rs.getString(1);
                int userId = rs.getInt(2);
                String fullName = rs.getNString(3);
                String password = rs.getString(4);
                int roleID = rs.getInt(5);
                String image = rs.getString(6);
                String birthday = rs.getString(7);
                String address = rs.getString(8);
                String phone = rs.getString(9);
                Boolean status = rs.getBoolean(10);
                String email = rs.getString("Email");
                user = new User(userName, userId, fullName, password, roleID, image, birthday, address, phone, status, email);
            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

    public User getUserById(int id) {
         DBConnection db = DBConnection.getInstance();
         User u = new User();
        String sql = "SELECT [userName]\n"
                + "      ,[userId]\n"
                + "      ,[fullName]\n"
                + "      ,[password]\n"
                + "      ,[roleId]\n"
                + "      ,[image]\n"
                + "      ,[birthday]\n"
                + "      ,[address]\n"
                + "      ,[phone]\n"
                + "      , [Email]\n"
                + "      ,[status]\n"
                + "  FROM [dbo].[User] where userId=?";
        try {
             Connection con = db.openConnection();
            PreparedStatement st = con.prepareStatement(sql); 
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
            u = new User(rs.getString("userName"), rs.getInt("userId"), rs.getString("fullName"),rs.getString("password"),rs.getInt("roleId"), rs.getString("image"),rs.getString("birthday"), rs.getString("address"), rs.getString("phone"), rs.getBoolean("status"), rs.getString("Email"));
            rs.close();
            st.close();
            con.close();
                return u; 
           }
           
             
        } catch (Exception e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }
    public void addUser(User u){
        DBConnection db = DBConnection.getInstance();
        String sql = "INSERT INTO [dbo].[User]\n" +
"           ([userName]\n" +
"           ,[fullName]\n" +
"           ,[password]\n" +
"           ,[roleId]\n" +
"           ,[image]\n" +
"           ,[birthday]\n" +
"           ,[address]\n" +
"           ,[phone]\n" +
"           ,[status])\n" +
"     VALUES\n" +
"           (?,?,?,?,?,?,?,?,?)";
        
        try {
             Connection con = db.openConnection();
            PreparedStatement st = con.prepareStatement(sql); 
            st.setString(1, u.getUserName());
            st.setString(2, u.getFullName());
            st.setString(3, u.getPassword());
            st.setInt(4,u.getRoleId());
            st.setString(5, u.getImage());
            st.setString(6,u.getBirthdayString(u.getBirthday()));
            st.setString(7, u.getAddress());
            st.setString(8, u.getPhone());
            st.setBoolean(9,u.isStatus());
            st.executeUpdate();
            st.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    
}
    public void deleteUser(int userId){
        String sql = "DELETE FROM [dbo].[User]\n" +
"      WHERE userId=?";
        DBConnection db = DBConnection.getInstance();
        try {
            Connection con = db.openConnection();
            PreparedStatement st = con.prepareStatement(sql);
           st.setInt(1, userId);
           st.executeUpdate();
           st.close();
            con.close();
        } catch (SQLException e) {
             System.out.println(e);
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
}
    public void updateUser(User u){
       DBConnection db = DBConnection.getInstance(); 
        String sql = "UPDATE [dbo].[User]\n" +
"   SET" +
"      [fullName] = ?\n" +
"      ,[password] = ?\n" +
"      ,[roleId] = ?\n" +
"      ,[image] = ?\n" +
"      ,[birthday] = ?\n" +
"      ,[address] = ?\n" +
"      ,[phone] =?\n" +
"      ,[status] = ?\n" +
"      ,[Email] = ?\n" +
" WHERE userName=? ";
        
        try {
            Connection con = db.openConnection();
            PreparedStatement st = con.prepareStatement(sql);
            
            st.setString(1,u.getFullName());
            st.setString(2,u.getPassword());
            st.setInt(3,u.getRoleId());
            st.setString(4,u.getImage());
            st.setString(5,u.getBirthdayString(u.getBirthday()));
            st.setString(6,u.getAddress());
            st.setString(7,u.getPhone());
            st.setBoolean(8, u.isStatus());
            st.setString(9, u.getEmail());
            st.setString(10, u.getUserName()); 
            
            st.execute();
            st.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void updateBasicInfoUser(String name, String fullName, String dob, String address, String phone, String email){
        DBConnection db = DBConnection.getInstance(); 
        String sql = "UPDATE [dbo].[User]\n" +
        "   SET" +
        "      [fullName] = ?\n" +
        "      ,[birthday] = ?\n" +
        "      ,[address] = ?\n" +
        "      ,[phone] =?\n" +
        "      ,[Email] = ?\n" +
        " WHERE userName=? ";
        
        try {
            Connection con = db.openConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1,fullName);
            st.setString(2,dob);
            st.setString(3,address);
            st.setString(4,phone);
            st.setString(5, email);
            st.setString(6,name);
            st.execute();
            st.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public boolean isExist(String email) throws SQLException {
        String sql = "SELECT * FROM [dbo].[User] WHERE Email=?";
        boolean isExist = false;
        try{
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setNString(1, email);
            ResultSet rs = statement.executeQuery();
            if(rs.next()){
                isExist = true;
            }else{
                isExist = false;
                        
            }
            rs.close();
            statement.close();
            con.close();
        }catch(Exception ex){
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE,null, ex);

        }
        return isExist;
    }
    public User getUserByEmail(String email){
        String sql = "SELECT * FROM [dbo].[User] WHERE Email = ?";
        User user = null;
        try{
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, email);
            ResultSet rs = statement.executeQuery();
            if(rs.next()){
                String userName = rs.getString(1);
                int userId = rs.getInt(2);
                String fullName = rs.getNString(3);
                String password = rs.getString(4);
                int roleID = rs.getInt(5);
                String image = rs.getString(6);
                String birthday = rs.getString(7);
                String address = rs.getString(8);
                String phone = rs.getString(9);
                Boolean status = rs.getBoolean(10);
                user = new User(userName, userId, fullName, password, roleID, image, birthday, address, phone, status, email);                
            }
            rs.close();
            statement.close();
            con.close();
        }catch(Exception ex){
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE,null, ex);
        }
        return user;
    }
    
    public void changePassword(String password, String email){
        String sql = "UPDATE [dbo].[User] SET password = ? WHERE Email = ?";
        ResultSet rs = null;
        try{
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, password);
            statement.setString(2, email);
            statement.executeQuery();
            statement.close();
            con.close();
            System.out.println("Sucess!");
        }catch(Exception ex){
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE,null, ex);
        }
    }
//    public static void updateUser(User u){
//       DBConnection db = DBConnection.getInstance(); 
//        String sql = "UPDATE [dbo].[User]\n" +
//"   SET" +
//"      [fullName] = ?\n" +
//
//
//
// "      ,[userName] = ?\n" +
//
//"      ,[password] = ?\n" +
//"      ,[roleId] = ?\n" +
//"      ,[image] = ?\n" +
//"      ,[birthday] = ?\n" +
//"      ,[address] = ?\n" +
//"      ,[phone] =?\n" +
//"      ,[status] = ?\n" +
//
//
//
//"       ,[email] = ?\n" +          
//
//
//
//" WHERE userId=? ";
//        
//        try {
//            Connection con = db.openConnection();
//            PreparedStatement st = con.prepareStatement(sql);
//            
//            st.setString(1,u.getFullName());
//
//            st.setString(2,u.getUserName());
//            st.setString(3,u.getPassword());
//            st.setInt(4,u.getRoleId());
//            st.setString(5,u.getImage());
//            st.setString(6,u.getBirthdayString(u.getBirthday()));
//            st.setString(7,u.getAddress());
//            st.setString(8,u.getPhone());
//            st.setBoolean(9, u.isStatus());
//            st.setString(10, u.getEmail());
//            st.setInt(11, u.getUserId());  
//
//            st.execute();
//            st.close();
//            con.close();
//        } catch (Exception e) {
//            System.out.println(e);
//        }
//    }
    
    public void deleteWallet(String userName){
                String sql = "DELETE FROM [dbo].[Wallet]\n" +
"      WHERE userName=?";
        DBConnection db = DBConnection.getInstance();
        try {
            Connection con = db.openConnection();
            PreparedStatement st = con.prepareStatement(sql);
           st.setString(1, userName);
           st.executeUpdate();
           st.close();
            con.close();
        } catch (SQLException e) {
             System.out.println(e);
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void addWallet(Wallet w){
        DBConnection db = DBConnection.getInstance();
        String sql = "INSERT INTO [dbo].[Wallet] userName, balance VALUES (?,?)";
        
        try {
             Connection con = db.openConnection();
            PreparedStatement st = con.prepareStatement(sql); 
            st.setString(1, w.getUserName().getUserName());
            st.setInt(2, w.getBalance());
            st.executeUpdate();
            st.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    
}
    public static void main(String[] args) throws SQLException {
        UserDAO userDao = new UserDAO();
        User u = new User("hung", "Vũ Hưng", "password123", 1, "./images/avatar/default.jpg", "2004-02-02", "Nghệ An", "0987654321", true, null);
        userDao.updateUser(u);
//        userDao.deleteWallet("anh");
//        userDao.deleteUser(1);
    }
    
    
}
