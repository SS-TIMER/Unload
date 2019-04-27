package io.renren.modules.sys.dao;

import io.renren.modules.sys.entity.GoodsEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 商品管理
 * 
 * @author Mark
 * @email sunlightcs@gmail.com
 * @date 2019-03-26 09:31:41
 */
@Mapper
public interface GoodsDao extends BaseMapper<GoodsEntity> {
	
}
