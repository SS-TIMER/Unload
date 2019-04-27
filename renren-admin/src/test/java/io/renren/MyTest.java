package io.renren;

import io.renren.modules.sys.dao.SysStudentDao;
import io.renren.modules.sys.entity.SysStudentEntity;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Collections;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: skyzc
 * Date: 2019/4/3
 * Time: 10:48
 * To change this template use File | Settings | File Templates.
 * Description:
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class MyTest  {
    @Autowired
    private SysStudentDao sysStudentDao;

    @Test
    public void findAll(){
        List<SysStudentEntity> all = sysStudentDao.findAll();
        System.out.println(Collections.unmodifiableCollection(all));
    }
}