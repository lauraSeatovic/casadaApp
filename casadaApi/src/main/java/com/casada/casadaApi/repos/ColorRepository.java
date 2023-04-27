package com.casada.casadaApi.repos;

import com.casada.casadaApi.domain.Color;
import org.springframework.data.jpa.repository.JpaRepository;


public interface ColorRepository extends JpaRepository<Color, Integer> {
}
