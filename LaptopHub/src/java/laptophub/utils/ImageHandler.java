/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package laptophub.utils;

import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collection;
import laptophub.dal.ProductDAO;
import laptophub.model.ImageProduct;

/**
 *
 * @author admin
 */
public class ImageHandler {

    public ImageHandler() {
    }
    ProductDAO product = new ProductDAO();

    public ArrayList<ImageProduct> productImageUploadHandle(Collection<Part> parts, int id) throws IOException {
        String url = null;
        String baseUploadPath = "D:/Final PRJ/LaptopHub/web/images/products/";
        String uniqueFolderName = "prd" + Integer.toString(id);
        File uploadDir = new File(baseUploadPath + uniqueFolderName);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        int count = 0;
        ArrayList<ImageProduct> imageList = new ArrayList<>();
        for (Part part : parts) {
            if (part.getSubmittedFileName() != null && !part.getSubmittedFileName().isEmpty()) {
                String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                part.write(uploadDir.getAbsolutePath() + File.separator + fileName);
                ImageProduct image = null;
                url = "images/products/" + uniqueFolderName + "/" + fileName;
                int productId = id;
                switch (count) {
                    case 0:
                        image = new ImageProduct(productId, url, "Thông tin tổng quát");
                        imageList.add(image);
                        break;
                    case 1:
                        image = new ImageProduct(productId, url, "Mặt trước");
                        imageList.add(image);
                        break;
                    case 2:
                        image = new ImageProduct(productId, url, "Bên phải");
                        imageList.add(image);
                        break;
                    case 3:
                        image = new ImageProduct(productId, url, "Bên trái");
                        imageList.add(image);
                        break;
                    case 4:
                        image = new ImageProduct(productId, url, "Mặt sau");
                        imageList.add(image);
                        break;
                    default:
                        break;
                }
                count++;
            }
        }
        return imageList;

    }
//    public String avatarUploadHandle(Collection<Part> parts, String userId) throws IOException {
//        String url = null;
//        String baseUploadPath = "D:/Project/LaptopHubWeb/web/images/products/";
//        String uniqueFolderName = "avatar_" + userId;
//        File uploadDir = new File(baseUploadPath + uniqueFolderName);
//        if (!uploadDir.exists()) {
//            uploadDir.mkdirs();
//        }
//        
//        for (Part part : parts) {
//            if (part.getSubmittedFileName() != null && !part.getSubmittedFileName().isEmpty()) {
//
//                String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
//                part.write(uploadDir.getAbsolutePath() + File.separator + fileName);
//                ImageProduct image = null;
//                url = "images/avatar/" + uniqueFolderName + "/" + fileName;
//                image = new ImageProduct(url);
//            }
//        }
//        return url;
//
//    }
    public ArrayList<ImageProduct> uploadProductImage(Collection<Part> parts, String folder, int id) 
            throws IOException{
        //delete old file
        deleteFileExist(folder);
        
        //tạo file tương ứng vào folder
        ArrayList<ImageProduct> imageList = new ArrayList<>();
        imageList = productImageUploadHandle(parts, id);
        return imageList;
    }
    
    public void deleteFileExist(String folder){
        String baseUploadPath = "D:/Project/LaptopHubWeb/web/images/products/";

        String directoryPath = baseUploadPath+folder; // Đường dẫn tới thư mục

        File directory = new File(directoryPath);

        if (!directory.exists() || !directory.isDirectory()) {
            System.out.println("Thư mục không tồn tại hoặc không phải là thư mục.");
            return;
        }
        File[] files = directory.listFiles();
        if (files != null) {
            for (File file : files) {
                if (file.isFile()) {
                    boolean deleted = file.delete();
                    if (deleted) {
                        System.out.println("Đã xóa file: " + file.getName());
                    } else {
                        System.out.println("Không thể xóa file: " + file.getName());
                    }
                }
            }
        }
    }
    public static void main(String[] args) {
        ImageHandler img = new ImageHandler();
        img.deleteFileExist("prd39");
    }
}
