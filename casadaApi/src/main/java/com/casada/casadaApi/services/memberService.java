package com.casada.casadaApi.services;

import com.casada.casadaApi.domain.Member;
import com.casada.casadaApi.repos.MemberRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class memberService {

    private final MemberRepository memberRepository;

    public memberService(MemberRepository memberRepository) {
        this.memberRepository = memberRepository;
    }

    public String findAll() {
        return memberRepository.findAll().get(0).getRole().getRoleName();
    }
}