package com.casada.casadaApi.controllers;

import com.casada.casadaApi.DTOs.OrderStatusDTO;
import com.casada.casadaApi.DTOs.PaymentMethodDTO;
import com.casada.casadaApi.services.implementations.OrderStatusServiceImpl;
import com.casada.casadaApi.services.implementations.PaymentMethodServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/paymentmethod")
public class PaymentMethodController {

    @Autowired
    private PaymentMethodServiceImpl paymentMethodService;

    @GetMapping
    public List<PaymentMethodDTO> findAll() {
        return paymentMethodService.findAll();
    }

    @GetMapping("/{id}")
    public PaymentMethodDTO findById(@PathVariable("id") Integer id) {
        return paymentMethodService.findById(id);
    }
}
