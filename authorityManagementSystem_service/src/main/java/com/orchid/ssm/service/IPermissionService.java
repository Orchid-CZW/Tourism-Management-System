package com.orchid.ssm.service;

import com.orchid.ssm.domain.Permission;
import java.util.List;

public interface IPermissionService {
    List<Permission> findAll();

    void save(Permission permission);

    void deleteRole_PermissionByPermissionId(String id);

    List<Permission> findById(String id);

    void addRoleByPermissionId(String permissionId, String roleId);

    void deleteRoleById(String permissionId, String roleId);
}
