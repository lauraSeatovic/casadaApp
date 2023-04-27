package com.casada.casadaApi.repos;


import com.casada.casadaApi.domain.Buyer;
import org.springframework.data.jpa.repository.JpaRepository;


public interface BuyerRepository extends JpaRepository<Buyer, Integer> {
}
