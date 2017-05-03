package com.pricecatalog.common;

import java.util.List;
import java.util.Map;

/**
 * Created by sukey on 2016/12/13.
 */
public class RetModel {
    private int page;

    private int total;

    private int records;

    private List<Map<String, Object>> rows;

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getRecords() {
        return records;
    }

    public void setRecords(int records) {
        this.records = records;
    }

    public List<Map<String, Object>> getRows() {
        return rows;
    }

    public void setRows(List<Map<String, Object>> rows) {
        this.rows = rows;
    }
}
