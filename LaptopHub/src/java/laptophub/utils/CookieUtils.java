/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package laptophub.utils;

import com.sun.net.httpserver.HttpServer;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author NGUYENVU
 */
public class CookieUtils {
    public static Cookie add(String name,String value,int hour,HttpServletResponse response){
        Cookie cookie = new  Cookie(name, value);
        cookie.setMaxAge(60*60*hour);
       cookie.setPath("/");
       response.addCookie(cookie);
       return cookie;
       
    }
    public static String get(String name,HttpServletRequest request){
        Cookie[] cookies = request.getCookies();
        if(cookies!=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equalsIgnoreCase(name)){
                    return cookie.getValue();
                }
            }
        }
        return "";
    }
}
