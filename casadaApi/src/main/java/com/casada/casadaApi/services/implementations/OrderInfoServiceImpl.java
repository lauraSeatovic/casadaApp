package com.casada.casadaApi.services.implementations;

import com.casada.casadaApi.DTOs.BuyerDTO;
import com.casada.casadaApi.DTOs.MemberDTO;
import com.casada.casadaApi.DTOs.OrderInfoDTO;
import com.casada.casadaApi.domain.Buyer;
import com.casada.casadaApi.domain.OrderInfo;
import com.casada.casadaApi.domain.OrderStatus;
import com.casada.casadaApi.mappers.OrderInfoMapper;
import com.casada.casadaApi.repos.OrderInfoRepository;
import com.casada.casadaApi.repos.OrderStatusRepository;
import com.casada.casadaApi.services.OrderInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class OrderInfoServiceImpl implements OrderInfoService {

    @Autowired
    private OrderInfoRepository orderInfoRepository;

    @Autowired
    private OrderStatusRepository orderStatusRepository;

    @Autowired
    private OrderInfoMapper orderInfoMapper;

    public List<OrderInfoDTO> findAll() {
        return orderInfoRepository.findAll().stream()
                .map(orderInfoMapper::toDTO).collect(Collectors.toList());
    }

    public OrderInfo addOrderInfo(OrderInfoDTO orderInfo){
        OrderInfo order = orderInfoMapper.toDomain(orderInfo);
        OrderInfo savedOrder = orderInfoRepository.save(order);
        Integer generatedId = savedOrder.getOrderId();
        savedOrder.setOrderNumber(generatedId.toString() +"-" + order.getOrderDate());
        return orderInfoRepository.save(savedOrder);
    }

    public OrderInfoDTO findById(Integer orderId){
        Optional<OrderInfo> orderInfoOptional = orderInfoRepository.findById(orderId);
        if(orderInfoOptional.isPresent()){
            return orderInfoMapper.toDTO(orderInfoOptional.get());
        }else{
            throw new RuntimeException("Order not found");
        }
    }

    public void removeOrder(int orderId){
        orderInfoRepository.deleteById(orderId);
    }

    public void changeOrderStatus(int orderId, int statusId){
        Optional<OrderInfo> orderInfoOptional = orderInfoRepository.findById(orderId);
        Optional<OrderStatus> orderStatusOptional = orderStatusRepository.findById(statusId);
        if(orderInfoOptional.isPresent() && orderStatusOptional.isPresent()){
            OrderInfo orderInfo = orderInfoOptional.get();
            OrderStatus orderStatus = orderStatusOptional.get();
            orderInfo.setOrderStatus(orderStatus);
            orderInfoRepository.save(orderInfo);
        }else{
            throw new RuntimeException("Order or status not found");
        }
    }
}
