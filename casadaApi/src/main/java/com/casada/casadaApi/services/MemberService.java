package com.casada.casadaApi.services;

import com.casada.casadaApi.DTOs.MemberDTO;
import com.casada.casadaApi.domain.Member;

import java.util.List;

public interface MemberService {
     List<MemberDTO> findAll();
     Boolean addMember(MemberDTO member);
}