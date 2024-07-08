/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package laptophub.controller.admin.management.order;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonSyntaxException;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.Reader;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import laptophub.dal.OrderDAO;
import laptophub.model.Order;
import laptophub.model.OrderRequest;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

/**
 *
 * @author admin
 */
//@WebServlet(name = "ManageOrder", urlPatterns = {"/admin/manageOrder"})

public class ManageOrder extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    OrderDAO orderDao = new OrderDAO();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ManageOrder</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageOrder at " + request.getContextPath () + "</h1>");
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
        try {
            String theCommand = request.getParameter("command");
            if (theCommand == null) {
                theCommand = "LIST";
            }
            switch (theCommand) {
                case "LIST":
                    listOrder(request, response);
                    break;
                case "CONFIRM":
                    confirmOrder(request, response);
                    break;
                case "LOAD":
                    loadOrder(request, response);
                    break;
                case "CANCEL":
                    cancelOrder(request, response);
                    break;
                case "DELETE":
                    deleteOrder(request, response);
                    break;
                default:
            }
        } catch (ServletException | IOException  ex) {
            Logger.getLogger(ManageOrder.class.getName()).log(Level.SEVERE, null, ex);
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
    
    public void listOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<Order> orderList = orderDao.getAllOrder();
        request.setAttribute("orderList", orderList);
        request.getRequestDispatcher("dashboard/order.jsp").forward(request, response);
    }
    public void loadOrder(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        PrintWriter out = response.getWriter();
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        Order o = orderDao.getOrderById(orderId);
        List<OrderRequest.Product> list = orderDao.getOrderDetail(orderId);
        request.setAttribute("THE_ORDER", o);
        request.setAttribute("THE_LIST", list);

        request.getRequestDispatcher("dashboard/confirm-form.jsp").forward(request, response);
    }
    public void confirmOrder(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        PrintWriter out = response.getWriter();
        OrderRequest orderRequest = new OrderRequest();
        int orderId= Integer.parseInt(request.getParameter("orderId"));
        List<OrderRequest.Product> list = orderDao.getOrderDetail(orderId);
        float weight = Float.parseFloat(request.getParameter("weight"));
        for (OrderRequest.Product product : list) {
            product.setWeight(weight/list.size());
        }
        
        Order o = orderDao.getOrderById(orderId);
        int codPay = 0;
        if(o.getPayment().equals("Thanh toán online")){
            codPay = o.getTotalMoney();
        }
        OrderRequest.Order order = new OrderRequest.Order();
        order.setNote("Khối lượng tính cước tối đa: 1.00 kg");
        order.setDeliver_option("none");
        order.setHamlet("Khác");
        order.setPick_ward("Hòa Hải");
        order.setPick_district("Ngũ Hành Sơn");
        order.setPick_province("Đà Nẵng");
        order.setPick_tel("0123456789");
        order.setPick_option("cod");
        order.setPick_name("LAPTOPHUB-FPT");
        order.setIs_freeship("1");
        order.setPick_address("Khu đô thị FPT");
        order.setTransport("fly");
        order.setPick_session(2);
        order.setBooking_id("1");
        order.setTags(Arrays.asList(1,7));
        
        order.setAddress(o.getAddress());
        order.setWard(o.getWard());
        order.setDistrict(o.getDistrict());
        order.setProvince(o.getProvince());
        order.setPick_money(codPay);
        order.setName(o.getUserName().getUserName() + " LaptopHub: Đơn hàng: "+ o.getOrderId());
        order.setPick_date(o.getDateString());
        order.setTel(o.getPhone());
        order.setId(Integer.toString(o.getOrderId()));
        order.setValue(o.getTotalMoney());
        
        orderRequest.setProducts(list);
        orderRequest.setOrder(order);
        
        //Chuyển đổi OrderRequest thành JSON
//        out.print(orderRequest.getProducts());
        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String json = gson.toJson(orderRequest);
        out.print(json);
        System.out.println("JSON Data: " + json);
        out.print(json);
        try(Reader reader = request.getReader()){
            Gson gson01 = new GsonBuilder().setPrettyPrinting().create();
            OrderRequest orderRequest01 = gson.fromJson(reader, OrderRequest.class);
            try(CloseableHttpClient httpClient = HttpClients.createDefault()){
                HttpPost httpPost = new HttpPost("https://services.giaohangtietkiem.vn/services/shipment/order");
                httpPost.setHeader("Content-type", "application/json");
                httpPost.setHeader("Token", "48bea2bea7ae57dcc6950553e9577f536ca15c89");
                // Thêm dữ liệu JSON vào yêu cầu
                out.print(json);
                StringEntity entity = new StringEntity(json, StandardCharsets.UTF_8);
                httpPost.setEntity(entity);
                // Nhận phản hồi từ API
                HttpResponse httpResponse = httpClient.execute(httpPost);
                HttpEntity responseEntity = httpResponse.getEntity();
                String responseString = EntityUtils.toString(responseEntity, StandardCharsets.UTF_8);
                // Trả phản hồi về client
                response.setContentType("application/json; charset=UTF-8");
                out.print(responseString);
                out.flush();
            }catch(Exception e){
                out.print(e.getMessage());
            }
            orderDao.confirmOrderStatus(orderId);
            request.setAttribute("success", "Thành công xác nhận, đơn hàng sẽ được giao GHTK");
            
        }catch(JsonSyntaxException e){
            out.print(e.getMessage());
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            request.setAttribute("error", "Thất bại");
        }
//        listOrder(request, response);
        
    }
    
    public void cancelOrder(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        long serialVersionUID = 1L;
        String API_TOKEN = "48bea2bea7ae57dcc6950553e9577f536ca15c89";
        String partnerId = request.getParameter("orderId");
        // Xây dựng URL cho API
        String apiUrl;
        
        apiUrl = "https://services.giaohangtietkiem.vn/services/shipment/cancel/partner_id:" + partnerId;
        // Tạo client HTTP và request
        try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
            HttpPost httpPost = new HttpPost(apiUrl);
            httpPost.setHeader("Token", API_TOKEN);
            httpPost.setHeader("Content-Type", "application/json");

            // Gửi request và nhận response
            try (CloseableHttpResponse httpResponse = httpClient.execute(httpPost)) {
                // Đọc dữ liệu từ response
                String jsonResponse = EntityUtils.toString(httpResponse.getEntity());
                System.out.println("Response JSON: " + jsonResponse);
                response.getWriter().print(jsonResponse);
                // Phân tích JSON
                if (jsonResponse.contains("\"success\": true")) {
                    response.setContentType("application/json");
                    response.getWriter().write("{\"success\": true, \"message\": \"Đơn hàng đã được hủy thành công.\"}");
                    request.setAttribute("success", "Đơn hàng được hủy thành công!");
                } else {
                    response.setContentType("application/json");
                    response.getWriter().write("{\"success\": false, \"message\": \"Hủy đơn hàng thất bại.\"}");
                    request.setAttribute("error", "Đơn hàng đã được hủy bên hệ thống GHTK");
                }
            }
            
        } catch (IOException e) {
            request.setAttribute("error", "Hủy đơn thất bại");
            e.printStackTrace();
            response.getWriter().print(e.getMessage());
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi thực hiện yêu cầu hủy đơn hàng.");
        }
        listOrder(request, response);
    }
    
    public void deleteOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String orderId = request.getParameter("orderId");
        response.getWriter().print("IN RAAAAA");
        orderDao.deleteOrderDetails(Integer.parseInt(orderId));
        orderDao.deleteOrder(Integer.parseInt(orderId));
        listOrder(request, response);
    }
}
