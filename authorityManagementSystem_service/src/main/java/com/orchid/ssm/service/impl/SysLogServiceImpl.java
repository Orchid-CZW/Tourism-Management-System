package com.orchid.ssm.service.impl;

import com.github.pagehelper.PageHelper;
import com.orchid.ssm.dao.ISysLogDao;
import com.orchid.ssm.domain.Syslog;
import com.orchid.ssm.service.ISysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class SysLogServiceImpl implements ISysLogService {
    @Autowired
    ISysLogDao sysLogDao;
    @Override
    public void addSysLog(Syslog syslog) {
        sysLogDao.addSysLog(syslog);
    }

    @Override
    public List<Syslog> findAll(Integer page,Integer size,String fuzzyName) {
        PageHelper.startPage(page,size);
        return sysLogDao.findAll(fuzzyName);
    }

    @Override
    public void deleteSysLog() {
        sysLogDao.deleteSysLog();
    }
}
