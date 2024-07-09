/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package laptophub.controller.web.profile;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import laptophub.dal.UserDAO;
import laptophub.model.User;

/**
 *
 * @author admin
 */
@WebServlet(name = "ProfileServlet", urlPatterns = {"/profile"})

public class ProfileServlet extends HttpServlet {
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
            out.println("<title>Servlet ProfileServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProfileServlet at " + request.getContextPath () + "</h1>");
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
        String command = request.getParameter("cmd");
        if(command == null){
                command = "show";
            }
        switch(command){
            case "show": showProfile(request, response);
            case "load": loadProfile(request, response);
            case "update": updateProfile(request, response);
            default: showProfile(request, response);
        }
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

    public void showProfile(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        UserDAO uDao = new UserDAO();
        HttpSession session = request.getSession(true);
        String name = (String)session.getAttribute("sessuser");
        User u = uDao.getUser(name);
        request.setAttribute("USER", u);
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }
    
    public void loadProfile(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        UserDAO uDao = new UserDAO();
        HttpSession session = request.getSession(true);
        String name = (String)session.getAttribute("sessuser");
        User u = uDao.getUser(name);
        request.setAttribute("USER", u);
        request.getRequestDispatcher("updateprofile.jsp").forward(request, response);
    }
    
    public void updateProfile(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        UserDAO uDao = new UserDAO();
        HttpSession session = request.getSession();
        String name = (String)session.getAttribute("sessuser");
        String fullName = request.getParameter("fullName");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        uDao.updateBasicInfoUser(name, fullName, dob, address, phone, email);
        showProfile(request, response);
    }
}
