package io.renren.modules.sys.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.sys.dao.SysStudentDao;
import io.renren.modules.sys.entity.SysStudentEntity;
import io.renren.modules.sys.service.SysStudentService;


@Service("sysStudentService")
public class SysStudentServiceImpl extends ServiceImpl<SysStudentDao, SysStudentEntity> implements SysStudentService {

    @Autowired
    private SysStudentDao sysStudentDao;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<SysStudentEntity> page = this.page(
                new Query<SysStudentEntity>().getPage(params),
                new QueryWrapper<SysStudentEntity>()
        );
        return new PageUtils(page);
    }

    @Override
    public List<SysStudentEntity> findAll() {
        return sysStudentDao.findAll();
    }
}
