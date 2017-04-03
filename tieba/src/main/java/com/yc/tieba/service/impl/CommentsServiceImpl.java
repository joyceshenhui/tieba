package com.yc.tieba.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.tieba.entity.Comments;
import com.yc.tieba.entity.QueryEntity;
import com.yc.tieba.mapper.CommentsMapper;
import com.yc.tieba.service.CommentsService;

@Service("commentsService")
public class CommentsServiceImpl implements CommentsService {
	@Autowired
	private CommentsMapper commentsMapper;
	
	@Override
	public List<Comments> listAllComm() {
		return commentsMapper.findAllComment();
	}

	@Override
	public Comments findCommById(String cid) {
		return commentsMapper.findCommById(cid);
	}

	@Override
	public List<Comments> findCommByUid(String param,String status) {
		return commentsMapper.findCommByUid(new QueryEntity(param, Integer.parseInt(status)));
	}

	@Override
	public List<Comments> findCommByNid(String param,String status) {
		
		return commentsMapper.findCommByNid(new QueryEntity(param, Integer.parseInt(status)));
	}

	@Override
	public boolean banCommn(String cid) {
		if(cid==null){
			return false;
		}
		return commentsMapper.banComm(cid)>0;
	}

	@Override
	public boolean letComm(String cid) {
		if(cid==null){
			return false;
		}
		return commentsMapper.letComm(cid)>0;
	}

	@Override
	public List<Comments> findBanComm() {
		return commentsMapper.findBanComm();
	}

}
