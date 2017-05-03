package com.pricecatalog.entity;

/**
 * Created by sukey on 2016/12/27.
 */

import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "vehicle")
public class Vehicle {

    @Id
    @Basic(optional = false)
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "book")
    private String book;
    @Column(name = "market_division")
    private String marketdivision;
    @Column(name = "series")
    private String series;
    @Column(name = "vehicle_year")
    private String vehicle_year;

    @Column(name = "vehicle")
    private String vehiclename;
    @Column(name = "brand")
    private String brand;

    @Column(name = "emission")
    private String emission;
    @Column(name = "seriescode")
    private String seriescode;

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return this.id;
    }

    public void setBook(String book) {
        this.book = book;
    }

    public String getBook() {
        return this.book;
    }

    public void setMarketdivision(String marketdivision) {
        this.marketdivision = marketdivision;
    }

    public String getMarketdivision() {
        return this.marketdivision;
    }

    public void setSeries(String series) {
        this.series = series;
    }

    public String getSeries() {
        return this.series;
    }

    public String getVehicle_year() {
        return vehicle_year;
    }

    public void setVehicle_year(String vehicle_year) {
        this.vehicle_year = vehicle_year;
    }

    public String getVehiclename() {
        return vehiclename;
    }

    public void setVehiclename(String vehiclename) {
        this.vehiclename = vehiclename;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getEmission() {
        return emission;
    }

    public void setEmission(String emission) {
        this.emission = emission;
    }

    public String getSeriescode() {
        return seriescode;
    }

    public void setSeriescode(String seriescode) {
        this.seriescode = seriescode;
    }
}
