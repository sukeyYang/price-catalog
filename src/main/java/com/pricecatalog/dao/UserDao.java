package com.pricecatalog.dao;

import com.pricecatalog.common.BaseDao;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

/**
 * Created by sukey on 2016/10/27.
 */
@Repository
@Qualifier("userDao")
public class UserDao extends BaseDao {



}
