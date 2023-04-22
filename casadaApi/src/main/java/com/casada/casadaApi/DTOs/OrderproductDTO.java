package com.casada.casadaApi.DTOs;


import java.io.Serializable;

@lombok.Data
public class OrderproductDTO implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long orderid;

    private Long productid;

    private Double discount;

    private Long guarantee;

    private Long quantity;

}
