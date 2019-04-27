package io.renren.modules.produce.controller;

import java.util.Arrays;
import java.util.Map;

import io.renren.common.validator.ValidatorUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.produce.entity.CapacityEntity;
import io.renren.modules.produce.service.CapacityService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 
 *
 * @author Skyzc
 * @email youzhengcai@gmail.com
 * @date 2019-04-18 11:12:08
 */
@RestController
@RequestMapping("produce/capacity")
public class CapacityController {
    @Autowired
    private CapacityService capacityService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    //@RequiresPermissions("sys:capacity:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = capacityService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    //@RequiresPermissions("sys:capacity:info")
    public R info(@PathVariable("id") Integer id){
        CapacityEntity capacity = capacityService.getById(id);

        return R.ok().put("capacity", capacity);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    //@RequiresPermissions("sys:capacity:save")
    public R save(@RequestBody CapacityEntity capacity){
        capacityService.save(capacity);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    //@RequiresPermissions("sys:capacity:update")
    public R update(@RequestBody CapacityEntity capacity){
        ValidatorUtils.validateEntity(capacity);
        capacityService.updateById(capacity);
        
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    //@RequiresPermissions("sys:capacity:delete")
    public R delete(@RequestBody Integer[] ids){
        capacityService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
