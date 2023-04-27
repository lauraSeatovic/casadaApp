package com.casada.casadaApi.repos;

import com.casada.casadaApi.domain.Member;
import org.springframework.data.jpa.repository.JpaRepository;


public interface MemberRepository extends JpaRepository<Member, Integer> {
}
