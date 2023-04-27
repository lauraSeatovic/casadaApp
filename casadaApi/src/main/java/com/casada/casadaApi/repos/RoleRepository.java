package com.casada.casadaApi.repos;

import com.casada.casadaApi.domain.Role;
import org.springframework.data.jpa.repository.JpaRepository;


public interface RoleRepository extends JpaRepository<Role, Integer> {
}
