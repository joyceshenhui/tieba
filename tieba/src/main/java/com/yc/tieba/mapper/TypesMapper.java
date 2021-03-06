package com.yc.tieba.mapper;



import java.util.List;
import java.util.Map;

import com.yc.tieba.entity.NoteInfo;
import com.yc.tieba.entity.PaginationBean;
import com.yc.tieba.entity.Types;

public interface TypesMapper {

	PaginationBean<Types> listTypes(PaginationBean<Types> pb);
	PaginationBean<Types> listTypes2(PaginationBean<Types> pb);

	int addTypes(Types types);

	int modifyTypes(Types types);

	int deleteTypes(Types types);

	int findId(String typesName);

	PaginationBean<NoteInfo> findNotes(Map<String, String> map);

	List<Types> showTypesinfo(String tid);

	List<Types> typeCompare();
}
