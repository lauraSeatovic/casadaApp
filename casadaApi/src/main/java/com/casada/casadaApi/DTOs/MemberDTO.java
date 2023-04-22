package com.casada.casadaApi.DTOs;


import java.io.Serializable;

@lombok.Data
public class MemberDTO implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long memberid;

    private String membername;

    private String membersurname;

    private String memberemail;

    private String memberpassword;

    private Long roleid;

}
