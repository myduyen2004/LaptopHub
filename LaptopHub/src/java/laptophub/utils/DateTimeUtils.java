/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package laptophub.utils;

import java.security.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.sql.Time;
import java.time.LocalTime;

/**
 *
 * @author admin
 */
public class DateTimeUtils {

    public DateTimeUtils() {
    }
    
    public String getDateNow(){
        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formattedDate = currentDate.format(formatter);
        return formattedDate;
    }
    
    public Date converseDateNow(String dateString) throws ParseException{
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = formatter.parse(dateString);
        return date;
    }
    
//    public Time getTimeNow(){
//        long now = System.currentTimeMillis();
//        Time sqlTime = new Time(now);
//        return sqlTime;
//    }
    
    public String getTime(){
        LocalTime currentTime = LocalTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
        String formattedTime = currentTime.format(formatter);
        return formattedTime;
    }
    
    public static void main(String[] args) {
        DateTimeUtils u = new DateTimeUtils();
        System.out.println(u.getTime());
    }
    
}
