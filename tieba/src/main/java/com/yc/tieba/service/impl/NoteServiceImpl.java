package com.yc.tieba.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.tieba.entity.NoteInfo;
import com.yc.tieba.entity.PaginationBean;
import com.yc.tieba.mapper.NoteMapper;
import com.yc.tieba.service.NoteService;

@Service("noteService")
public class NoteServiceImpl implements NoteService {
	@Autowired
	private NoteMapper noteMapper;

	@Override
	public PaginationBean<NoteInfo> findNote(String page, String rows,
			String options) {
		PaginationBean<NoteInfo> pb=null;
		int pageSize=10; //条数
		int currPage=1; //当前页
		if(rows!=null){
			pageSize=Integer.parseInt(rows);
		} 
		if(page!=null){
			currPage=Integer.parseInt(page);
			if(currPage<=0){
				currPage=1;
			}
		}	
		Map<String, String> map = new HashMap<String, String>();
		map.put("pageSize", rows);
		map.put("currPage",page);
		
		if(options == null){
			System.out.println("12");
			return noteMapper.findNote(map);
		}else if(options.startsWith("贴主")){
			options =  options.replace("贴主", "");
			options = String.valueOf(noteMapper.findUsId(options));
			map.put("options", options);
			return noteMapper.findNoteUs(map);
		}else if(options.startsWith("其他")){
			options =  options.replace("其他", "");
			map.put("options", options);
			return noteMapper.findNote(map);
		}else 	if(options.startsWith("板块")){
			options =  options.replace("板块", "");
			options = String.valueOf(noteMapper.findTyId(options));
			map.put("options", options);
			return noteMapper.findNoteTy(map);
		} 
		return null;
	}

	@Override
	public int deleteNote(String ids) {
		return noteMapper.deleteNote( ids);
	}

	@Override
	public int updateNote(NoteInfo rowData) {
		return noteMapper.updateNote(rowData);
	}
}