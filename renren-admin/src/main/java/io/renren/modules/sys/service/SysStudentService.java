package io.renren.modules.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.sys.entity.SysStudentEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 *
 * @author Skyzc
 * @email youzhengcai@gmail.com
 * @date 2019-03-31 01:52:40
 */
public interface SysStudentService extends IService<SysStudentEntity> {

    PageUtils queryPage(Map<String, Object> params);

    List<SysStudentEntity> findAll();
}

