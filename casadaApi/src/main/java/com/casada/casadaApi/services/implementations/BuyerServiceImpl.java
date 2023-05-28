package com.casada.casadaApi.services.implementations;

import com.casada.casadaApi.DTOs.BuyerDTO;
import com.casada.casadaApi.DTOs.MemberDTO;
import com.casada.casadaApi.DTOs.OrderInfoDTO;
import com.casada.casadaApi.DTOs.PaymentMethodDTO;
import com.casada.casadaApi.domain.Buyer;
import com.casada.casadaApi.domain.OrderInfo;
import com.casada.casadaApi.domain.PaymentMethod;
import com.casada.casadaApi.mappers.BuyerMapper;
import com.casada.casadaApi.repos.BuyerRepository;
import com.casada.casadaApi.services.BuyerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
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

    public BuyerDTO findById(Integer buyerId){
        Optional<Buyer> buyerOptional = buyerRepository.findById(buyerId);
        if(buyerOptional.isPresent()){
            return buyerMapper.toDTO(buyerOptional.get());
        }else{
            throw new RuntimeException("Buyer not found");
        }
    }

    public Integer addNewBuyer(BuyerDTO buyerDTO){
        Buyer buyer = buyerMapper.toDomain(buyerDTO);

        Buyer savedBuyer = buyerRepository.save(buyer);
        Integer generatedId = savedBuyer.getBuyerId();
        return generatedId;
    }

    public Buyer updateBuyer(BuyerDTO buyerDTO) {
        return buyerRepository.save(buyerMapper.toDomain(buyerDTO));
    }
}
