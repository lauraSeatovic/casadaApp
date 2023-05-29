package com.casada.casadaApi.repos;

import com.casada.casadaApi.domain.OrderProduct;
import com.casada.casadaApi.domain.Service;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;


public interface ServiceRepository extends JpaRepository<Service, Integer> {
    @Query("SELECT s FROM Service s WHERE s.order.orderId = :orderId")
    List<Service> findByOrderId(@Param("orderId") Integer orderId);
}
