package com.pricecatalog.controller.sys;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pricecatalog.common.RetModel;
import com.pricecatalog.common.SearchTemplate;
import com.pricecatalog.entity.Parts;
import com.pricecatalog.entity.Repaired;
import com.pricecatalog.service.DataImport;
import com.pricecatalog.service.RepairService;
import com.pricecatalog.utils.UploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

/**
 * Created by sukey on 2016/12/20.
 */
@Controller
@RequestMapping("repaired")
public class RepairedController {

    @Autowired
    private RepairService repairService;

    @RequestMapping("show-list")
    public String required(HttpServletRequest request) {
        request.setAttribute("repair", "active");
        return "/jsp/manage/repairedlist";
    }

    @RequestMapping(value="list",method = RequestMethod.POST)
    @ResponseBody
    public RetModel getList(HttpServletRequest request, HttpServletResponse response) {
        String page = request.getParameter("page");
        String pageSize = request.getParameter("rows");

        String series = request.getParameter("series");
        String mile = request.getParameter("mile");
        String time = request.getParameter("time");


        Map<String, String> params = new HashMap<>();
        if (!StringUtils.isEmpty(series)) {
            params.put("series",series);
        }
        if (!StringUtils.isEmpty(mile)) {
            params.put("mile",mile);
        }
        if (!StringUtils.isEmpty(time)) {
            params.put("time",time);
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
        SearchTemplate searchTemplate = repairService.findParts(params);
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

        String fileName = "MaintainBookTemplate.xls";
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
        String filesavename = "maintain" + df.format(date);
        String file_path = UploadUtil.uploadFile(request, file_save_path, file_id, filesavename);
        DataImport importData = new DataImport();
        List<Repaired> list = importData.getRepairedData(file_path, 0);
        repairService.save(list);
    }

}
