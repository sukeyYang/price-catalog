package com.pricecatalog.service;

import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.pricecatalog.entity.*;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class DataImport {


    /**
     * Import data from excel file
     *
     * @param filePath excel file path
     *
     * @return
     */
    public Map<String, List<PartsTrie>> getPartsData(String filePath, int sheet_id, List<PartsKeywords> partsKeywordsList, List<Vehicle> vehicleList) {
        ArrayList<PartsTrie> list = new ArrayList();
        Set<String> set = new HashSet();
        Map<String, String> partsChainNext = new HashMap<>();
        Map<String, String> partsChainPre = new HashMap<>();
        Map<String, List<PartsTrie>> result = new HashMap<>();
        FileInputStream fis = null;

        try {
            File file = new File(filePath);
            fis = new FileInputStream(file);

            Workbook book = Workbook.getWorkbook(fis);
            Sheet sheet = book.getSheet(sheet_id);

            int columns = sheet.getColumns();
            int rows = sheet.getRows();
            int realrows = 0;
            for (int i = 1; i < rows; i++) {
                String bookCode = StringUtils.trimToEmpty(sheet.getCell(5, i).getContents());
                String division = StringUtils.trimToEmpty(sheet.getCell(11, i).getContents());
                String series = StringUtils.trimToEmpty(sheet.getCell(7, i).getContents());
                //String newParts = StringUtils.trimToEmpty(sheet.getCell(17, i).getContents()).trim();
                String partsId = StringUtils.trimToEmpty(sheet.getCell(0, i).getContents());
                String name_en = StringUtils.trimToEmpty(sheet.getCell(2, i).getContents());
                String name = StringUtils.trimToEmpty(sheet.getCell(3, i).getContents());
                //String stock = StringUtils.trimToEmpty(sheet.getCell(18, i).getContents());
               // String flag = StringUtils.trimToEmpty(sheet.getCell(1, i).getContents());
                String firstYear = StringUtils.trimToEmpty(sheet.getCell(8, i).getContents());
                String lastYear = StringUtils.trimToEmpty(sheet.getCell(9, i).getContents());
                String supplier = StringUtils.trimToEmpty(sheet.getCell(14, i).getContents());
                String size = StringUtils.trimToEmpty(sheet.getCell(15, i).getContents());
                String price = StringUtils.trimToEmpty(sheet.getCell(10, i).getContents());
//                if (!StringUtils.isEmpty(newParts)) {
//                    partsChainNext.put(partsId, newParts);
//                    if (partsChainPre.containsKey(newParts)) {
//                        String newValue = partsId + "-" + partsChainPre.get(newParts);
//                        partsChainPre.put(newParts, newValue);
//                    } else {
//                        partsChainPre.put(newParts, partsId);
//                    }
//
//                }
//                if (bookCode.equals("99") || ((!"A".equals(flag) && !"C".equals(flag)))) {
//                    continue;
//                }
//                String type = matchKeyWords(partsKeywordsList, StringUtils.trimToEmpty(sheet.getCell(3, i).getContents()));
//                if ("".equals(type)) {
//                    Parts parts = new Parts();
//                    parts.setPartsid(partsId);
//                    parts.setName_en(name_en);
//                    parts.setName(name);
//                    parts.setNewpart(newParts);
//                    parts.setStock(stock);
//
//                    parts.setBrand(bookCode);
//                    parts.setSeries(series);
//                    parts.setVehicleYearMin(division);
//                    parts.setVehicleYearMax("Type can not match");
//                    list.add(parts);
//                    continue;
//                }
                if (StringUtils.isEmpty(bookCode) || StringUtils.isEmpty(division) || StringUtils.isEmpty(series)
                    || StringUtils.isEmpty(firstYear) || StringUtils.isEmpty(lastYear)) {

                    PartsTrie parts = new PartsTrie();
                    parts.setPartsid(partsId);
                    parts.setName_en(name_en);
                    parts.setName(name);
//                    parts.setNewpart(newParts);
//                    parts.setStock(stock);

                    parts.setBrand(bookCode);
                    parts.setSeries(series);
                    parts.setType("轮胎");
                    parts.setVehicle(division);
                    parts.setVehicleYear("false");
                    parts.setFirstYear(firstYear);
                    parts.setLastYear(lastYear);
                    parts.setSupplier(supplier);
                    list.add(parts);
                    continue;
                }
                int first_year = Integer.parseInt(firstYear);
                int last_year = Integer.parseInt(lastYear);
                List<Vehicle> matchVehicle = matchBrand(vehicleList, bookCode, division, series, first_year, last_year);
                if (matchVehicle.isEmpty()) {
                    PartsTrie parts = new PartsTrie();
                    parts.setPartsid(partsId);
                    parts.setName_en(name_en);
                    parts.setName(name);
//                    parts.setNewpart(newParts);
//                    parts.setStock(stock);
                    parts.setBrand(bookCode);
                    parts.setSeries(series);
                    parts.setVehicle(division);
                    parts.setVehicleYear("Brand Series can not match");
                    parts.setType("轮胎");
                    parts.setFirstYear(firstYear);
                    parts.setLastYear(lastYear);
                    parts.setSupplier(supplier);
                    parts.setPrice(price);
                    list.add(parts);

                    continue;
                }

                for (Vehicle vehicle : matchVehicle) {
                    PartsTrie parts = new PartsTrie();
                    parts.setPartsid(partsId);
                    parts.setName_en(name_en);
                    parts.setName(name);
//                    parts.setNewpart(newParts);
//                    parts.setStock(stock);
//                    parts.setType(type);
                    parts.setType("轮胎");
                    parts.setBrand(vehicle.getBrand());
                    parts.setSeries(vehicle.getSeries());
                    parts.setVehicle(vehicle.getVehiclename());
                    parts.setVehicleYear(vehicle.getVehicle_year());
                    parts.setEmission(vehicle.getEmission());
                    parts.setFirstYear(firstYear);
                    parts.setLastYear(lastYear);
                    parts.setSupplier(supplier);
                    parts.setPrice(price);
                    parts.setChain(size);
                    list.add(parts);
                }


            }

//            List<Parts> partsAttachedList = new ArrayList<>();
//            Iterator<Parts> it = list.iterator();
//            while (it.hasNext()) {
//
//                Parts parts = it.next();
//
//                String finalPartid = parts.getPartsid();
//
//                String chain = finalPartid;
//
//                while (true) {
//                    if (partsChainNext.containsKey(finalPartid)) {
//                        finalPartid = partsChainNext.get(finalPartid);
//                        chain += "——" + finalPartid;
//                    } else {
//                        break;
//                    }
//
//                }
//                chain = findChain(partsChainPre, parts.getPartsid(), chain);
//
//
//                parts.setChain(chain);
//                try {
//                    if (!finalPartid.equals(parts.getPartsid())) {
//                        partsAttachedList.add(parts);
//                        it.remove();
//                    }
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//
//
//            }
            result.put("parts", list);
//            result.put("partsAttached", partsAttachedList);

        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (BiffException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            if (fis != null) {
                try {
                    fis.close();
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
        }

        return result;
    }

    public String findChain(Map<String, String> nodeMap, String keys, String subChain) {
        String chain = "";
        if (keys.contains("-")) {
            for (String key : keys.split("-")) {
                String tempChain = subChain;
                String firstPartid = key;
                while (true) {
                    if (firstPartid.contains("-")) {
                        chain += findChain(nodeMap, firstPartid, tempChain);
                        break;
                    } else {
                        tempChain = firstPartid + "——" + tempChain;
                        if (nodeMap.containsKey(firstPartid)) {
                            firstPartid = nodeMap.get(firstPartid);
                        } else {
                            chain += "//" + tempChain;
                            break;
                        }
                    }
                }
            }
        } else {
            String tempChain = subChain;
            String firstPartid = keys;
            while (true) {

                if (firstPartid.contains("-")) {
                    chain += findChain(nodeMap, firstPartid, tempChain);
                    break;
                } else {
                    if (nodeMap.containsKey(firstPartid)) {

                        firstPartid = nodeMap.get(firstPartid);
                        if (firstPartid.contains("-")) {
                            continue;
                        }
                        tempChain = firstPartid + "——" + tempChain;
                    } else {
                        chain += tempChain;
                        break;
                    }
                }

            }

        }
        return chain;
    }

    /**
     * Import data from excel file
     *
     * @param filePath excel file path
     *
     * @return
     */
    public List<Repaired> getRepairedData(String filePath, int sheet_id) {
        ArrayList<Repaired> list = new ArrayList();
        FileInputStream fis = null;

        try {
            File file = new File(filePath);
            fis = new FileInputStream(file);

            Workbook book = Workbook.getWorkbook(fis);
            Sheet sheet = book.getSheet(sheet_id);

            int columns = sheet.getColumns();
            int rows = sheet.getRows();
            int realrows = 0;
            for (int i = 1; i < rows; i++) {
                Repaired repaired = new Repaired();
                repaired.setBrand(StringUtils.trimToEmpty(sheet.getCell(0, i).getContents()));
                repaired.setSeries(StringUtils.trimToEmpty(sheet.getCell(1, i).getContents()));
                repaired.setOperation(StringUtils.trimToEmpty(sheet.getCell(2, i).getContents()));
                repaired.setFrequency(StringUtils.trimToEmpty(sheet.getCell(3, i).getContents()));
                if (!StringUtils.isEmpty(sheet.getCell(4, i).getContents())) {
                    repaired.setMile(Integer.parseInt(StringUtils.trimToEmpty(sheet.getCell(4, i).getContents())));
                }
                if (!StringUtils.isEmpty(sheet.getCell(5, i).getContents())) {
                    repaired.setMile(Integer.parseInt(StringUtils.trimToEmpty(sheet.getCell(5, i).getContents())));
                }
                repaired.setType(StringUtils.trimToEmpty(sheet.getCell(6, i).getContents()));
                repaired.setPartsType(StringUtils.trimToEmpty(sheet.getCell(7, i).getContents()));

                list.add(repaired);
            }


        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (BiffException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            if (fis != null) {
                try {
                    fis.close();
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
        }

        return list;
    }

    public String matchKeyWords(List<PartsKeywords> partsKeywordsList, String input) {
        String type = "";
        for (PartsKeywords partsKeywords : partsKeywordsList) {
            Pattern p = Pattern.compile(partsKeywords.getKeywords());
            Matcher m = p.matcher(input);
            if (m.find()) {
                type = partsKeywords.getType();
                if (!StringUtils.isEmpty(partsKeywords.getAmbiguous().trim())) {
                    String[] ambiguousWords = partsKeywords.getAmbiguous().trim().split(" ");
                    for (String word : ambiguousWords) {
                        if (matchString(word, input)) {
                            type = "";
                            break;
                        }
                    }
                    if (!"".equals(type)) {
                        //如果未匹配到歧义词则跳出循环，表示分类已匹配
                        break;
                    }

                } else {//如果没有歧义词
                    break;
                }

            }
        }
        return type;
    }

    public List<Vehicle> matchBrand(List<Vehicle> vehicleList, String book, String division, String seriesStr, int firstYear, int lastYear) {
        List<Vehicle> matchVehicle = new ArrayList<>();
        String[] divisions;
        String[] series;
        String[] books;
        if (division.indexOf(",") > 0) {
            divisions = division.split(",");
        } else {
            divisions = new String[] {division};
        }
        if (book.indexOf(",") > 0) {
            books = book.split(",");
        } else {
            books = new String[] {book};
        }

        for (Vehicle vehicle : vehicleList) {
            int vehicleYear = Integer.parseInt(vehicle.getVehicle_year());
            if (vehicleYear < firstYear || vehicleYear > lastYear)
                continue;
            for (String bk : books) {
                if (bk.trim().equals(vehicle.getBook().trim())) {
                    for (String dv : divisions) {
                        if (dv.trim().equals(vehicle.getMarketdivision())) {
                            series = vehicle.getSeriescode().split(" ");
                            for (String seri : series) {
                                if (matchString(seri, seriesStr)) {
                                    matchVehicle.add(vehicle);
                                    break;
                                }
                            }
                            break;
                        }
                    }
                    break;
                }
            }
        }
        return matchVehicle;
    }

    public boolean matchString(String regex, String input) {
        Pattern p = Pattern.compile(regex);
        Matcher m = p.matcher(input);
        return m.find();
    }

    public static void main(String[] args) {

//        List<PartsKeywords> partsKeywordsList = new ArrayList<>();
//        PartsKeywords partsKeywords = new PartsKeywords();
//        partsKeywords.setType("机油");
//        partsKeywords.setAmbiguous("加注 冷却器 管 标签 传感器 添加物 开关 塞 油漆 泵 刮刀 阀 滤清器 节流器 指示器 密封 封件 油槽 喷嘴 螺母 螺栓 维修 箱 导流 壳 压缩机 添加剂 差速器");
//        partsKeywords.setKeywords("机油");
//        partsKeywordsList.add(partsKeywords);
        DataImport dataImport = new DataImport();
//        String type = dataImport.matchKeyWords(partsKeywordsList, "机油滤清器 (PF48)");
////        DataImport dataImport = new DataImport();
////        boolean result = dataImport.matchString("皮带轮", "动力转向泵皮带轮");
//        System.out.print(type);
//        Parts parts = new Parts();
//        parts.setPartsid("1234");
//        PartsAttached partsAttached = new PartsAttached();
//        PartsAttached partsAttached2 = new PartsAttached(parts);

        Map<String, String> map = new HashMap<>();
        map.put("23389666", "945146812");
        map.put("945146812", "9453146822");
        map.put("9453146822", "3146822");


        map.put("23389667", "94514689-23436604");
        map.put("94514689", "42389701");
        map.put("42389701", "84055395");
        map.put("84055395", "84089233");
        map.put("23436604", "84031684");
        map.put("84031684", "23410088");
        map.put("23410088", "23412348");

        String chain = dataImport.findChain(map, "23389667", "12345——98765");
        System.out.println(chain);

    }


}
