package com.casada.casadaApi.DTOs;


import java.io.Serializable;

@lombok.Data
public class ProductDTO implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long productid;

    private String productname;

    private Double productprice;

    private Boolean productactivestatus;

    private String productcode;

}
