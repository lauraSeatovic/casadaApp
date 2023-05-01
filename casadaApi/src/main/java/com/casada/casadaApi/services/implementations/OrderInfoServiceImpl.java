package com.casada.casadaApi.services.implementations;

import com.casada.casadaApi.DTOs.MemberDTO;
import com.casada.casadaApi.DTOs.OrderInfoDTO;
import com.casada.casadaApi.mappers.OrderInfoMapper;
import com.casada.casadaApi.repos.OrderInfoRepository;
import com.casada.casadaApi.services.OrderInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
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

    public Boolean addOrderInfo(OrderInfoDTO orderInfo){
        orderInfoRepository.save(orderInfoMapper.toDomain(orderInfo));
        return true;
    }
}
