package com.casada.casadaApi.controllers;

import com.casada.casadaApi.DTOs.MemberDTO;
import com.casada.casadaApi.services.implementations.MemberServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/member")
public class MemberController {

    @Autowired
    private MemberServiceImpl memebrService;

    @GetMapping
    public List<MemberDTO> findAll() {
        return memebrService.findAll();
    }

    @PostMapping
    public Boolean saveMember(@RequestBody MemberDTO memberDTO){
        return memebrService.addMember(memberDTO);
    }
}