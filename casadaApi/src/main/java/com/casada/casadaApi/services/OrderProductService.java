package com.casada.casadaApi.services;

import com.casada.casadaApi.DTOs.OrderProductDTO;
import com.casada.casadaApi.domain.OrderProduct;
import org.springframework.stereotype.Service;

import java.util.List;

public interface OrderProductService {
    List<OrderProductDTO> findAllByOrderId(Integer orderId);
}
