package com.sunday.inter;

import java.util.List;
import com.sunday.model.Constant;
public interface ConstantMapper {
	List<Constant> selectConstant();
	int insertConstant(Constant constant);
	int deleteConstant(String typeName);
}
