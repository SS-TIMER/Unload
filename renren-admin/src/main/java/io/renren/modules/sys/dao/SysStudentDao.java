package io.renren.modules.sys.dao;

import io.renren.modules.sys.entity.SysStudentEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 
 * 
 * @author Skyzc
 * @email youzhengcai@gmail.com
 * @date 2019-03-31 01:52:40
 */
@Mapper
@Component
public interface SysStudentDao extends BaseMapper<SysStudentEntity> {
	List<SysStudentEntity> findAll();
}
