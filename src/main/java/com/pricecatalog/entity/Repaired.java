package com.pricecatalog.entity;

import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "repaired")
public class Repaired {

    @Id
    @Basic(optional = false)
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "brand")
    private String brand;
    @Column(name = "series")
    private String series;
    @Column(name = "operation")
    private String operation;
    @Column(name = "frequency")
    private String frequency;
    @Column(name = "mile")
    private Integer mile;
    @Column(name = "month")
    private Integer month;
    @Column(name = "type")
    private String type;
    @Column(name = "parts_type")
    private String parts_type;
    @Column(name = "createtime")
    private Date createtime;

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return this.id;
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

    public void setOperation(String operation) {
        this.operation = operation;
    }

    public String getOperation() {
        return this.operation;
    }

    public void setFrequency(String frequency) {
        this.frequency = frequency;
    }

    public String getFrequency() {
        return this.frequency;
    }

    public void setMile(Integer mile) {
        this.mile = mile;
    }

    public int getMile() {
        return this.mile;
    }

    public void setMonth(Integer month) {
        this.month = month;
    }

    public int getMonth() {
        return this.month;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getType() {
        return this.type;
    }

    public void setPartsType(String parts_type) {
        this.parts_type = parts_type;
    }

    public String getPartsType() {
        return this.parts_type;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getCreatetime() {
        return this.createtime;
    }

}
