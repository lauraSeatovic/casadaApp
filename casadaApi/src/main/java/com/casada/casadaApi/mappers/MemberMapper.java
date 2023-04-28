package com.casada.casadaApi.mappers;

import com.casada.casadaApi.DTOs.MemberDTO;
import com.casada.casadaApi.domain.Member;
import com.casada.casadaApi.domain.Role;
import com.casada.casadaApi.repos.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Optional;
import java.util.stream.Collectors;

@Component
public class MemberMapper {
    @Autowired
    private RoleRepository roleRepository;

    public MemberDTO toDTO(Member member){
        return new MemberDTO(
                member.getMemberId(),
                member.getMemberName(),
                member.getMemberSurname(),
                member.getMemberEmail(),
                member.getMemberPassword(),
                member.getRole().getRoleId(),
                member.getRole().getRoleName());
    }

    public Member toDomain(MemberDTO member){
        Optional<Role> optionalRole = roleRepository.findById(member.getRoleId());
        if(optionalRole.isPresent()) {
            Role role = optionalRole.get();
            return new Member(
                    member.getMemberId(),
                    member.getMemberName(),
                    member.getMemberSurname(),
                    member.getMemberEmail(),
                    member.getMemberPassword(),
                    role

            );
        } else {
            throw new RuntimeException("Role not found");
        }
    }
}
