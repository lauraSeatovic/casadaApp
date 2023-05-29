package com.casada.casadaApi.controllers;

import com.casada.casadaApi.DTOs.MassageChairProductDTO;
import com.casada.casadaApi.DTOs.OrderProductDTO;
import com.casada.casadaApi.DTOs.ServiceDTO;
import com.casada.casadaApi.domain.Service;
import com.casada.casadaApi.services.implementations.ServiceServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/service")
public class ServiceController {
    @Autowired
    private ServiceServiceImpl serviceService;
    @PostMapping()
    public Service saveService(@RequestBody ServiceDTO serviceDTO){
        return serviceService.addNewService(serviceDTO);
    }

    @GetMapping("/{orderId}")
    public List<ServiceDTO> findAllByOrderId(@PathVariable("orderId") Integer orderId) {
        return serviceService.findAllByOrderId(orderId);
    }
}
