package com.casada.casadaApi.controllers;

import com.casada.casadaApi.DTOs.BuyerDTO;
import com.casada.casadaApi.DTOs.MemberDTO;
import com.casada.casadaApi.DTOs.OrderProductDTO;
import com.casada.casadaApi.services.implementations.BuyerServiceImpl;
import com.casada.casadaApi.services.implementations.MemberServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/buyer")
public class BuyerController {

    @Autowired
    private BuyerServiceImpl buyerService;

    @GetMapping
    public List<BuyerDTO> findAll() {
        return buyerService.findAll();
    }

    @GetMapping("/{buyerId}")
    public BuyerDTO findById(@PathVariable("buyerId") Integer buyerId) {
        return buyerService.findById(buyerId);
    }

}
