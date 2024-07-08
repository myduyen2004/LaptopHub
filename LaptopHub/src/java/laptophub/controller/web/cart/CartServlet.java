/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package laptophub.controller.web.cart;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import laptophub.dal.ProductDAO;
import laptophub.model.Cart;
import laptophub.model.CartItem;
import laptophub.model.Product;
import laptophub.utils.CookieUtils;

/**
 *
 * @author admin
 */
public class CartServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        String action = request.getParameter("action");
        String username = (String) session.getAttribute("sessuser");
        ProductDAO dao = new ProductDAO();
        ArrayList<Product> listProduct = dao.getAllProduct();
        if (username != null) {
            
            if (action.equalsIgnoreCase("showcart")) {
                String txt = "";
                Cart cart = null;
                Product product = null;
//                Object o = session.getAttribute("cart");
//                if (o != null) {
//                    cart = (Cart) o;
//                } else {
//                    cart = new Cart();
//                }
                Cookie[] arr = request.getCookies();
                if (arr != null) {
                    for (Cookie c : arr) {
                        if (c.getName().equals(username + "cart")) {
                            
                            txt += c.getValue();
                            out.println(txt);
                            c.setMaxAge(0);
                            response.addCookie(c);
                        }
                    }
                }
                cart = new Cart(txt, listProduct);
                out.println(txt);
                List<CartItem> list = cart.getItems();
                request.setAttribute("cart", cart);
                session.setAttribute("cart", cart);
                session.setAttribute("total", cart.getTotalMoney());
                request.getRequestDispatcher("cartPage.jsp").forward(request, response);
            }
            if (action.equals("deletecart")) {
                String txt = "";
                Cookie[] arr = request.getCookies();
                if (arr != null) {
                    for (Cookie c : arr) {
                        if (c.getName().equals(username + "cart")) {
                            txt += c.getValue();
                            c.setMaxAge(0);
                            response.addCookie(c);
                        }
                    }
                }
                String product_id = request.getParameter("product_id");
                String[] ids = txt.split("/");
                String output = "";
                String newtxt = "";
                if(ids.length==1){
                    for (int i = 0; i < ids.length; i++) {
                    String[] s = ids[i].split(":");
                    if (s[0].equals(product_id)) {
                            output = s[0] + ":" + s[1];
                            newtxt = txt.replace(output, "");
                        }
                    }
//                    txt = newtxt;
                }else{
                    for (int i = 0; i < ids.length; i++) {
                    String[] s = ids[i].split(":");
                    if (s[0].equals(product_id)) {
                        if (i == 0) {
                            output = s[0] + ":" + s[1] + "/";
                            newtxt = txt.replace(output, "");
                        } else {
                            output = "/" + s[0] + ":" + s[1];
                            newtxt = txt.replace(output, "");
                        }
                    }
                }
                }
                Cart cart = new Cart(newtxt, listProduct);
                cart.removeItem(Integer.parseInt(product_id));
                List<CartItem> list = cart.getItems();
                out.println(txt);
                out.println(newtxt);
                session.setAttribute("size", list.size());
                CookieUtils.add(username + "size", String.valueOf(list.size()), 10, response);
                CookieUtils.add(username + "cart", newtxt, 10, response);
                session.setAttribute("cart", cart);
                session.setAttribute("total", cart.getTotalMoney());
                request.setAttribute("cart", cart);
                request.getRequestDispatcher("cartPage.jsp").forward(request, response);
            }

        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        CookieUtils util = new CookieUtils();
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("sessuser");
        if (username != null) {
            String txt = "";
            ProductDAO dao = new ProductDAO();
            ArrayList<Product> listProduct = dao.getAllProduct();
            Cart cart = null;
            Object o = session.getAttribute("cart");
            if (o != null) {
                cart = (Cart) o;
            } else {
                cart = new Cart();
            }

            Cookie[] arr = request.getCookies();
            if (arr != null) {
                for (Cookie c : arr) {
                    if (c.getName().equals(username + "cart")) {
                        txt += c.getValue();
                        c.setMaxAge(0);
                        response.addCookie(c);
                    }
                }
            }
            String quantityOrder = request.getParameter("quantityOrder");
            String product_id = request.getParameter("id");
            if (txt.isEmpty()) {
                txt = product_id + ":" + quantityOrder;
            } else {
                txt = txt + "/" + product_id + ":" + quantityOrder;
            }
            CookieUtils.add(username + "cart", txt, 10, response);
            cart = new Cart(txt, listProduct);
            List<CartItem> list = cart.getItems();
            CookieUtils.add(username + "size", String.valueOf(list.size()), 10, response);
            CookieUtils.add(username + "idProduct", product_id, 10, response);
            CookieUtils.add(username + "quantityOrder", quantityOrder, 10, response);
            session.setAttribute("cart", cart);
            session.setAttribute("total", cart.getTotalMoney());
            session.setAttribute("size", list.size());
            request.getRequestDispatcher("ProductDetail?id=" + product_id).forward(request, response);
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
