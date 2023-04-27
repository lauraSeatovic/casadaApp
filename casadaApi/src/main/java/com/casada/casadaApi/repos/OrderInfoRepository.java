package com.casada.casadaApi.repos;

import com.casada.casadaApi.domain.OrderInfo;
import org.springframework.data.jpa.repository.JpaRepository;


public interface OrderInfoRepository extends JpaRepository<OrderInfo, Integer> {
}
