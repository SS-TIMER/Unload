package io.renren.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * 
 * @author Skyzc
 * @email youzhengcai@gmail.com
 * @date 2019-03-31 01:52:40
 */
@Data
@TableName("sys_student")
public class SysStudentEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Long id;
	/**
	 * 
	 */
	private String name;
	/**
	 * 
	 */
	private Integer sex;
	/**
	 * 
	 */
	private String address;
	/**
	 * 
	 */
	private Integer age;
	/**
	 * 
	 */
	private Long classid;

	@TableField(exist = false)
	private String className;

}
