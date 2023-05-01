package com.casada.casadaApi.services.implementations;

import com.casada.casadaApi.DTOs.BuyerDTO;
import com.casada.casadaApi.DTOs.MemberDTO;
import com.casada.casadaApi.mappers.BuyerMapper;
import com.casada.casadaApi.repos.BuyerRepository;
import com.casada.casadaApi.services.BuyerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class BuyerServiceImpl implements BuyerService {

    @Autowired
    private BuyerRepository buyerRepository;

    @Autowired
    private BuyerMapper buyerMapper;

    public List<BuyerDTO> findAll() {

        return buyerRepository.findAll().stream()
                .map(buyerMapper::toDTO).collect(Collectors.toList());
    }
}
