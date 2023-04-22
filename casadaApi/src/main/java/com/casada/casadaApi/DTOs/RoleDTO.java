package com.casada.casadaApi.DTOs;


import java.io.Serializable;

@lombok.Data
public class RoleDTO implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long roleid;

    private String rolename;

}
