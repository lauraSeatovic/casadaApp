package com.casada.casadaApi.mappers;

import com.casada.casadaApi.DTOs.CityDTO;
import com.casada.casadaApi.domain.City;
import org.springframework.stereotype.Component;

@Component
public class CityMapper {
    public CityDTO toDTO(City city){
        return new CityDTO(
                city.getCityPostalCode(),
                city.getCityName()
        );
    }

    public City toDomain(CityDTO city){
        return new City(
                city.getCitypostalcode(),
                city.getCityname()
        );
    }
}
