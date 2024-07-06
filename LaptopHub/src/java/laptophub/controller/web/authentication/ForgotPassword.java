/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package laptophub.controller.web.authentication;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import laptophub.dal.UserDAO;
import laptophub.model.User;
import laptophub.utils.DateFormatting;
import laptophub.utils.Gmail;
import laptophub.utils.RandomGenerator;

/**
 *
 * @author admin
 */
public class ForgotPassword extends HttpServlet {
   
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
            out.println("<title>Servlet ForgotPassword</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgotPassword at " + request.getContextPath () + "</h1>");
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
    private void sendVerificationMail(String email, String subject, int id, String code) {
        try {
            new Gmail(email)
                    .setContentType("text/html; charset=UTF-8")
                    .setSubject(subject)
                    .initMacro()
                    .appendMacro("EMAIL", email)
                    .appendMacro("ID", id + "")
                    .appendMacro("WHEN", DateFormatting.format(new Date()))
                    .appendMacro("CODE", code)
                    .sendTemplate(new URL("http://localhost:8080/LaptopHubWeb/templates/gmail_code.jsp"));
        } catch (MalformedURLException ex) {
            Logger.getLogger(ForgotPassword.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDAO userDAO = new UserDAO();
        String cmd = req.getParameter("cmd");
        HttpSession mySession = req.getSession();
        if (cmd.equals("1")) {
            String receiveEmail = req.getParameter("receiveEmail");
            resp.getWriter().print(receiveEmail);
            try {
                if (receiveEmail != null && userDAO.isExist(receiveEmail)) {
                    String otpvalue = RandomGenerator.randString(RandomGenerator.NUMERIC_CHARACTER, 6);
                    User user = userDAO.getUserByEmail(receiveEmail);
                    resp.getWriter().print(otpvalue);
                    new Thread(() -> {
                        sendVerificationMail(receiveEmail, "Verification code", user.getUserId(), otpvalue);
                    }).start();
                    
                    req.setAttribute("email", receiveEmail);
                    mySession.setAttribute(receiveEmail, otpvalue);
                    req.setAttribute("success", "Gửi mã OTP thành công! ");
                    req.getRequestDispatcher("authentication/verify-otp.jsp").forward(req, resp);
                } else {
                    req.setAttribute("error", "Gửi mã OTP thất bại! Vui lòng kiểm tra lại email!");
                    req.getRequestDispatcher("authentication/verify-gmail.jsp").forward(req, resp);

                }
            } catch (Exception ex) {
                Logger.getLogger(ForgotPassword.class.getName()).log(Level.SEVERE, null, ex);
                req.setAttribute("error", "Gửi mã OTP thất bại! Vui lòng kiểm tra lại email!");
                req.getRequestDispatcher("authentication/verify-gmail.jsp").forward(req, resp);
            }
        } else if (cmd.equals("2")) {
            String email = req.getParameter("email");
            String otp = req.getParameter("otp1")+req.getParameter("otp2")+req.getParameter("otp3")+req.getParameter("otp4")
                    +req.getParameter("otp5")+req.getParameter("otp6");
            String code = (String) mySession.getAttribute(email);
            req.setAttribute("email", email);
            if (otp.equals(code)) {
                req.setAttribute("success", "Xác minh mã OTP thành công!");
                req.getRequestDispatcher("authentication/reset-password.jsp").forward(req, resp);
            } else {
                req.setAttribute("error", "Xác minh mã OTP thất bại! Vui lòng thử lại");
                req.getRequestDispatcher("authentication/verify-otp.jsp").forward(req, resp);

            }
        } else if (cmd.equals("3")) {
            
                String email = req.getParameter("email");
                String password = req.getParameter("password");
                String passwordAgain = req.getParameter("password-again");
                
                if (password.equals(passwordAgain)) {
                    if(password.length() <8){
                        req.setAttribute("error", "Mật khẩu mới phải lớn hơn 8 kí tự");
                        req.getRequestDispatcher("authentication/reset-password.jsp").forward(req, resp);
                    }else
                    userDAO.changePassword(password, email);
                    req.setAttribute("success", "Đặt mật khẩu mới thành công");
                    req.getRequestDispatcher("login.jsp").forward(req, resp);
                } else {
                    req.setAttribute("error", "Mật khẩu nhập lại không khớp! Vui lòng thử lại");
                    req.getRequestDispatcher("authentication/reset-password.jsp").forward(req, resp);
                }
            
        }
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
