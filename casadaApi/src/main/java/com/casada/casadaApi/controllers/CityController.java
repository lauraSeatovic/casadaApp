package com.casada.casadaApi.controllers;

import com.casada.casadaApi.DTOs.CityDTO;
import com.casada.casadaApi.DTOs.MassageChairClassDTO;
import com.casada.casadaApi.services.CityService;
import com.casada.casadaApi.services.MassageChairClassService;
import com.casada.casadaApi.services.implementations.CityServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/city")
public class CityController {

    @Autowired
    private CityServiceImpl cityService;

    @GetMapping()
    public List<CityDTO> findAll() {
        return cityService.findAll();
    }
}
