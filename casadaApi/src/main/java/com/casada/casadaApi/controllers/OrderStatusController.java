package com.casada.casadaApi.controllers;

import com.casada.casadaApi.DTOs.MassageChairProductDTO;
import com.casada.casadaApi.DTOs.OrderStatusDTO;
import com.casada.casadaApi.DTOs.StatusAndOrderDTO;
import com.casada.casadaApi.services.implementations.EmailService;
import com.casada.casadaApi.services.implementations.OrderStatusServiceImpl;
import jakarta.mail.MessagingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/orderstatus")
public class OrderStatusController {

    @Autowired
    private OrderStatusServiceImpl orderStatusService;

    @Autowired
    private EmailService emailService;

    @GetMapping
    public List<OrderStatusDTO> findAll() {
        return orderStatusService.findAll();
    }

    @GetMapping("/{id}")
    public OrderStatusDTO findById(@PathVariable("id") Integer id) {
        //emailService.sendEmail("laura.seatovic@gmail.com", "proba", "POzdrav Lp");
        return orderStatusService.findById(id);
    }

    @PostMapping("/changestatus")
    public void changeOrderStatus(@RequestBody StatusAndOrderDTO statusAndOrderDTO){
        orderStatusService.changeOrderStatus(statusAndOrderDTO);
    }

}
