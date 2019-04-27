package io.renren.modules.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.sys.entity.SysClassEntity;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: skyzc
 * Date: 2019/3/31
 * Time: 1:37
 * To change this template use File | Settings | File Templates.
 * Description:
 */
public interface SysClassService extends IService<SysClassEntity> {
    PageUtils queryPage(Map<String, Object> params);
    List<SysClassEntity> queryAllClass();
}