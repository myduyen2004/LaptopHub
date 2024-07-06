/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package laptophub.controller.web.authentication;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import laptophub.dal.UserDAO;
import laptophub.model.User;
import laptophub.utils.CookieUtils;

/**
 *
 * @author admin
 */
public class LoginServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
       String username = CookieUtils.get("cookuser", request);
       if(username!=null && username.equals("")){
           request.getRequestDispatcher("HomeServlet").forward(request, response);
           return;
       }
       request.getRequestDispatcher("login.jsp").forward(request, response);
    } 

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();

        
        User user = null;
        UserDAO userDAO = new UserDAO();
        try {
            user = userDAO.checkLogin(new User(userName, password));
        
        if (user != null) {
            if (request.getParameter("remember") != null) {
                String remember = request.getParameter("remember");
                CookieUtils.add("cookuser", userName, 15, response);
                CookieUtils.add("cookpass", password, 15, response);
                CookieUtils.add("cookrem", remember, 15, response);
            }
            session.setAttribute("sessuser", user.getUserName());
            session.setAttribute("message", "Login success");
            session.setAttribute("roleId", userDAO.getUser(userName).getRoleId());
            session.setAttribute("avatar", userDAO.getUser(userName).getImage());
            session.setAttribute("email", userDAO.getUser(userName).getEmail());
            session.setAttribute("name", userDAO.getUser(userName).getFullName());
//            response.getWriter().print(session.getAttribute("roleId"));
            response.getWriter().print(session.getAttribute("roleId").equals(2));

            response.sendRedirect(request.getContextPath() + "/HomeServlet");
        } else {
            request.setAttribute("msg", "Authentication failure");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        } catch (Exception e) {
            response.getWriter().print(e.getMessage());
        }
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

}
