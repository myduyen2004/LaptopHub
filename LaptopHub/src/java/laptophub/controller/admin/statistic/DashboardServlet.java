/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package laptophub.controller.admin.statistic;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import laptophub.dal.OrderDAO;
import laptophub.dal.ProductDAO;
import laptophub.dal.SupplierDAO;
import laptophub.dal.UserDAO;
import laptophub.model.Supplier;
import laptophub.model.User;

/**
 *
 * @author admin
 */
@WebServlet(name = "DashBoardServlet", urlPatterns = {"/admin"})

public class DashboardServlet extends HttpServlet {
   
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
            out.println("<title>Servlet DashboardServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DashboardServlet at " + request.getContextPath () + "</h1>");
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
        PrintWriter out = response.getWriter();
        UserDAO user = new UserDAO();
        ProductDAO product = new ProductDAO();
        OrderDAO order = new OrderDAO();
        SupplierDAO supplierDAO = new SupplierDAO();
        int numOfCustomer = user.getNumOfCustomer();
        int numOfProduct = product.getNumOfProduct();
        int totalRevenue = order.getTotalRevenue();
        int totalSold = product.getTotalSold();
        List<Supplier> supplier = supplierDAO.getAllSupplier();
        List<User> topUser = user.getTop5Customer();
        int monthlyRevenue4 = order.getMonthlyRevenue("4");
        int monthlyRevenue5 = order.getMonthlyRevenue("5");
        int monthlyRevenue6 = order.getMonthlyRevenue("6");
        int todayRevenue = order.getTodayRevenue();

        request.setAttribute("numOfCustomer", numOfCustomer);
        request.setAttribute("numOfProduct", numOfProduct);
        request.setAttribute("totalRvenue", totalRevenue);
        request.setAttribute("totalSold", totalSold);
        request.setAttribute("supplierList", supplier);
        request.setAttribute("topUser", topUser);
        request.setAttribute("monthlyRevenue4", monthlyRevenue4);
        request.setAttribute("monthlyRevenue5", monthlyRevenue5);
        request.setAttribute("monthlyRevenue6", monthlyRevenue6);
        request.setAttribute("todayRevenue", todayRevenue);
        
//        out.print(topUser);
        request.getRequestDispatcher("dashboard/main.jsp").forward(request, response);
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
        processRequest(request, response);
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
