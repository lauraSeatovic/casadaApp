package com.casada.casadaApi.repos;

import com.casada.casadaApi.domain.OrderProduct;
import com.casada.casadaApi.domain.OrderProductId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;


public interface OrderProductRepository extends JpaRepository<OrderProduct, OrderProductId> {
    @Query("SELECT op FROM OrderProduct op WHERE op.order.orderId = :orderId")
    List<OrderProduct> findByOrderId(@Param("orderId") Integer orderId);
}
