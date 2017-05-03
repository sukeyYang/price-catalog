package com.pricecatalog.service;

import java.util.List;
import java.util.Map;

import com.pricecatalog.common.SearchTemplate;
import com.pricecatalog.dao.PartsKeyWordsDao;
import com.pricecatalog.entity.PartsKeywords;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by sukey on 2016/12/26.
 */
@Service("partsKeywordsService")
@Transactional
public class PartsKeywordsService {

    @Autowired
    private PartsKeyWordsDao partsKeyWordsDao;

    public List<PartsKeywords> findAllPartsKeyword() {
       return partsKeyWordsDao.findAllPartsKeyword();
    }

    public SearchTemplate findKeyWords(Map<String, String> params) {
            return partsKeyWordsDao.findKeyWords(params);
        }
}
