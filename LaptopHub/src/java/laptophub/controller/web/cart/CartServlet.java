/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package laptophub.controller.web.cart;

import java.io.IOException;
import jakarta.servlet.ServletException;
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

/**
 *
 * @author admin
 */
public class CartServlet extends HttpServlet {
    
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
        out.print(action);
        Product product = null;
        if (action==null) {
            Cart cart = null;
            Object o = session.getAttribute("cart");
            if (o != null) {
                cart = (Cart) o;
            } else {
                cart = new Cart();
            }
            String quantityOrder = request.getParameter("quantityOrder");
            String product_id = request.getParameter("id");
            String size = request.getParameter("size");
            try {
                int quantity = Integer.parseInt(quantityOrder);
                ProductDAO pdao = new ProductDAO();
                product = pdao.getProductById(Integer.parseInt(product_id));
                CartItem item = new CartItem(product, quantity, product.getUnitPrice());
                cart.addItem(item);


            } catch (Exception e) {
            }
            List<CartItem> list = cart.getItems();
            session.setAttribute("cart", cart);
            session.setAttribute("total", cart.getTotalPrice());
            session.setAttribute("size", list.size());
            request.setAttribute("product", product);
            request.getRequestDispatcher("ProductDetail?id="+product_id).forward(request, response);
        }
        if (action.equalsIgnoreCase("showcart")) {
            request.getRequestDispatcher("cartPage.jsp").forward(request, response);
        }
        if (action.equals("deletecart")) {
            Cart cart = null;
            Object o = session.getAttribute("cart");
            if (o != null) {
                cart = (Cart) o;
            } else {
                cart = new Cart();
            }
            String product_id = request.getParameter("product_id");
            cart.removeItem(Integer.parseInt(product_id));
            List<CartItem> list = cart.getItems();
            session.setAttribute("cart", cart);
            session.setAttribute("total", cart.getTotalPrice());
            session.setAttribute("size", list.size());
            response.sendRedirect("cartPage.jsp");
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
        processRequest(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        String action = request.getParameter("action");
        if (action==null) {
            Cart cart = null;
            Object o = session.getAttribute("cart");
            if (o != null) {
                cart = (Cart) o;
                
            } else {
                cart = new Cart();
            }
            String quantityOrder = request.getParameter("quantityOrder");
            String product_id = request.getParameter("id");
            String size = request.getParameter("size");
            try {
                int quantity = Integer.parseInt(quantityOrder);
                ProductDAO pdao = new ProductDAO();
                Product product = pdao.getProductById(Integer.parseInt(product_id));
                CartItem item = new CartItem(product, quantity, product.getUnitPrice());
                cart.addItem(item);

            } catch (Exception e) {
            }
            List<CartItem> list = new ArrayList<>();
            list = cart.getItems();
            session.setAttribute("cart", cart);
            session.setAttribute("total", cart.getTotalPrice());
            session.setAttribute("size", list.size());
            request.getRequestDispatcher("ProductDetail?id="+product_id).forward(request, response);
        }
    }
    
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
