package com.casada.casadaApi.DTOs;


import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class MassageChairDTO implements Serializable {
    private Integer productId;

    private String productName;

    private Double productPrice;

    private Boolean productActiveStatus;

    private String productCode;

    private Integer massageChairClassId;

    private String massageChairClassName;

    public MassageChairDTO(Integer productId, String productName, Double productPrice, Boolean productActiveStatus, String productCode, Integer massageChairClassId, String massageChairClassName) {
        this.productId = productId;
        this.productName = productName;
        this.productPrice = productPrice;
        this.productActiveStatus = productActiveStatus;
        this.productCode = productCode;
        this.massageChairClassId = massageChairClassId;
        this.massageChairClassName = massageChairClassName;
    }
}
