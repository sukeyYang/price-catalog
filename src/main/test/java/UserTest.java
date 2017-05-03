import java.text.SimpleDateFormat;
import java.util.*;

import com.pricecatalog.common.SearchTemplate;
import com.pricecatalog.entity.Parts;
import com.pricecatalog.entity.User;
import com.pricecatalog.service.*;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by sukey on 2016/10/27.
 */
public class UserTest {

    private UserService userService;

    private PartsService partsService;

    private DataImport dataImport;

    @Before
    public void before() {
        @SuppressWarnings("resource")
        ApplicationContext context = new ClassPathXmlApplicationContext(new String[] {"spring-mvc.xml"
            , "classpath:spring-common.xml"});
        partsService = (PartsService) context.getBean("partsService");
        dataImport= (DataImport) context.getBean("dataImport");
    }

    @Test
    public void test() {
       //List<Parts> partsList = dataImport.getPartsData("E:\\parts.xls",0);
       Map<String,String> params= new HashMap<String,String>();
        params.put("page", "1");
                    params.put("pageSize", "30");
        SearchTemplate partsList = partsService.findParts(params);
        System.out.print(true);
    }
}
