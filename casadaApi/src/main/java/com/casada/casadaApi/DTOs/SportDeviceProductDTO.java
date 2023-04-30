package com.casada.casadaApi.DTOs;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class SportDeviceProductDTO implements Serializable {
    private ProductDTO productDTO;
    private Integer sportDeviceTypeId;
}
