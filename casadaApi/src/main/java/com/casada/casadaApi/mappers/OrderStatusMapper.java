package com.casada.casadaApi.mappers;

import com.casada.casadaApi.DTOs.OrderStatusDTO;
import com.casada.casadaApi.domain.OrderStatus;
import org.springframework.stereotype.Component;

@Component
public class OrderStatusMapper {
    public OrderStatusDTO toDTO(OrderStatus orderStatus){
        return new OrderStatusDTO(
                orderStatus.getOrderStatusId(),
                orderStatus.getOrderStatusName()
        );
    }

    public OrderStatus toDomain(OrderStatusDTO orderStatus){
        return new OrderStatus(
                orderStatus.getOrderStatusId(),
                orderStatus.getOrderStatusName()
        );
    }
}
