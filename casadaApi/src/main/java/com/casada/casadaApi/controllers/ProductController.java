package com.casada.casadaApi.controllers;

import com.casada.casadaApi.DTOs.*;
import com.casada.casadaApi.services.implementations.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductServiceImpl productService;

    @GetMapping
    public List<ProductDTO> findAll() {
        return productService.findAll();
    }

    @GetMapping("/massagechair")
    public List<MassageChairDTO> findAllMassageChair() {
        return productService.findAllMassageChair();
    }

    @PostMapping("/massagechair")//add colors
    public Boolean saveMassageChair(@RequestBody MassageChairProductDTO massageChairProductDTO){
        return productService.addMassageChair(massageChairProductDTO.getProductDTO(), massageChairProductDTO.getMassageChairClassId());
    }

    /*JSON body
        {"productDTO":{
            "productId": 0,
            "productName": "Product sport device",
            "productPrice": 10.5,
            "productActiveStatus": true,
            "productCode": "ABC122322123"
        },
         "sportDeviceTypeId":1}
     */
    @PostMapping("/sportdevice")
    public Boolean saveSportDevice(@RequestBody SportDeviceProductDTO sportDeviceProductDTO){
        return productService.addSportDevice(sportDeviceProductDTO.getProductDTO(), sportDeviceProductDTO.getSportDeviceTypeId());
    }

    @PostMapping("/massagedevice")
    public Boolean saveMassageDevice(@RequestBody MassageDeviceProductDTO massageDeviceProductDTO){
        return productService.addMassageDevice(massageDeviceProductDTO.getProductDTO(), massageDeviceProductDTO.getMassageDeviceTypeId());
    }

}
