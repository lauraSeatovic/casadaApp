package com.casada.casadaApi.mappers;

import com.casada.casadaApi.DTOs.OrderProductDTO;
import com.casada.casadaApi.domain.*;
import com.casada.casadaApi.repos.OrderInfoRepository;
import com.casada.casadaApi.repos.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
public class OrderProductMapper {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private OrderInfoRepository orderInfoRepository;

    public OrderProductDTO toDTO(OrderProduct orderProduct) {
        return new OrderProductDTO(
                orderProduct.getOrder().getOrderId(),
                orderProduct.getProduct().getProductId(),
                orderProduct.getProduct().getProductName(),
                orderProduct.getProduct().getProductPrice(),
                orderProduct.getDiscount(),
                orderProduct.getGuarantee(),
                orderProduct.getQuantity()
        );
    }

    public OrderProduct toDomain(OrderProductDTO orderProduct) {
        Optional<OrderInfo> optionalOrder = orderInfoRepository.findById(orderProduct.getOrderid());
        Optional<Product> optionalProduct = productRepository.findById(orderProduct.getProductid());

        if (optionalOrder.isPresent() && optionalProduct.isPresent()) {
            OrderInfo orderInfo = optionalOrder.get();
            Product product = optionalProduct.get();
            return new OrderProduct(
                    orderProduct.getDiscount(),
                    orderProduct.getGuarantee(),
                    orderProduct.getQuantity(),
                    orderInfo,
                    product

            );
        } else {
            throw new RuntimeException("Order or product not found");
        }

    }
}
