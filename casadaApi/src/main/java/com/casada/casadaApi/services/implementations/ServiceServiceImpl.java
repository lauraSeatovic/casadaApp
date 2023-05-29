package com.casada.casadaApi.services.implementations;

import com.casada.casadaApi.DTOs.BuyerDTO;
import com.casada.casadaApi.DTOs.OrderProductDTO;
import com.casada.casadaApi.DTOs.ServiceDTO;
import com.casada.casadaApi.domain.Buyer;
import com.casada.casadaApi.domain.Service;
import com.casada.casadaApi.mappers.ServiceMapper;
import com.casada.casadaApi.repos.ServiceRepository;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.stream.Collectors;

@org.springframework.stereotype.Service
public class ServiceServiceImpl {
    @Autowired
    private ServiceRepository serviceRepository;

    @Autowired
    private ServiceMapper serviceMapper;

    public Service addNewService(ServiceDTO serviceDTO){
        return serviceRepository.save(serviceMapper.toDomain(serviceDTO));
    }


    public List<ServiceDTO> findAllByOrderId(Integer orderId) {
        return serviceRepository.findByOrderId(orderId).stream().map(serviceMapper::toDTO).collect(Collectors.toList());
    }
}
