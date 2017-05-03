package com.pricecatalog.controller.sys;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pricecatalog.common.RetModel;
import com.pricecatalog.common.SearchTemplate;
import com.pricecatalog.entity.*;
import com.pricecatalog.service.*;
import com.pricecatalog.utils.UploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

/**
 * Created by sukey on 2016/12/7.
 */
@Controller
@RequestMapping("parts")
public class PartsController extends BaseController {

    @Autowired
    private PartsService partsService;

    @Autowired
    PartsKeywordsService partsKeywordsService;

    @Autowired
    VehicleService vehicleService;

    @Autowired
    DataImport dataImport;


    @RequestMapping("show-parts-list")
    public String showpage(HttpServletRequest request) {
        request.setAttribute("parts", "active");
        return "/jsp/manage/index";
    }


    @RequestMapping("show-parts-tire")
    public String showPartsTire(HttpServletRequest request) {
        request.setAttribute("parts_tire", "active");
        return "/jsp/manage/parts_tire";
    }

    @RequestMapping("parts-oil")
    public String showPartsOil(HttpServletRequest request) {
        request.setAttribute("parts_tire", "active");
        return "/jsp/manage/parts_oil";
    }

    @RequestMapping("list")
    public String listParts(HttpServletRequest request, HttpServletResponse response) {
        String page = request.getParameter("page");
        String pageSize = request.getParameter("rows");
        Map<String, String> params = new HashMap<>();

        String regex = "[0-9]+";
        if (StringUtils.isEmpty(page) || !page.matches(regex)) {
            page = "1";
            pageSize = "30";
            params.put("page", page);
            params.put("pageSize", pageSize);
        } else {
            params.put("page", page);
            params.put("pageSize", pageSize);
        }
        SearchTemplate searchTemplate = partsService.findParts(params);
        request.setAttribute("result", searchTemplate.getResult());
        request.setAttribute("total", searchTemplate.getValues());
        request.setAttribute("currentPage", page);
        return "/jsp/manage/parts_list";
    }

    @RequestMapping(value = "parts-list", method = RequestMethod.POST)
    @ResponseBody
    public RetModel getList(HttpServletRequest request, HttpServletResponse response) {
        String page = request.getParameter("page");
        String pageSize = request.getParameter("rows");

        String partType = request.getParameter("partsType");

        String partId = request.getParameter("partsId");

        String carBrand = request.getParameter("carBrand");

        String carSeries = request.getParameter("carSeries");
        Map<String, String> params = new HashMap<>();

        if (!StringUtils.isEmpty(partType)) {
            params.put("type", partType);

        }
        if (!StringUtils.isEmpty(carBrand)) {
            params.put("brand", carBrand);

        }

        if (!StringUtils.isEmpty(partId)) {
            params.put("partsId", partId);

        }

        if (!StringUtils.isEmpty(carSeries)) {
            params.put("series", carSeries);
            request.setAttribute("series", carSeries);
        }

        String regex = "[0-9]+";
        if (StringUtils.isEmpty(page) || !page.matches(regex)) {
            page = "1";
            pageSize = "30";
            params.put("page", page);
            params.put("pageSize", pageSize);
        } else {
            params.put("page", page);
            params.put("pageSize", pageSize);
        }
        if (StringUtils.isEmpty(pageSize) || !pageSize.matches(regex)) {
            pageSize = "30";
            params.put("pageSize", pageSize);
        } else {
            params.put("pageSize", pageSize);
        }
        SearchTemplate searchTemplate = partsService.findParts(params);
        RetModel retModel = new RetModel();
        retModel.setRows(searchTemplate.getValues());
        retModel.setRecords(searchTemplate.getCount());
        retModel.setPage(Integer.parseInt(page));
        int mod = searchTemplate.getCount() % Integer.parseInt(pageSize);
        retModel.setTotal(mod == 0 ? searchTemplate.getCount() / Integer.parseInt(pageSize) : (searchTemplate.getCount() / Integer.parseInt(pageSize) + 1));
        return retModel;
    }

    @RequestMapping(value = "parts-tire-list", method = RequestMethod.POST)
    @ResponseBody
    public RetModel getPartsTireList(HttpServletRequest request, HttpServletResponse response) {
        String page = request.getParameter("page");
        String pageSize = request.getParameter("rows");

        String partId = request.getParameter("partsId");

        String carBrand = request.getParameter("carBrand");

        String carSeries = request.getParameter("carSeries");
        Map<String, String> params = new HashMap<>();

        if (!StringUtils.isEmpty(carBrand)) {
            params.put("brand", carBrand);
        }
        if (!StringUtils.isEmpty(partId)) {
            params.put("partId", partId);
        }

        if (!StringUtils.isEmpty(carSeries)) {
            params.put("series", carSeries);
            request.setAttribute("series", carSeries);
        }

        String regex = "[0-9]+";
        if (StringUtils.isEmpty(page) || !page.matches(regex)) {
            page = "1";
            pageSize = "30";
            params.put("page", page);
            params.put("pageSize", pageSize);
        } else {
            params.put("page", page);
            params.put("pageSize", pageSize);
        }
        if (StringUtils.isEmpty(pageSize) || !pageSize.matches(regex)) {
            pageSize = "30";
            params.put("pageSize", pageSize);
        } else {
            params.put("pageSize", pageSize);
        }
        SearchTemplate searchTemplate = partsService.findTire(params);
        RetModel retModel = new RetModel();
        retModel.setRows(searchTemplate.getValues());
        retModel.setRecords(searchTemplate.getCount());
        retModel.setPage(Integer.parseInt(page));
        int mod = searchTemplate.getCount() % Integer.parseInt(pageSize);
        retModel.setTotal(mod == 0 ? searchTemplate.getCount() / Integer.parseInt(pageSize) : (searchTemplate.getCount() / Integer.parseInt(pageSize) + 1));
        return retModel;
    }

    @RequestMapping(value = "parts-oil-list", method = RequestMethod.POST)
    @ResponseBody
    public RetModel getPartsOilList(HttpServletRequest request, HttpServletResponse response) {
        String page = request.getParameter("page");
        String pageSize = request.getParameter("rows");

        String partId = request.getParameter("partsId");

        String partType = request.getParameter("partsType");


        Map<String, String> params = new HashMap<>();

        if (!StringUtils.isEmpty(partType)) {
            params.put("type", partType);

        }

        if (!StringUtils.isEmpty(partId)) {
            params.put("partsId", partId);

        }


        String regex = "[0-9]+";
        if (StringUtils.isEmpty(page) || !page.matches(regex)) {
            page = "1";
            pageSize = "30";
            params.put("page", page);
            params.put("pageSize", pageSize);
        } else {
            params.put("page", page);
            params.put("pageSize", pageSize);
        }
        if (StringUtils.isEmpty(pageSize) || !pageSize.matches(regex)) {
            pageSize = "30";
            params.put("pageSize", pageSize);
        } else {
            params.put("pageSize", pageSize);
        }
        SearchTemplate searchTemplate = partsService.findOilParts(params);
        RetModel retModel = new RetModel();
        retModel.setRows(searchTemplate.getValues());
        retModel.setRecords(searchTemplate.getCount());
        retModel.setPage(Integer.parseInt(page));
        int mod = searchTemplate.getCount() % Integer.parseInt(pageSize);
        retModel.setTotal(mod == 0 ? searchTemplate.getCount() / Integer.parseInt(pageSize) : (searchTemplate.getCount() / Integer.parseInt(pageSize) + 1));
        return retModel;
    }


    @RequestMapping("download")
    public void download(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String fileName = "template.xls";
        // 当前文件路径
        String nowPath = request.getSession().getServletContext().getRealPath(
            "/")
            + "static/template" + "/" + fileName;
        response.setContentType("application/vnd.ms-excel");
        File file = new File(nowPath);

        // 清空response
        response.reset();

        // 设置response的Header
        response.addHeader("Content-Disposition", "attachment;filename="
            + new String(fileName.getBytes("gbk"), "iso-8859-1")); // 转码之后下载的文件不会出现中文乱码
        response.addHeader("Content-Length", "" + file.length());

        try {
            // 以流的形式下载文件
            InputStream fis = new BufferedInputStream(new FileInputStream(
                nowPath));
            byte[] buffer = new byte[fis.available()];
            fis.read(buffer);
            fis.close();

            OutputStream toClient = new BufferedOutputStream(response
                .getOutputStream());
            toClient.write(buffer);
            toClient.flush();
            toClient.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/fileupload", method = RequestMethod.POST)
    public void upload(HttpServletRequest request, HttpServletResponse response) {

        String file_save_path = "/static/upload";
        String file_id = "file";
        Date date = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
        String filesavename = df.format(date);
        String file_path = UploadUtil.uploadFile(request, file_save_path, file_id, filesavename);
        DataImport importData = new DataImport();
        List<PartsKeywords> partsKeywordsList = partsKeywordsService.findAllPartsKeyword();
        List<Vehicle> vehicleList = vehicleService.findAllVehicle();
        Map<String, List<PartsTrie>> map = importData.getPartsData(file_path, 0, partsKeywordsList, vehicleList);
        partsService.savePartsTrie(map.get("parts"));
        //List<Parts> partsList = map.get("partsAttached");
        // List<PartsAttached> partsAttachedList = new ArrayList<>();
//        for (int i=0;i<partsList.size();i++){
//            partsAttachedList.add(new PartsAttached(partsList.get(i)));
//        }
        // partsService.savePartsAttached(partsAttachedList);
    }


}
