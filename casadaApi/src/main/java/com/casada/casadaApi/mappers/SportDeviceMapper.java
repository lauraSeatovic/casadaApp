package com.casada.casadaApi.mappers;

import com.casada.casadaApi.DTOs.MassageDeviceDTO;
import com.casada.casadaApi.DTOs.SportDeviceDTO;
import com.casada.casadaApi.domain.*;
import com.casada.casadaApi.repos.MassageDeviceTypeRepository;
import com.casada.casadaApi.repos.ProductRepository;
import com.casada.casadaApi.repos.SportDeviceTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
public class SportDeviceMapper {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private SportDeviceTypeRepository sportDeviceTypeRepository;

    public SportDevice toDomain(SportDeviceDTO sportDevice){
        Optional<Product> optionalProduct = productRepository.findById(sportDevice.getProductId());
        Optional<SportDeviceType> optionalType = sportDeviceTypeRepository.findById(sportDevice.getSportDeviceTypeId());

        if(optionalProduct.isPresent() && optionalType.isPresent()) {
            Product product = optionalProduct.get();
            SportDeviceType sportDeviceType = optionalType.get();
            return new SportDevice(
                    sportDeviceType,
                    product
            );
        } else {
            throw new RuntimeException("Product or type not found");
        }
    }

    public SportDeviceDTO toDTO(SportDevice sportDevice){
        return new SportDeviceDTO(
                sportDevice.getProductId(),
                sportDevice.getProduct().getProductName(),
                sportDevice.getProduct().getProductPrice(),
                sportDevice.getProduct().getProductActiveStatus(),
                sportDevice.getProduct().getProductCode(),
                sportDevice.getSportDeviceType().getSportDeviceTypeId()
        );
    }
}
