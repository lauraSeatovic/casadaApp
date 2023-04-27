package com.casada.casadaApi.repos;

import com.casada.casadaApi.domain.Service;
import org.springframework.data.jpa.repository.JpaRepository;


public interface ServiceRepository extends JpaRepository<Service, Integer> {
}
