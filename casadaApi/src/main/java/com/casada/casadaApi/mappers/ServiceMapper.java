package com.casada.casadaApi.mappers;

import com.casada.casadaApi.DTOs.ProductDTO;
import com.casada.casadaApi.DTOs.ServiceDTO;
import com.casada.casadaApi.domain.*;
import com.casada.casadaApi.repos.OrderInfoRepository;
import com.casada.casadaApi.repos.OrderStatusRepository;
import com.casada.casadaApi.repos.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
public class ServiceMapper {
    @Autowired
    private OrderInfoRepository orderInfoRepository;

    @Autowired
    private ProductRepository productRepository;

    public ServiceDTO toDTO(Service service) {
        return new ServiceDTO(
                service.getServiceId(),
                service.getServiceStartDate(),
                service.getServiceFinishDate(),
                service.getServiceNote(),
                service.getServicePrice(),
                service.getOrder().getOrderId(),
                service.getProduct().getProductId());
    }

    public Service toDomain(ServiceDTO service) {
        Optional<OrderInfo> optionalOrderInfo = orderInfoRepository.findById(service.getOrderId());
        Optional<Product> optionalProduct = productRepository.findById(service.getProductId());

        if (optionalProduct.isPresent() && optionalOrderInfo.isPresent()) {
            OrderInfo orderInfo = optionalOrderInfo.get();
            Product product = optionalProduct.get();

            return new Service(service.getServiceId(), service.getServiceStartDate(), service.getServiceFinishDate(), service.getServiceNote(), service.getServicePrice(), orderInfo, product);
        } else {
            throw new RuntimeException("Role not found");
        }


    }
}
