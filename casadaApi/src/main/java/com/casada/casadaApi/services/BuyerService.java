package com.casada.casadaApi.services;

import com.casada.casadaApi.DTOs.BuyerDTO;

import java.util.List;

public interface BuyerService {
    List<BuyerDTO> findAll();
}
