package io.renren.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;

@Data
@TableName("sys_class")
public class SysClassEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    @TableId
    private Integer id;
    @NotBlank(message = "参数不能为空")
    private String className;
}
