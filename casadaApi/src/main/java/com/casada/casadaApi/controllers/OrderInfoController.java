package com.casada.casadaApi.controllers;

import com.casada.casadaApi.DTOs.*;
import com.casada.casadaApi.domain.Buyer;
import com.casada.casadaApi.domain.OrderInfo;
import com.casada.casadaApi.mappers.BuyerMapper;
import com.casada.casadaApi.services.implementations.BuyerServiceImpl;
import com.casada.casadaApi.services.implementations.OrderInfoServiceImpl;
import com.casada.casadaApi.services.implementations.OrderStatusServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/orderinfo")
public class OrderInfoController {
    @Autowired
    private OrderInfoServiceImpl orderInfoService;

    @Autowired
    private BuyerMapper buyerMapper;

    @Autowired
    private BuyerServiceImpl buyerService;

    @Autowired
    private OrderStatusServiceImpl orderStatusService;

    @GetMapping
    public List<OrderInfoDTO> findAll() {
        return orderInfoService.findAll();
    }

    @PostMapping
    public OrderInfo saveOrderInfo(@RequestBody OrderInfoDTO orderInfoDTO) {
        return orderInfoService.addOrderInfo(orderInfoDTO);
    }

    @PostMapping("/update")
    public OrderInfo updateOrder(@RequestBody EditOrderDTO editOrderDTO) {
        return orderInfoService.updateOrder(editOrderDTO.getOrder());
    }

    @GetMapping("/{orderId}")
    public OrderInfoDTO findById(@PathVariable("orderId") Integer orderId) {
        return orderInfoService.findById(orderId);
    }

    @DeleteMapping("/{orderId}")
    public void deleteById(@PathVariable("orderId") Integer orderId){
        orderInfoService.removeOrder(orderId);
    }

    @PostMapping("/neworder")
    public void newOrder(@RequestBody NewOrderDTO newOrderDTO){
        int orderId = orderInfoService.newOrder(newOrderDTO);

    }

}
