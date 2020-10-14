package com.orchid.ssm.service;

import com.orchid.ssm.domain.Orders;
import java.util.List;

public interface IOrdersService {

     List<Orders> findAll(int page, int size, String fuzzyName) throws Exception;

     Orders findById(String id) throws Exception;

     void deleteById(String id);
}
