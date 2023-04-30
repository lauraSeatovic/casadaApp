package com.casada.casadaApi.mappers;

import com.casada.casadaApi.DTOs.MassageChairDTO;
import com.casada.casadaApi.domain.*;
import com.casada.casadaApi.repos.MassageChairClassRepository;
import com.casada.casadaApi.repos.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
public class MassageChairMapper {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private MassageChairClassRepository massageChairClassRepository;

    public MassageChair toDomain(MassageChairDTO massageChair){
        Optional<Product> optionalProduct = productRepository.findById(massageChair.getProductId());
        Optional<MassageChairClass> optionalClass = massageChairClassRepository.findById(massageChair.getMassageChairClassId());

        if(optionalProduct.isPresent() && optionalClass.isPresent()) {
            Product product = optionalProduct.get();
            MassageChairClass massageChairClass = optionalClass.get();
            return new MassageChair(
                    massageChairClass,
                    product
            );
        } else {
            throw new RuntimeException("Product or class not found");
        }
    }

    public MassageChairDTO toDTO(MassageChair massageChair){
        return new MassageChairDTO(
                massageChair.getProductId(),
                massageChair.getProduct().getProductName(),
                massageChair.getProduct().getProductPrice(),
                massageChair.getProduct().getProductActiveStatus(),
                massageChair.getProduct().getProductCode(),
                massageChair.getMassageChairClass().getMassageChairClassId()
        );
    }
}
