package com.casada.casadaApi.repos;

import com.casada.casadaApi.domain.OrderProduct;
import com.casada.casadaApi.domain.OrderProductId;
import org.springframework.data.jpa.repository.JpaRepository;


public interface OrderProductRepository extends JpaRepository<OrderProduct, OrderProductId> {
}
