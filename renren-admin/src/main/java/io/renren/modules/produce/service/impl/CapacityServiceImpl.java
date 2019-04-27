package io.renren.modules.produce.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.produce.dao.CapacityDao;
import io.renren.modules.produce.entity.CapacityEntity;
import io.renren.modules.produce.service.CapacityService;


@Service("capacityService")
public class CapacityServiceImpl extends ServiceImpl<CapacityDao, CapacityEntity> implements CapacityService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<CapacityEntity> page = this.page(
                new Query<CapacityEntity>().getPage(params),
                new QueryWrapper<CapacityEntity>()
        );

        return new PageUtils(page);
    }

}
