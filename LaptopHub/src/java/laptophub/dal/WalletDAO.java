/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package laptophub.dal;

import laptophub.model.Wallet;
import laptophub.utils.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import laptophub.model.User;




/**
 *
 * @author admin
 */
public class WalletDAO {
    private final DBConnection db;

    public WalletDAO() {
        db = new DBConnection();
    }
    
    public Wallet getWallet(String userName){
        UserDAO dao = new UserDAO();
        String sql = "SELECT * FROM [dbo].[Wallet] WHERE userName=?";
        DBConnection db = DBConnection.getInstance();
        Wallet wallet = null;
        try{
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setNString(1, userName);
            ResultSet rs = statement.executeQuery();
            if(rs.next()){
                int id = Integer.parseInt(rs.getString(1));
                User u = dao.getUser(userName);
                int balance = Integer.parseInt(rs.getString(3));
                wallet = new Wallet(id, u, balance);
                
            }
            rs.close();
            statement.close();
            con.close();
        }catch(Exception ex){
            Logger.getLogger(WalletDAO.class.getName()).log(Level.SEVERE, null, ex);

        }
        return wallet;
    }
    public static void main(String[] args) {
        WalletDAO w = new WalletDAO();
        System.out.println(w.getWallet("anh"));
    }
    
}
