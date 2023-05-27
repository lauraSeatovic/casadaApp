package com.casada.casadaApi.controllers;

import com.casada.casadaApi.DTOs.OrderProductDTO;
import com.casada.casadaApi.DTOs.OrderStatusDTO;
import com.casada.casadaApi.services.OrderProductService;
import com.casada.casadaApi.services.implementations.OrderProductServiceImpl;
import com.casada.casadaApi.services.implementations.OrderStatusServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/orderproduct")
public class OrderProductController {

    @Autowired
    private OrderProductServiceImpl orderProductService;

    @GetMapping("/{orderId}")
    public List<OrderProductDTO> findAllByOrderId(@PathVariable("orderId") Integer orderId) {
            return orderProductService.findAllByOrderId(orderId);
    }

}
