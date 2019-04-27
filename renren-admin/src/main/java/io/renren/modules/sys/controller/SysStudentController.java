package io.renren.modules.sys.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import io.renren.common.validator.ValidatorUtils;
import io.renren.modules.sys.entity.SysClassEntity;
import io.renren.modules.sys.service.SysClassService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.sys.entity.SysStudentEntity;
import io.renren.modules.sys.service.SysStudentService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 
 *
 * @author Skyzc
 * @email youzhengcai@gmail.com
 * @date 2019-03-31 01:52:40
 */
@RestController
@RequestMapping("sys/sysstudent")
public class SysStudentController {
    @Autowired
    private SysStudentService sysStudentService;

    @Autowired
    private SysClassService sysClassService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("sys:sysstudent:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = sysStudentService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    //@RequiresPermissions("sys:sysstudent:info")
    public R info(@PathVariable("id") Long id){
        SysStudentEntity sysStudent = sysStudentService.getById(id);

        return R.ok().put("sysStudent", sysStudent);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    //@RequiresPermissions("sys:sysstudent:save")
    public R save(@RequestBody SysStudentEntity sysStudent){
        sysStudentService.save(sysStudent);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("sys:sysstudent:update")
    public R update(@RequestBody SysStudentEntity sysStudent){
        ValidatorUtils.validateEntity(sysStudent);
        sysStudentService.updateById(sysStudent);
        
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("sys:sysstudent:delete")
    public R delete(@RequestBody Long[] ids){
        sysStudentService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }


    /**
     *FindAll
     */
    @RequestMapping("/findAll")
    public List<SysStudentEntity> findAll(){
        List<SysStudentEntity> sysStudentEntityList = sysStudentService.findAll();
        return sysStudentEntityList;
    }
    /**
     * queryAllClass
     * */
    @RequestMapping("/queryAllClass")
    public List<SysClassEntity> queryAllClass(){
        List<SysClassEntity> sysClassEntityList =  sysClassService.queryAllClass();
        return sysClassEntityList;
    }
}
