/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package laptophub.utils;

import java.text.NumberFormat;
import java.util.Locale;

/**
 *
 * @author admin
 */
public class MoneyUtils {

    public MoneyUtils() {
    }
    
    public String formatMoney(int amount) {
        NumberFormat formatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        return formatter.format(amount);
    }
    //for testing
    public static void main(String[] args) {
        MoneyUtils money = new MoneyUtils();
        System.out.println(money.formatMoney(20001283));
    }
    
}
