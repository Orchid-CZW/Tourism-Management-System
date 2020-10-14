package com.orchid.ssm.service;

import com.orchid.ssm.domain.Syslog;
import java.util.List;

public interface ISysLogService {
    void addSysLog(Syslog syslog);

    List<Syslog> findAll(Integer page, Integer size, String fuzzyName);

    void deleteSysLog();

}
