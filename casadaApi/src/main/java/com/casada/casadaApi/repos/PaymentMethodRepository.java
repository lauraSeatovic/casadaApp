package com.casada.casadaApi.repos;

import com.casada.casadaApi.domain.PaymentMethod;
import org.springframework.data.jpa.repository.JpaRepository;


public interface PaymentMethodRepository extends JpaRepository<PaymentMethod, Integer> {
}
