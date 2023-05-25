package com.casada.casadaApi.services.implementations;

import com.casada.casadaApi.DTOs.CityDTO;
import com.casada.casadaApi.mappers.CityMapper;
import com.casada.casadaApi.repos.CityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CityServiceImpl {

    @Autowired
    private CityRepository cityRepository;

    @Autowired
    private CityMapper cityMapper;

    public List<CityDTO> findAll() {
        return cityRepository.findAll().stream()
                .map(cityMapper::toDTO).collect(Collectors.toList());
    }
}
