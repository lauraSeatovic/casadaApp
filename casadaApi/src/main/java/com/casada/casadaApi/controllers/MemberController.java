package com.casada.casadaApi.controllers;

import com.casada.casadaApi.DTOs.MemberDTO;
import com.casada.casadaApi.domain.Member;
import com.casada.casadaApi.services.implementations.MemberServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/member")
public class MemberController {

    @Autowired
    private MemberServiceImpl memberService;

    @GetMapping
    public List<MemberDTO> findAll() {
        return memberService.findAll();
    }

    @PostMapping
    public Member saveMember(@RequestBody MemberDTO memberDTO){
        return memberService.addMember(memberDTO);
    }
}
