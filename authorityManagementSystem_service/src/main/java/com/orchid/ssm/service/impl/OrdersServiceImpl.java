package com.orchid.ssm.service.impl;

import com.github.pagehelper.PageHelper;
import com.orchid.ssm.dao.IOrdersDao;
import com.orchid.ssm.domain.Orders;
import com.orchid.ssm.service.IOrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class OrdersServiceImpl implements IOrdersService {
    @Autowired
    private IOrdersDao ordersDao;

    @Override
    public List<Orders> findAll(int page, int size, String fuzzyName) throws Exception {
        PageHelper.startPage(page, size);
        return ordersDao.findAll(fuzzyName);
    }

    @Override
    public Orders findById(String id) throws Exception {
        return ordersDao.findById(id);
    }

    @Override
    public void deleteById(String id) {
        ordersDao.deleteOrders_travellerByOrdersId(id);
        ordersDao.deleteById(id);
    }
}
