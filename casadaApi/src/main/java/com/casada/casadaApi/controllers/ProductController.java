package com.casada.casadaApi.controllers;

import com.casada.casadaApi.DTOs.MemberDTO;
import com.casada.casadaApi.DTOs.ProductDTO;
import com.casada.casadaApi.services.implementations.MemberServiceImpl;
import com.casada.casadaApi.services.implementations.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductServiceImpl productService;

    @GetMapping
    public List<ProductDTO> findAll() {
        return productService.findAll();
    }
    /*
    @PostMapping
    public Boolean saveMember(@RequestBody MemberDTO memberDTO){
        return memebrService.addMember(memberDTO);
    }*/
}
