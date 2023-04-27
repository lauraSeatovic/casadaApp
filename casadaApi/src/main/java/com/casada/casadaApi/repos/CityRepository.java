package com.casada.casadaApi.repos;

import com.casada.casadaApi.domain.City;
import org.springframework.data.jpa.repository.JpaRepository;


public interface CityRepository extends JpaRepository<City, Integer> {
}
