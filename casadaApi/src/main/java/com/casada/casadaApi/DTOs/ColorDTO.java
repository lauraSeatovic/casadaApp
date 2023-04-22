package com.casada.casadaApi.DTOs;


import java.io.Serializable;

@lombok.Data
public class ColorDTO implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long colorid;

    private String colorname;

}
