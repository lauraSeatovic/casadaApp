package com.casada.casadaApi.controllers;

import com.casada.casadaApi.DTOs.MassageChairClassDTO;
import com.casada.casadaApi.DTOs.PaymentMethodDTO;
import com.casada.casadaApi.services.MassageChairClassService;
import com.casada.casadaApi.services.implementations.PaymentMethodServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/massagechair")
public class MassageChairController {

    @Autowired
    private MassageChairClassService massageChairClassService;

    @GetMapping("/class")
    public List<MassageChairClassDTO> findAll() {
        return massageChairClassService.findAll();
    }
}
