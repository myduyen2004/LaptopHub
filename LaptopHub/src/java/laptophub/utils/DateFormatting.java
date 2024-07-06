/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package laptophub.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author 
 */
public class DateFormatting {

    public static String format(Date date) {
        return new SimpleDateFormat("HH:mm:ss 'ngày' dd 'tháng' MM 'năm' yyyy").format(date);
    }
}
