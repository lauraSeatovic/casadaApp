package com.casada.casadaApi.services.implementations;

import com.casada.casadaApi.DTOs.OrderStatusDTO;
import com.casada.casadaApi.DTOs.PaymentMethodDTO;
import com.casada.casadaApi.domain.OrderStatus;
import com.casada.casadaApi.domain.PaymentMethod;
import com.casada.casadaApi.mappers.PaymentMethodMapper;
import com.casada.casadaApi.repos.PaymentMethodRepository;
import com.casada.casadaApi.services.PaymentMethodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class PaymentMethodServiceImpl implements PaymentMethodService {

    @Autowired
    private PaymentMethodRepository paymentMethodRepository;

    @Autowired
    private PaymentMethodMapper paymentMethodMapper;

    public List<PaymentMethodDTO> findAll() {

        return paymentMethodRepository.findAll().stream()
                .map(paymentMethodMapper::toDTO).collect(Collectors.toList());
    }

    public PaymentMethodDTO findById(Integer id){
        Optional<PaymentMethod> paymentMethodOptional = paymentMethodRepository.findById(id);
        if(paymentMethodOptional.isPresent()){
            return paymentMethodMapper.toDTO(paymentMethodOptional.get());
        }else{
            throw new RuntimeException("PaymentMethod not found");
        }
    }
}
