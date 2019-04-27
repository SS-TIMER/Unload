package io.renren.modules.sys.controller;

import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.common.validator.ValidatorUtils;
import io.renren.modules.sys.entity.SysBookEntity;
import io.renren.modules.sys.service.SysBookService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.Map;

@RestController
@RequestMapping("sys/book")
public class SysBookController {
    @Autowired
    private SysBookService sysBookService;

    /**
     * book 列表
     */
    @RequestMapping("/list")
    //@RequiresPermissions("sys:book:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = sysBookService.queryPage(params);
        return R.ok().put("page", page);
    }
    /**
     * 保存
     */
    @RequestMapping("/save")
    //@RequiresPermissions("sys:books:save")
    public R save(@RequestBody SysBookEntity books){
        sysBookService.save(books);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    //@RequiresPermissions("sys:books:update")
    public R update(@RequestBody SysBookEntity books){
        ValidatorUtils.validateEntity(books);
        sysBookService.update(books);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    //@RequiresPermissions("sys:books:delete")
    public R delete(@RequestBody Long[] goodsIds){
        sysBookService.removeByIds(Arrays.asList(goodsIds));

        return R.ok();
    }
}
