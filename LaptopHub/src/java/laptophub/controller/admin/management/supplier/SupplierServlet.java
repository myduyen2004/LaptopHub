/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package laptophub.controller.admin.management.supplier;

import java.nio.file.Paths;
import java.io.File;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import laptophub.dal.SupplierDAO;
import laptophub.model.Supplier;

@WebServlet(name = "SupplierServlet", urlPatterns = {"/supplier"})
@MultipartConfig
public class SupplierServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String IMAGE_DIR = "./images/suppliers";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }
        switch (action) {
            case "delete":
                deleteSupplier(request, response);
                break;
            default:
                listSuppliers(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "add":
                addSupplier(request, response);
                break;
            case "edit":
                updateSupplier(request, response);
                break;
            default:
                listSuppliers(request, response);
                break;
        }
    }

    private void listSuppliers(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SupplierDAO supplierDAO = new SupplierDAO();
        request.setAttribute("suppliers", supplierDAO.getAllSupplier());
        request.getRequestDispatcher("/dashboard/supplier.jsp").forward(request, response);
    }

    private void addSupplier(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String companyName = request.getParameter("companyName");
        String homePage = request.getParameter("homePage");
        String country = request.getParameter("country");
        Part filePart = request.getPart("imgLogo");

        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uploadPath = getServletContext().getRealPath("") + File.separator + IMAGE_DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            filePart.write(uploadPath + File.separator + fileName);

            Supplier newSupplier = new Supplier(companyName, homePage, country, IMAGE_DIR + "/" + fileName);
            SupplierDAO supplierDAO = new SupplierDAO();
            supplierDAO.addSupplier(newSupplier);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Logo image is required.");
        }

        response.sendRedirect("SupplierServlet?action=list");
    }

    private void updateSupplier(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String companyName = request.getParameter("companyName");
    String newCompanyName = request.getParameter("newCompanyName");
    String homePage = request.getParameter("homePage");
    String country = request.getParameter("country");
    Part filePart = request.getPart("imgLogo");

    SupplierDAO supplierDAO = new SupplierDAO();
    Supplier supplier = supplierDAO.getSupplierByName(companyName);
    
    if (supplier != null) {
        supplier.setCompanyName(newCompanyName != null && !newCompanyName.isEmpty() ? newCompanyName : companyName);
        supplier.setHomePage(homePage);
        supplier.setCountry(country);

        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uploadPath = getServletContext().getRealPath("") + File.separator + IMAGE_DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            filePart.write(uploadPath + File.separator + fileName);
            supplier.setImgLogo(IMAGE_DIR + "/" + fileName);
        }
        supplierDAO.updateSupplier(supplier);
    }

    response.sendRedirect("SupplierServlet?action=list");
}


    private void deleteSupplier(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        SupplierDAO supplierDAO = new SupplierDAO();
        supplierDAO.deleteSupplierById(id);
        response.sendRedirect("SupplierServlet?action=list");
    }

    @Override
    public String getServletInfo() {
        return "Supplier management servlet";
    }
}