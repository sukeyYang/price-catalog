package com.pricecatalog.entity;

/**
 * Created by sukey on 2016/12/26.
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
@Table(name = "parts_keywords")
public class PartsKeywords {

    @Id
    @Basic(optional = false)
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "type")
    private String type;
    @Column(name = "keywords")
    private String keywords;
    @Column(name = "ambiguous")
    private String ambiguous;

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return this.id;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getType() {
        return this.type;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getKeywords() {
        return this.keywords;
    }

    public String getAmbiguous() {
        return ambiguous;
    }

    public void setAmbiguous(String ambiguous) {
        this.ambiguous = ambiguous;
    }
}
