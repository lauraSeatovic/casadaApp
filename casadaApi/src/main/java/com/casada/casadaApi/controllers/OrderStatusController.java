package com.casada.casadaApi.controllers;

import com.casada.casadaApi.DTOs.OrderStatusDTO;
import com.casada.casadaApi.services.implementations.OrderStatusServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/orderstatus")
public class OrderStatusController {

    @Autowired
    private OrderStatusServiceImpl orderStatusService;

    @GetMapping
    public List<OrderStatusDTO> findAll() {
        return orderStatusService.findAll();
    }

    @GetMapping("/{id}")
    public OrderStatusDTO findById(@PathVariable("id") Integer id) {
        return orderStatusService.findById(id);
    }

}
