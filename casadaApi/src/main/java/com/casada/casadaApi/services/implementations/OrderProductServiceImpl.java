package com.casada.casadaApi.services.implementations;

import com.casada.casadaApi.DTOs.OrderProductDTO;
import com.casada.casadaApi.domain.OrderProduct;
import com.casada.casadaApi.mappers.OrderProductMapper;
import com.casada.casadaApi.repos.OrderProductRepository;
import com.casada.casadaApi.services.OrderProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class OrderProductServiceImpl implements OrderProductService {

    @Autowired
    private OrderProductRepository orderProductRepository;

    @Autowired
    private OrderProductMapper orderProductMapper;

    @Override
    public List<OrderProductDTO> findAllByOrderId(Integer orderId) {
        return orderProductRepository.findByOrderId(orderId).stream().map(orderProductMapper::toDTO).collect(Collectors.toList());
    }
}
