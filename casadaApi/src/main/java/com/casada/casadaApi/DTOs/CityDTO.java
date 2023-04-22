package com.casada.casadaApi.DTOs;


import java.io.Serializable;

@lombok.Data
public class CityDTO implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long citypostalcode;

    private String cityname;

}
