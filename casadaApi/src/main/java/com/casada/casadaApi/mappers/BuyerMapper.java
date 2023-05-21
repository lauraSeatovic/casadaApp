package com.casada.casadaApi.mappers;

import com.casada.casadaApi.DTOs.BuyerDTO;
import com.casada.casadaApi.domain.Buyer;
import com.casada.casadaApi.domain.City;
import com.casada.casadaApi.domain.Member;
import com.casada.casadaApi.domain.Role;
import com.casada.casadaApi.repos.CityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
public class BuyerMapper {

    @Autowired
    private CityRepository cityRepository;

    public BuyerDTO toDTO(Buyer buyer){

        return new BuyerDTO(
                buyer.getBuyerId(),
                buyer.getBuyerName(),
                buyer.getBuyerSurname(),
                buyer.getBuyerPhoneNumber(),
                buyer.getBuyerHomeAddress(),
                buyer.getBuyerDeliveryAddress(),
                buyer.getBuyerEmail(),
                buyer.getHomePostalCode().getCityPostalCode(),
                buyer.getHomePostalCode().getCityName(),
                buyer.getDeliveryPostalCode().getCityPostalCode(),
                buyer.getDeliveryPostalCode().getCityName()

        );
    }

    public Buyer toDomain(BuyerDTO buyer){
        Optional<City> optionalHomeCity = cityRepository.findById(buyer.getHomePostalCode());
        Optional<City> optionalDeliveryCity = cityRepository.findById(buyer.getDeliveryPostalCode());

        if(optionalHomeCity.isPresent() && optionalDeliveryCity.isPresent()) {
            City cityHome = optionalHomeCity.get();
            City cityDelivery = optionalDeliveryCity.get();

            return new Buyer(
                    buyer.getBuyerId(),
                    buyer.getBuyerName(),
                    buyer.getBuyerSurname(),
                    buyer.getBuyerPhoneNumber(),
                    buyer.getBuyerHomeAddress(),
                    buyer.getBuyerDeliveryAddress(),
                    buyer.getBuyerEmail(),
                    cityHome,
                    cityDelivery

            );
        } else {
            throw new RuntimeException("Home or delivery city not found");
        }
    }
}
