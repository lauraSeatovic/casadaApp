package com.casada.casadaApi.DTOs;


import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class ProductDTO implements Serializable {
    private static final long serialVersionUID = 1L;
    private int productid;

    private String productname;

    private Double productprice;

    private Boolean productactivestatus;

    private String productcode;

    public ProductDTO(int productid, String productname, Double productprice, Boolean productactivestatus, String productcode) {
        this.productid = productid;
        this.productname = productname;
        this.productprice = productprice;
        this.productactivestatus = productactivestatus;
        this.productcode = productcode;
    }
}
