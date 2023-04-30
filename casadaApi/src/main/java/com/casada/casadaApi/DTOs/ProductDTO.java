package com.casada.casadaApi.DTOs;


import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class ProductDTO implements Serializable {
    private static final long serialVersionUID = 1L;
    private int productId;

    private String productName;

    private Double productPrice;

    private Boolean productActiveStatus;

    private String productCode;

    public ProductDTO(int productid, String productname, Double productprice, Boolean productactivestatus, String productcode) {
        this.productId = productid;
        this.productName = productname;
        this.productPrice = productprice;
        this.productActiveStatus = productactivestatus;
        this.productCode = productcode;
    }
}
