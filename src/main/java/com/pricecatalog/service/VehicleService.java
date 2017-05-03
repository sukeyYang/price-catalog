package com.pricecatalog.service;

import java.util.List;
import java.util.Map;

import com.pricecatalog.dao.VehicleDao;
import com.pricecatalog.entity.Vehicle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by sukey on 2016/12/27.
 */
@Service
public class VehicleService {

    @Autowired
    private VehicleDao vehicleDao;

    @Autowired
    private PartsService partsService;

    public List<Vehicle> findAllVehicle() {
        return vehicleDao.findAllVehicle();
    }

    public List<Map<String, String>> findSeries(String brand) {
        return vehicleDao.findSeries(brand);
    }

    public List<Map<String, String>> findVehicleYear(String series) {
        return vehicleDao.findVehicleYear(series);
    }

    public List<Map<String, String>> findEmission(String series, String vehicle_year) {
        return vehicleDao.findEmission(series, vehicle_year);
    }

    public List<Map<String, String>> getTireSize(String series, String vehicle_year) {
        return partsService.getTireSize(series, vehicle_year);
    }

}
