package com.casada.casadaApi.services;

import com.casada.casadaApi.DTOs.OrderInfoDTO;
import com.casada.casadaApi.domain.OrderInfo;

import java.util.List;

public interface OrderInfoService {
    List<OrderInfoDTO> findAll();
    OrderInfo addOrderInfo(OrderInfoDTO orderInfo);
}
