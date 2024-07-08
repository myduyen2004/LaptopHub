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
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import laptophub.controller.web.authentication.ForgotPassword;
import laptophub.dal.OrderDAO;
import laptophub.dal.WalletDAO;
import laptophub.model.Cart;
import laptophub.model.CartItem;
import laptophub.model.Order;
import laptophub.model.User;
import laptophub.model.Wallet;
import laptophub.utils.DateFormatting;
import laptophub.utils.DateTimeUtils;
import laptophub.utils.Gmail;

/**
 *
 * @author admin
 */
public class Checkout extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, ParseException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
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
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
    } 
    private void sendOrderNoti(String email, String subject, String username, String code, String total, String phone) {
        try {
            new Gmail(email)
                    .setContentType("text/html; charset=UTF-8")
                    .setSubject(subject)
                    .initMacro()
                    .appendMacro("EMAIL", email)
                    .appendMacro("USERNAME", username)
                    .appendMacro("WHEN", DateFormatting.format(new Date()))
                    .appendMacro("CODE", code)
                    .appendMacro("TOTAL", total)
                    .appendMacro("PHONE", phone)
                    .sendTemplate(new URL("http://localhost:8080/LaptopHubWeb/templates/noti-ord-admin.jsp"));
        } catch (MalformedURLException ex) {
            Logger.getLogger(ForgotPassword.class.getName()).log(Level.SEVERE, null, ex);
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
        PrintWriter out = response.getWriter();
        String messageOrder = "";
        int orderId = 0;
        try{
            DateTimeUtils dateUtils = new DateTimeUtils();
            OrderDAO dao = new OrderDAO();
            WalletDAO w = new WalletDAO();
            HttpSession session = request.getSession(true);
            Cart cart = null;
            Object o = session.getAttribute("cart");
            if(o != null){
                cart = (Cart) o ;
            }else{
                cart = new Cart();
            }
            User acc = null;
            Date date = null;
            String time = null;
            Object user = session.getAttribute("u");
            String payment_method = request.getParameter("payment_method");
            String payment = null;
            int totalBill = cart.getTotalPrice();
            if(o!= null && totalBill >0){
                if(user != null){
                    String address = request.getParameter("address");
                    String ward = request.getParameter("ward");
                    String province = request.getParameter("province");
                    String district = request.getParameter("district");
                    String phone = request.getParameter("phone");
                    int phoneNumber = Integer.parseInt(phone);
                    if(payment_method.equals("cod")){
                        payment="COD";
                    }else if(payment_method.equals("online")){
                        payment="WALLET";
                    }
                    acc = (User) user;
                    String email = acc.getEmail();
                    String username = acc.getUserName();
                    if(payment.equals("WALLET")){
                        Wallet wallet = w.getWallet(acc.getUserName());
                        if(wallet.getBalance() >= totalBill){
                            date = dateUtils.converseDateNow(dateUtils.getDateNow());
                            time = dateUtils.getTime();
                            dao.addSubtractTrans(wallet, orderId, time);
                            dao.addOrder(acc, totalBill, date, time, payment, address, ward, province, district, phone);
                            for (CartItem i : cart.getItems()) {
                                dao.addOrderDetail(acc, i, date, time);
                            }
                            Order order = dao.getOrder(acc, date, time);
                            messageOrder = "Đặt hàng thành công! Chúng tôi sẽ sớm liên hệ với bạn để xác nhận đơn hàng!";
                            orderId = dao.getOrder(acc, date, time).getOrderId();
                            request.setAttribute("msg", messageOrder);
                            request.setAttribute("id", orderId);
                            
                            new Thread(() -> {
                                sendOrderNoti(email, "Verification code", username, Integer.toString(order.getOrderId()), Integer.toString(order.getTotalMoney()), phone );
                            }).start();
                            request.getRequestDispatcher("success.jsp").forward(request, response);
                        }else{
                            //thiếu tiền ví->thực hiện nộp tiền vào tài khoản
                            messageOrder = "Đặt hàng thất bại! Hiện số dư ví của bạn không đủ! Vui lòng nạp thêm tiền vào ví";
                            request.setAttribute("msg", messageOrder);
                            request.getRequestDispatcher("error.jsp").forward(request, response);
                        }
                    }else if(payment.equals("COD")){
                        date = dateUtils.converseDateNow(dateUtils.getDateNow());
                        time = dateUtils.getTime();
                        dao.addOrder(acc, totalBill, date, time, payment,address, ward, province, district, phone);
                        for (CartItem i : cart.getItems()) {
                                dao.addOrderDetail(acc, i, date, time);
                        }
                        messageOrder = "Đặt hàng thành công! Chúng tôi sẽ sớm liên hệ với bạn để xác nhận đơn hàng!";
                        Order orderCOD = dao.getOrder(acc, date, time);
                        request.setAttribute("msg", messageOrder);
                        request.setAttribute("id", orderCOD.getOrderId());
                        new Thread(() -> {
                                sendOrderNoti(email, "Verification code", username, Integer.toString(orderCOD.getOrderId()), Integer.toString(orderCOD.getTotalMoney()), phone);
                            }).start();
                        request.getRequestDispatcher("success.jsp").forward(request, response);
                    }
                }else{
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            }else{
                messageOrder = "Không có sản phẩm tồn tại trong giỏ hàng";
                request.setAttribute("msg", messageOrder);
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        }catch(Exception ex){
            messageOrder = "Đã có một số lỗi xảy ra! Vui lòng điền đầy đủ thông tin và thử lại!";
            request.setAttribute("msg", messageOrder);
            request.getRequestDispatcher("error.jsp").forward(request, response);
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
