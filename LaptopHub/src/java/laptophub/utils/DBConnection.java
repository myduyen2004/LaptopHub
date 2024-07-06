/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package laptophub.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import laptophub.config.Configuration;

/**
 *
 * @author admin
 */
public class DBConnection implements Configuration{
    private static DBConnection instance;

    public DBConnection() {
    }
    
    public Connection openConnection() throws Exception{
        Class.forName(driverName);
        Connection con = DriverManager.getConnection(url, user, pass);
        return con;
    }
    public static DBConnection getInstance() {
        if(instance == null){
            instance = new DBConnection();
        }
        return instance;        
    }   
}
