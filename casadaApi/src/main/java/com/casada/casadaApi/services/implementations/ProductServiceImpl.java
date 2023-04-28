package com.casada.casadaApi.services.implementations;

import com.casada.casadaApi.DTOs.ProductDTO;
import com.casada.casadaApi.mappers.MemberMapper;
import com.casada.casadaApi.mappers.ProductMapper;
import com.casada.casadaApi.repos.MemberRepository;
import com.casada.casadaApi.repos.ProductRepository;
import com.casada.casadaApi.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private ProductMapper productMapper;

    @Override
    public List<ProductDTO> findAll() {
        return productRepository.findAll().stream()
                .map(productMapper::toDTO).collect(Collectors.toList());
    }
}
