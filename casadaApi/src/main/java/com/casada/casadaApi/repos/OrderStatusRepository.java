package com.casada.casadaApi.repos;

import com.casada.casadaApi.domain.OrderStatus;
import org.springframework.data.jpa.repository.JpaRepository;


public interface OrderStatusRepository extends JpaRepository<OrderStatus, Integer> {
}
