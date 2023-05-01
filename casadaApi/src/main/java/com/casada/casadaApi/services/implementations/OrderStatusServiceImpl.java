package com.casada.casadaApi.services.implementations;

import com.casada.casadaApi.DTOs.OrderStatusDTO;
import com.casada.casadaApi.DTOs.PaymentMethodDTO;
import com.casada.casadaApi.domain.OrderStatus;
import com.casada.casadaApi.mappers.OrderStatusMapper;
import com.casada.casadaApi.mappers.PaymentMethodMapper;
import com.casada.casadaApi.repos.OrderStatusRepository;
import com.casada.casadaApi.repos.PaymentMethodRepository;
import com.casada.casadaApi.services.OrderStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class OrderStatusServiceImpl implements OrderStatusService {

    @Autowired
    private OrderStatusRepository orderStatusRepository;

    @Autowired
    private OrderStatusMapper orderStatusMapper;

    public List<OrderStatusDTO> findAll() {
        return orderStatusRepository.findAll().stream()
                .map(orderStatusMapper::toDTO).collect(Collectors.toList());
    }

    public OrderStatusDTO findById(Integer id){
        Optional<OrderStatus> orderStatusOptional = orderStatusRepository.findById(id);
        if(orderStatusOptional.isPresent()){
            return orderStatusMapper.toDTO(orderStatusOptional.get());
        }else{
            throw new RuntimeException("OrderStatus not found");
        }
    }
}
