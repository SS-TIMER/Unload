package io.renren.modules.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.sys.dao.SysBookDao;
import io.renren.modules.sys.entity.GoodsEntity;
import io.renren.modules.sys.entity.SysBookEntity;
import io.renren.modules.sys.service.SysBookService;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service("sysBookService")
public class SysBookServiceImpl extends ServiceImpl<SysBookDao, SysBookEntity> implements SysBookService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<SysBookEntity> page = this.page(
                new Query<SysBookEntity>().getPage(params),
                new QueryWrapper<SysBookEntity>()
        );
        return new PageUtils(page);
    }

    @Override
    public void saveBook(SysBookEntity book) {
        this.save(book);
    }

    @Override
    public void delete(int id) {
        this.delete(id);
    }

    /*
    *   更新
    * */
    @Override
    public void update(SysBookEntity book) {
        this.update(book);

    }

}
