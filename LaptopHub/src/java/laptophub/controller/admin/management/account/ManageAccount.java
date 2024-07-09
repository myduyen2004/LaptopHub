/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package laptophub.controller.admin.management.account;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import laptophub.controller.admin.management.product.ProductManagement;
import laptophub.dal.UserDAO;
import laptophub.model.User;

/**
 *
 * @author admin
 */
@WebServlet(name = "ManageAccount", urlPatterns = {"/manageacc"})
public class ManageAccount extends HttpServlet {
    UserDAO ud = new UserDAO();

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
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        PrintWriter out = response.getWriter();
        try {
            String theCommand = request.getParameter("command");
            if (theCommand == null) {
                theCommand = "LIST";
            }
            switch (theCommand) {
                case "LIST":
                    listUser(request, response);
                    break;
                case "LOAD":
                    loadUser(request, response);
                    break;
                case "UPDATE":
                        doPost(request, response);
                        break;
                case "DELETE":
                    deleteUser(request, response);
                    break;
                default:
            }
        } catch (ServletException | IOException ex) {
            Logger.getLogger(ManageAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String userName = request.getParameter("username");
        String fullName = request.getParameter("fullname");
        String birthdayStr = request.getParameter("birthday");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        int roleId = 1; 
        String role = request.getParameter("role");
        if(role.equals("Admin")){
            roleId = 2;
        }
        boolean status = true;
        String statusString = request.getParameter("status");
        if(statusString.equals("Non-active")){
            status = false;
        }
        String img="./images/avatar/default.jpg";
        User u = new User(userName, fullName,password , roleId, img, birthdayStr, address, phone, status, email);
        response.getWriter().print(u);
        UserDAO ud = new UserDAO();
        ud.updateUser(u);
        listUser(request, response);
    }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void loadUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        PrintWriter out = response.getWriter();
        int userId = Integer.parseInt(request.getParameter("userId"));
        User user = ud.getUserById(userId);
        request.setAttribute("USER", user);
        request.getRequestDispatcher("dashboard/update-account-form.jsp").forward(request, response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        String userName = request.getParameter("userName");
        ud.deleteWallet(userName);
        ud.deleteUser(userId);
        listUser(request, response);
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO udao = new UserDAO();
        List<User> userList = udao.getAllUSer();
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("dashboard/account.jsp").forward(request, response);
    }
    
    public static void main(String[] args) {
         UserDAO udao = new UserDAO();
        List<User> userList = udao.getAllUSer();
        System.out.println(userList.get(0).getImage());
    }
     
}