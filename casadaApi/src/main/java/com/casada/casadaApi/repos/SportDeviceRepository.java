package com.casada.casadaApi.repos;

import com.casada.casadaApi.domain.Product;
import com.casada.casadaApi.domain.SportDevice;
import org.springframework.data.jpa.repository.JpaRepository;


public interface SportDeviceRepository extends JpaRepository<SportDevice, Integer> {
}
