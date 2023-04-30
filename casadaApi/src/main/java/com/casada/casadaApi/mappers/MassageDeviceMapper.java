package com.casada.casadaApi.mappers;

import com.casada.casadaApi.DTOs.MassageChairDTO;
import com.casada.casadaApi.DTOs.MassageDeviceDTO;
import com.casada.casadaApi.domain.*;
import com.casada.casadaApi.repos.MassageChairClassRepository;
import com.casada.casadaApi.repos.MassageDeviceTypeRepository;
import com.casada.casadaApi.repos.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
public class MassageDeviceMapper {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private MassageDeviceTypeRepository massageDeviceTypeRepository;

    public MassageDevice toDomain(MassageDeviceDTO massageDevice){
        Optional<Product> optionalProduct = productRepository.findById(massageDevice.getProductId());
        Optional<MassageDeviceType> optionalType = massageDeviceTypeRepository.findById(massageDevice.getMassageDeviceTypeId());

        if(optionalProduct.isPresent() && optionalType.isPresent()) {
            Product product = optionalProduct.get();
            MassageDeviceType massageDeviceType = optionalType.get();
            return new MassageDevice(
                    massageDeviceType,
                    product
            );
        } else {
            throw new RuntimeException("Product or type not found");
        }
    }

    public MassageDeviceDTO toDTO(MassageDevice massageDevice){
        return new MassageDeviceDTO(
                massageDevice.getProductId(),
                massageDevice.getProduct().getProductName(),
                massageDevice.getProduct().getProductPrice(),
                massageDevice.getProduct().getProductActiveStatus(),
                massageDevice.getProduct().getProductCode(),
                massageDevice.getMassageDeviceType().getMassageDeviceTypeId()
        );
    }
}
