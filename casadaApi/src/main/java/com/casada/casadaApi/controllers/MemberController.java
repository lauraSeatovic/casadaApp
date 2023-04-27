package com.casada.casadaApi.controllers;

import com.casada.casadaApi.domain.Member;
import com.casada.casadaApi.services.memberService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/member")
public class MemberController {

    private final memberService memebrService1;


    public MemberController(memberService memberService) {
        this.memebrService1 = memberService;
    }


    @GetMapping
    public String findAll() {
        return memebrService1.findAll();
    }
}
