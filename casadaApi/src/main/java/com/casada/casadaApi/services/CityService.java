package com.casada.casadaApi.services;

import com.casada.casadaApi.DTOs.CityDTO;

import java.util.List;

public interface CityService {
    List<CityDTO> findAll();
}
