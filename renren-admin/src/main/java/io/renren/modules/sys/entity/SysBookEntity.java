package io.renren.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.models.auth.In;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;

/**
 * 书本管理
 *
 * @author Skyzc
 * @email youzhengaci@gmail.com
 * @date 2019-03-30 11:42:41
 */
@Data
@TableName("sys_book")
public class SysBookEntity implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
    * 书本 ID
    * */
    @TableId
    private Integer id;
    /**
    * 书本名
    * */
    @NotBlank(message="参数名不能为空")
    private String name;
    /**
     * 书本作者
     * */
    @NotBlank(message="参数名不能为空")
    private String author;
    /**
     * 书本价格
     * */
    @NotBlank(message="参数名不能为空")
    private Integer price;
    /**
     * 书本数量
     * */
    @NotBlank(message="参数名不能为空")
    private Integer number;

    private String remark;
    private Integer del_flag;
}
