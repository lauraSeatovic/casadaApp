package com.casada.casadaApi.services;

import com.casada.casadaApi.DTOs.OrderStatusDTO;

import java.util.List;

public interface OrderStatusService {
    List<OrderStatusDTO> findAll();
    OrderStatusDTO findById(Integer id);
}
