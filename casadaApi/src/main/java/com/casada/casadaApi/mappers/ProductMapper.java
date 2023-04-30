package com.casada.casadaApi.mappers;

import com.casada.casadaApi.DTOs.ProductDTO;
import com.casada.casadaApi.domain.MassageChair;
import com.casada.casadaApi.domain.Product;
import com.casada.casadaApi.services.ProductService;
import org.springframework.stereotype.Component;

@Component
public class ProductMapper {
    public ProductDTO toDTO(Product product){
        return new ProductDTO(
                product.getProductId(),
                product.getProductName(),
                product.getProductPrice(),
                product.getProductActiveStatus(),
                product.getProductCode());
    }

    public Product toDomain(ProductDTO product){
        return new Product(
                product.getProductId(),
                product.getProductName(),
                product.getProductPrice(),
                product.getProductActiveStatus(),
                product.getProductCode()
        );
    }
}
