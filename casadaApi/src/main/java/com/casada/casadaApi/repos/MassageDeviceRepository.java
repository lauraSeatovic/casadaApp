package com.casada.casadaApi.repos;

import com.casada.casadaApi.domain.MassageChair;
import com.casada.casadaApi.domain.MassageDevice;
import com.casada.casadaApi.domain.Product;
import org.springframework.data.jpa.repository.JpaRepository;


public interface MassageDeviceRepository extends JpaRepository<MassageDevice, Integer> {
}
