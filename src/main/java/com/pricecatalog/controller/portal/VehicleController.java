package com.pricecatalog.controller.portal;

import java.util.List;
import java.util.Map;

import com.pricecatalog.service.VehicleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * Created by sukey on 2017/2/16.
 */
@Controller
@RequestMapping("vehicle")
public class VehicleController {

    @Autowired
    private VehicleService vehicleService;


    @RequestMapping(value = "series")
    @ResponseBody
    public List<Map<String, String>> getVehicle(String brand) {
        return vehicleService.findSeries(brand);
    }

    @RequestMapping(value = "vehicleYear")
    @ResponseBody
    public List<Map<String, String>> getvehicleYear(String series) {
        return vehicleService.findVehicleYear(series);
    }

    @RequestMapping(value = "emission")
    @ResponseBody
    public List<Map<String, String>> getEmission(String series, String vehicleYear) {
        return vehicleService.findEmission(series, vehicleYear);
    }

    @RequestMapping(value = "trieSize")
    @ResponseBody
    public List<Map<String, String>> getTrieSize(String series, String vehicleYear) {
        return vehicleService.getTireSize(series, vehicleYear);
    }

}
