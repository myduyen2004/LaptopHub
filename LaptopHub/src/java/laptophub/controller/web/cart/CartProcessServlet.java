/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package laptophub.controller.web.cart;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import laptophub.dal.ProductDAO;
import laptophub.model.Cart;
import laptophub.model.CartItem;
import laptophub.model.Product;
import laptophub.utils.CookieUtils;

/**
 *
 * @author ADM
 */
public class CartProcessServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CartProcessServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartProcessServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String username = (String)session.getAttribute("sessuser");
        ProductDAO prdDAO = new ProductDAO();
        ArrayList<Product> list = prdDAO.getAllProduct();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if(arr!=null){
            for(Cookie c : arr){
                if(c.getName().equals(username+"cart")){
                    txt+=c.getValue();
                    c.setMaxAge(0);
                    response.addCookie(c);
                }
            }
        }
        Cart cart = new Cart(txt, list);
        String num_raw = request.getParameter("num");
        String id_raw = request.getParameter("id");
        int id, num = 0;
        try{
            id = Integer.parseInt(id_raw);
            Product p = prdDAO.getProductById(id);
            int numStore = p.getQuantityPerUnit();
            num = Integer.parseInt(num_raw);
            if(num==-1 && (cart.getQuantityItemById(id)<=1)){
                cart.removeItem(id);
            }else{
                if(num==1 && (cart.getQuantityItemById(id)>=numStore)){
                    num=0;
                }
                int price = p.getUnitPrice();
                CartItem t = new CartItem(p, num, price);
                cart.addItem(t);
            }
        }catch(NumberFormatException e){
            
        }
        
        ArrayList<CartItem> items = cart.getItems();
        txt="";
        if(!items.isEmpty()){
            txt = items.get(0).getProduct().getProductId()+":"+
                    items.get(0).getQuantity();
            for(int i = 1; i<items.size(); i++){
                txt+="/"+items.get(i).getProduct().getProductId()+":"+
                    items.get(i).getQuantity();
            }
        }
        Cookie c = new Cookie(username+"cart", txt);
        c.setMaxAge(60*60*24*30);
        response.addCookie(c);
        int size = cart.getItems().size();
        Cookie c1 = new Cookie(username+"cartSize", String.valueOf(size));
        c1.setMaxAge(60*60*24*30);
        response.addCookie(c1);
        request.getRequestDispatcher("ViewCartServlet").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String username = (String)session.getAttribute("sessuser");
        ProductDAO prdDAO = new ProductDAO();
        ArrayList<Product> list = prdDAO.getAllProduct();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if(arr!=null){
            for(Cookie c : arr){
                if(c.getName().equals(username+"cart")){
                    txt+=c.getValue();
                    c.setMaxAge(0);
                    response.addCookie(c);
                }
            }
        }
        
        String id = request.getParameter("id");
        String[] ids = txt.split("/");
        String out = "";
        for(int i = 0; i<ids.length; i++){
            String[] s = ids[i].split(":");
            if(!s[0].equals(id)){
                if(out.isEmpty()){
                    out=ids[i];
                }else{
                    out+="/"+ids[i];
                }
            }
        }
        if(!out.isEmpty()){
            Cookie c = new Cookie(username+"cart", out);
            c.setMaxAge(30*24*60*60);
            response.addCookie(c);
        }
        Cart cart = new Cart(out, list);
        int size = cart.getItems().size();
        Cookie c1 = new Cookie(username+"cartSize", String.valueOf(size));
        c1.setMaxAge(60*60*24*30);
        response.addCookie(c1);
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("cartPage.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
