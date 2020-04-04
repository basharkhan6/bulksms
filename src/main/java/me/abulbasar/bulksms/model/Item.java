/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package me.abulbasar.bulksms.model;

/**
 *
 * @author Bashar
 */
public class Item {
    private Package pack;
    private int qty;

    public Item() {
    }

    public Item(Package pack, int qty) {
        this.pack = pack;
        this.qty = qty;
    }
    
    public Package getPack() {
        return pack;
    }

    public void setPack(Package pack) {
        this.pack = pack;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }
    
}
