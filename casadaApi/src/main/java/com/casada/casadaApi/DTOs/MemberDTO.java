package com.casada.casadaApi.DTOs;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class MemberDTO implements  Serializable {
    private int memberId;

    private String memberName;

    private String memberSurname;

    private String memberEmail;

    private String memberPassword;

    private int roleId;

    private String roleName;
    public MemberDTO(int memberId, String memberName, String memberSurname, String memberEmail, String memberPassword, int roleId, String roleName) {
        this.memberId = memberId;
        this.memberName = memberName;
        this.memberSurname = memberSurname;
        this.memberEmail = memberEmail;
        this.memberPassword = memberPassword;
        this.roleId = roleId;
        this.roleName = roleName;
    }

}
