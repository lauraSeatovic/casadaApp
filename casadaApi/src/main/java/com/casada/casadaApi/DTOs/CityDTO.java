package com.casada.casadaApi.DTOs;


import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class CityDTO implements Serializable {
    private Integer citypostalcode;

    private String cityname;

    public CityDTO(Integer citypostalcode, String cityname) {
        this.citypostalcode = citypostalcode;
        this.cityname = cityname;
    }
}
