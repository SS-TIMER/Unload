package io.renren.modules.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.sys.entity.SysBookEntity;

import java.util.Map;

/**
 *  图书管理
 *
 * @author Mark
 * @email sunlightcs@gmail.com
 * @date 2019-03-26 09:31:41
 */
public interface SysBookService extends IService<SysBookEntity> {

    PageUtils queryPage(Map<String, Object> params);

    /**
     * 保存图书
     */
    void saveBook(SysBookEntity book);
    /**
     * 删除图书
     */
    void delete(int id);

    /**
     * 修改图书
     */
    void update(SysBookEntity book);

}
