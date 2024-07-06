/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package laptophub.model;

/**
 *
 * @author admin
 */
public class Wallet {
    int walletId;
    User userName;
    int balance;

    public Wallet() {
    }

    public Wallet(User userName) {
        this.userName = userName;
    }
    
    
    public Wallet(int walletId, User userName, int balance) {
        this.walletId = walletId;
        this.userName = userName;
        this.balance = balance;
    }

    public int getWalletId() {
        return walletId;
    }

    public void setWalletId(int walletId) {
        this.walletId = walletId;
    }

    public User getUserName() {
        return userName;
    }

    public void setUserName(User userName) {
        this.userName = userName;
    }

    public int getBalance() {
        return balance;
    }

    public void setBalance(int balance) {
        this.balance = balance;
    }

    @Override
    public String toString() {
        return "Wallet{" + "walletId=" + walletId + ", userName=" + userName + ", balance=" + balance + '}';
    }
    
    
    
}
