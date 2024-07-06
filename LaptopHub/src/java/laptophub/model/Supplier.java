/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package laptophub.model;

/**
 *
 * @author admin
 */
public class Supplier {
    private int supplierId;
    private String companyName;
    private String homePage;
    private String country;
    private String imgLogo;

    public Supplier(int supplierId, String companyName, String homePage, String country, String imgLogo) {
        this.supplierId = supplierId;
        this.companyName = companyName;
        this.homePage = homePage;
        this.country = country;
        this.imgLogo = imgLogo;
    }

    
    public int getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(int supplierId) {
        this.supplierId = supplierId;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getHomePage() {
        return homePage;
    }

    public void setHomePage(String homePage) {
        this.homePage = homePage;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getImgLogo() {
        return imgLogo;
    }

    public void setImgLogo(String imgLogo) {
        this.imgLogo = imgLogo;
    }

    @Override
    public String toString() {
        return "Supplier{" + "supplierId=" + supplierId + ", companyName=" + companyName + ", homePage=" + homePage + ", country=" + country + ", imgLogo=" + imgLogo + '}';
    }
    
    
    
}
