package com.casada.casadaApi.services;

import com.casada.casadaApi.DTOs.PaymentMethodDTO;

import java.util.List;

public interface PaymentMethodService {
    List<PaymentMethodDTO> findAll();
    PaymentMethodDTO findById(Integer id);
}
