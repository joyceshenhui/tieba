package com.yc.tieba.service;

import com.yc.tieba.entity.Admin;

public interface AdminService {

	Admin login(Admin admin);

	Admin selectPwd(Admin admin);

	boolean updatePwd(Admin admin);

}
