package com.orchid.ssm.service;

import com.orchid.ssm.domain.Role;
import com.orchid.ssm.domain.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;
import java.util.List;

public interface IUserService extends UserDetailsService {
    List<UserInfo> findAll(Integer page, Integer size, String fuzzyName);

    void save(UserInfo userInfo) throws Exception;

    UserInfo findById(String id) throws Exception;


    List<Role> findAllRole(String id) throws Exception;

    void relatedRole(String userId, String roleId) throws Exception;

    void deleteRoleById(String id, String userId);
}
