package com.casada.casadaApi.controllers;

import com.casada.casadaApi.DTOs.OrderInfoDTO;
import com.casada.casadaApi.domain.OrderInfo;
import com.casada.casadaApi.services.implementations.OrderInfoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/orderinfo")
public class OrderInfoController {
    @Autowired
    private OrderInfoServiceImpl orderInfoService;

    @GetMapping
    public List<OrderInfoDTO> findAll() {
        return orderInfoService.findAll();
    }

    @PostMapping
    public OrderInfo saveOrderInfo(@RequestBody OrderInfoDTO orderInfoDTO) {
        return orderInfoService.addOrderInfo(orderInfoDTO);
    }
}
