package com.casada.casadaApi.services.implementations;

import com.casada.casadaApi.DTOs.MemberDTO;
import com.casada.casadaApi.domain.Member;
import com.casada.casadaApi.domain.Role;
import com.casada.casadaApi.mappers.MemberMapper;
import com.casada.casadaApi.repos.MemberRepository;
import com.casada.casadaApi.services.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private MemberMapper memberMapper;

    @Override
    public List<MemberDTO> findAll() {

        return memberRepository.findAll().stream()
                .map(memberMapper::toDTO).collect(Collectors.toList());
    }

    @Override
    public Boolean addMember(MemberDTO member){
        memberRepository.save(memberMapper.toDomain(member));
        return true;
    }
}