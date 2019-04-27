package io.renren.modules.produce.entity;

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
 * @date 2019-04-18 11:12:08
 */
@Data
@TableName("tb_capacity")
public class CapacityEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Integer id;
	/**
	 * 
	 */
	private String name;
	/**
	 * 
	 */
	private String technoName;
	/**
	 * 
	 */
	private String facName;
	/**
	 * 
	 */
	private String facId;
	/**
	 * 
	 */
	private String paramName;
	/**
	 * 
	 */
	private String paramDesignValue;
	/**
	 * 
	 */
	private String paramUnit;
	/**
	 * 
	 */
	private String otherParamInfo;
	/**
	 * 
	 */
	private Integer otherFacNum;
	/**
	 * 
	 */
	private String unit;
	/**
	 * 
	 */
	private String designCapacity;
	/**
	 * 
	 */
	private Integer runTime;
	/**
	 * 
	 */
	private String otherInfo;
	/**
	 * 
	 */
	private String otherTechnoInfo;

}
