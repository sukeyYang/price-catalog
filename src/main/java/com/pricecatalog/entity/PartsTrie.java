package com.pricecatalog.entity;

/**
 * Created by sukey on 2016/12/2.
 */

import javax.persistence.*;

@Entity
@Table(name = "parts_trie")
public class PartsTrie {

    @Id
    @Basic(optional = false)
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "partsid")
    private String partsid;
    @Column(name = "name")
    private String name;
    @Column(name = "name_en")
    private String name_en;
    @Column(name = "type")
    private String type;
    @Column(name = "stock")
    private String stock;
    @Column(name = "newpart")
    private String newpart;
    @Column(name = "brand")
    private String brand;
    @Column(name = "series")
    private String series;
    @Column(name = "price")
    private String price;

    @Column(name = "vehicle")
    private String vehicle;

    @Column(name = "size")
    private String size;

    @Column(name = "vehicle_year")
    private String vehicleYear;

    @Column(name = "emission")
    private String emission;

    @Column(name = "first_year")
    private String firstYear;

    @Column(name = "last_year")
    private String lastYear;

    @Column(name = "supplier")
    private String supplier;

    @Column(name = "ptype")
    private String ptype;


    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return this.id;
    }

    public void setPartsid(String partsid) {
        this.partsid = partsid;
    }

    public String getPartsid() {
        return this.partsid;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return this.name;
    }

    public void setName_en(String name_en) {
        this.name_en = name_en;
    }

    public String getName_en() {
        return this.name_en;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getType() {
        return this.type;
    }

    public void setStock(String stock) {
        this.stock = stock;
    }

    public String getStock() {
        return this.stock;
    }

    public void setNewpart(String newpart) {
        this.newpart = newpart;
    }

    public String getNewpart() {
        return this.newpart;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getBrand() {
        return this.brand;
    }

    public void setSeries(String series) {
        this.series = series;
    }

    public String getSeries() {
        return this.series;
    }

    public String getPrice() {

        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getSize() {
        return size;
    }


    public void setChain(String chain) {
        this.size = chain;
    }

    public String getVehicleYear() {
        return vehicleYear;
    }

    public void setVehicleYear(String vehicleYear) {
        this.vehicleYear = vehicleYear;
    }

    public String getVehicle() {
        return vehicle;
    }

    public void setVehicle(String vehicle) {
        this.vehicle = vehicle;
    }

    public String getEmission() {
        return emission;
    }

    public void setEmission(String emission) {
        this.emission = emission;
    }

    public String getFirstYear() {
        return firstYear;
    }

    public void setFirstYear(String firstYear) {
        this.firstYear = firstYear;
    }

    public String getLastYear() {
        return lastYear;
    }

    public void setLastYear(String lastYear) {
        this.lastYear = lastYear;
    }

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    public void setSize(String size) {
        this.size = size;
    }
}
