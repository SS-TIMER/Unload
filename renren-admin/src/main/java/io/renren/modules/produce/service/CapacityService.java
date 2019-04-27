package io.renren.modules.produce.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.produce.entity.CapacityEntity;

import java.util.Map;

/**
 * 
 *
 * @author Skyzc
 * @email youzhengcai@gmail.com
 * @date 2019-04-18 11:12:08
 */
public interface CapacityService extends IService<CapacityEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

