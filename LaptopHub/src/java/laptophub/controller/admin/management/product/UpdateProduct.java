/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package laptophub.controller.admin.management.product;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import laptophub.dal.CategoryDAO;
import laptophub.dal.ProductDAO;
import laptophub.dal.SupplierDAO;
import laptophub.model.ImageProduct;
import laptophub.model.Product;
import laptophub.utils.DateTimeUtils;
import laptophub.utils.ImageHandler;

/**
 *
 * @author admin
 */
@MultipartConfig
public class UpdateProduct extends HttpServlet {

    ImageHandler imageHandler = new ImageHandler();
    DateTimeUtils dateUtils = new DateTimeUtils();
    CategoryDAO cat = new CategoryDAO();
    SupplierDAO sup = new SupplierDAO();
    ProductDAO prodDao = new ProductDAO();

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
            out.println("<title>Servlet UpdateProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProduct at " + request.getContextPath() + "</h1>");
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
        HttpSession mySession = request.getSession();
        Product p = null;
        try {
            PrintWriter out = response.getWriter();
            int id = Integer.parseInt(request.getParameter("productId"));
//            response.getWriter().print(id);
            String productName = request.getParameter("productName");
            String description = request.getParameter("description");
            String category = request.getParameter("category");
            int categoryId = cat.getCategoryByName(category).getCategoryId();
            String supplier = request.getParameter("supplier"); //id
            int supplierId = sup.getSupplierByName(supplier).getSupplierId();
            int unitPrice = Integer.parseInt(request.getParameter("unitPrice"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            boolean isDiscount = "Có".equals(request.getParameter("isDiscount"));
            float discount = Float.parseFloat(request.getParameter("discount"));
            boolean statusProduct = "Đang bán".equals(request.getParameter("status"));
            Date releaseDate = null;
            try {
                releaseDate = dateUtils.converseDateNow(dateUtils.getDateNow());
            } catch (ParseException ex) {
                Logger.getLogger(UpdateProduct.class.getName()).log(Level.SEVERE, null, ex);
            }

            p = new Product(id, supplierId, categoryId, productName, quantity, unitPrice, isDiscount, description, releaseDate, discount, statusProduct);
            prodDao.updateProduct(p);

            ArrayList<ImageProduct> imgList = new ArrayList<>();
            String folder = "prd" + Integer.toString(p.getProductId());
//            out.print(folder);

            Collection<Part> parts = request.getParts();
            out.print(parts);
            if (!parts.isEmpty()) {
                prodDao.deleteImageProduct(p.getProductId());
                imageHandler.deleteFileExist(folder);
                imgList = imageHandler.productImageUploadHandle(parts, p.getProductId());
                p.setImageList(imgList);
                for (ImageProduct img : imgList) {
                    prodDao.insertImageProduct(img);
                }

            } else {
                imgList = prodDao.getImageProduct(p.getProductId());
                p.setImageList(imgList);
            }
            out.print(p);
            request.setAttribute("success", "Update sản phẩm thành công");
            request.getRequestDispatcher("dashboard/add-product-form.jsp").forward(request, response);
        } catch (IOException e) {
            response.getWriter().write("Error: " + e.getMessage());
            request.setAttribute("error", "Update sản phẩm thất bại");
        }catch(Exception e){
            request.setAttribute("error", "Update sản phẩm thất bại");
            request.getRequestDispatcher("dashboard/add-product-form.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession mySession = request.getSession();
        Product p = null;
        try {
            PrintWriter out = response.getWriter();
            int id = Integer.parseInt(request.getParameter("productId"));
            response.getWriter().print(id);
            String productName = request.getParameter("productName");
            String description = request.getParameter("description");
            String category = request.getParameter("category");
            int categoryId = cat.getCategoryByName(category).getCategoryId();
            String supplier = request.getParameter("supplier"); //id
            int supplierId = sup.getSupplierByName(supplier).getSupplierId();
            int unitPrice = Integer.parseInt(request.getParameter("unitPrice"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            boolean isDiscount = "Có".equals(request.getParameter("isDiscount"));
            float discount = Float.parseFloat(request.getParameter("discount"));
            boolean statusProduct = "Đang bán".equals(request.getParameter("status"));
            Date releaseDate = null;
            try {
                releaseDate = dateUtils.converseDateNow(dateUtils.getDateNow());
            } catch (ParseException ex) {
                Logger.getLogger(UpdateProduct.class.getName()).log(Level.SEVERE, null, ex);
            }

            p = new Product(id, supplierId, categoryId, productName, quantity, unitPrice, isDiscount, description, releaseDate, discount, statusProduct);
            prodDao.updateProduct(p);

            ArrayList<ImageProduct> imgList = new ArrayList<>();
            String folder = "prd" + Integer.toString(p.getProductId());
//            out.print(request.getPathInfo());
            out.print(folder);

            Collection<Part> parts = request.getParts();
            out.print(parts);
            if (!parts.isEmpty()) {
                prodDao.deleteImageProduct(p.getProductId());
                imageHandler.deleteFileExist(folder);
                imgList = imageHandler.productImageUploadHandle(parts, p.getProductId());
                p.setImageList(imgList);
                for (ImageProduct img : imgList) {
                    prodDao.insertImageProduct(img);
                }

            } else {
                imgList = prodDao.getImageProduct(p.getProductId());
                p.setImageList(imgList);
            }
//            request.getRequestDispatcher("ProductManagement").forward(request, response);
            
        } catch (IOException e) {
            response.getWriter().write("Error: " + e.getMessage());
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
