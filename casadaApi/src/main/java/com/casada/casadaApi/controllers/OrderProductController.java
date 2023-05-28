package com.casada.casadaApi.controllers;

import com.casada.casadaApi.DTOs.NewOrderDTO;
import com.casada.casadaApi.DTOs.OrderProductDTO;
import com.casada.casadaApi.DTOs.OrderStatusDTO;
import com.casada.casadaApi.DTOs.UpdateProductsDTO;
import com.casada.casadaApi.services.OrderProductService;
import com.casada.casadaApi.services.implementations.OrderProductServiceImpl;
import com.casada.casadaApi.services.implementations.OrderStatusServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/orderproduct")
public class OrderProductController {

    @Autowired
    private OrderProductServiceImpl orderProductService;

    @GetMapping("/{orderId}")
    public List<OrderProductDTO> findAllByOrderId(@PathVariable("orderId") Integer orderId) {
            return orderProductService.findAllByOrderId(orderId);
    }

    @PostMapping("/updateproducts")
    public void updateProducts(@RequestBody UpdateProductsDTO updateProductsDTO){
        orderProductService.updateProducts(updateProductsDTO.getProducts());


    }

}
