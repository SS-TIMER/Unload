package io.renren.modules.sys.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.common.utils.PageUtils;
import io.renren.modules.sys.entity.SysBookEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

/**
 * 书本管理
 *
 * @author Skyzc
 * @email youzhengaci@gmail.com
 * @date 2019-03-30 11:42:41
 */

@Mapper
public interface SysBookDao extends BaseMapper<SysBookEntity> {

    SysBookEntity queryListParentId(Integer id);

    void updateValueByID(SysBookEntity sysBookEntity);
}
