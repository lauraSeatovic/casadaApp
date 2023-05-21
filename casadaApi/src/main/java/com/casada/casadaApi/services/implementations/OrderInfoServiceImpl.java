package com.casada.casadaApi.services.implementations;

import com.casada.casadaApi.DTOs.BuyerDTO;
import com.casada.casadaApi.DTOs.MemberDTO;
import com.casada.casadaApi.DTOs.OrderInfoDTO;
import com.casada.casadaApi.domain.Buyer;
import com.casada.casadaApi.domain.OrderInfo;
import com.casada.casadaApi.mappers.OrderInfoMapper;
import com.casada.casadaApi.repos.OrderInfoRepository;
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
    private OrderInfoMapper orderInfoMapper;

    public List<OrderInfoDTO> findAll() {
        return orderInfoRepository.findAll().stream()
                .map(orderInfoMapper::toDTO).collect(Collectors.toList());
    }

    public OrderInfo addOrderInfo(OrderInfoDTO orderInfo){
        return orderInfoRepository.save(orderInfoMapper.toDomain(orderInfo));
    }

    public OrderInfoDTO findById(Integer orderId){
        Optional<OrderInfo> orderInfoOptional = orderInfoRepository.findById(orderId);
        if(orderInfoOptional.isPresent()){
            return orderInfoMapper.toDTO(orderInfoOptional.get());
        }else{
            throw new RuntimeException("Order not found");
        }
    }
}
