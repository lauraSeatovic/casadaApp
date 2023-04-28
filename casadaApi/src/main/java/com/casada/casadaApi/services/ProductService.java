package com.casada.casadaApi.services;

import com.casada.casadaApi.DTOs.ProductDTO;
import com.casada.casadaApi.domain.Product;

import java.util.List;

public interface ProductService {
    List<ProductDTO> findAll();
}
