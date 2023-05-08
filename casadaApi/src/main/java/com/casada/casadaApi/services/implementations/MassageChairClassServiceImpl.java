package com.casada.casadaApi.services.implementations;

import com.casada.casadaApi.DTOs.MassageChairClassDTO;
import com.casada.casadaApi.DTOs.PaymentMethodDTO;
import com.casada.casadaApi.domain.MassageChairClass;
import com.casada.casadaApi.mappers.MassageChairClassMapper;
import com.casada.casadaApi.repos.MassageChairClassRepository;
import com.casada.casadaApi.services.MassageChairClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class MassageChairClassServiceImpl implements MassageChairClassService {

    @Autowired
    private MassageChairClassRepository massageChairClassRepository;

    @Autowired
    private MassageChairClassMapper massageChairClassMapper;

    public List<MassageChairClassDTO> findAll() {
        return massageChairClassRepository.findAll().stream()
                .map(massageChairClassMapper::toDTO).collect(Collectors.toList());
    }
}
