package com.casada.casadaApi.DTOs;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class MassageDeviceProductDTO implements Serializable {
    private ProductDTO productDTO;
    private Integer massageDeviceTypeId;
}
