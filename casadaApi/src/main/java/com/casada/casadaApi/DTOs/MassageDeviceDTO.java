package com.casada.casadaApi.DTOs;


import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class MassageDeviceDTO implements Serializable {

    private Integer productId;

    private String productName;

    private Double productPrice;

    private Boolean productActiveStatus;

    private String productCode;

    private Integer massageDeviceTypeId;

    private String massageDeviceTypeName;

    public MassageDeviceDTO(Integer productId, String productName, Double productPrice, Boolean productActiveStatus, String productCode, Integer massageDeviceTypeId, String massageDeviceTypeName) {
        this.productId = productId;
        this.productName = productName;
        this.productPrice = productPrice;
        this.productActiveStatus = productActiveStatus;
        this.productCode = productCode;
        this.massageDeviceTypeId = massageDeviceTypeId;
        this.massageDeviceTypeName = massageDeviceTypeName;
    }

}
