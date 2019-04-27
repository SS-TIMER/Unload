package io.renren.modules.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.sys.dao.SysClassDao;
import io.renren.modules.sys.entity.SysClassEntity;
import io.renren.modules.sys.entity.SysStudentEntity;
import io.renren.modules.sys.service.SysClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: skyzc
 * Date: 2019/3/31
 * Time: 1:45
 * To change this template use File | Settings | File Templates.
 * Description:
 */

@Service("sysClassService")
public class SysClassServiceImpl extends ServiceImpl<SysClassDao, SysClassEntity> implements SysClassService {
    @Autowired
    private SysClassDao sysClassDao;
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<SysClassEntity> page = this.page(
                new Query<SysClassEntity>().getPage(params),
                new QueryWrapper<SysClassEntity>()
        );
        return new PageUtils(page);
    }

    @Override
    public List<SysClassEntity> queryAllClass() {
        return sysClassDao.queryAllClass();
    }
}