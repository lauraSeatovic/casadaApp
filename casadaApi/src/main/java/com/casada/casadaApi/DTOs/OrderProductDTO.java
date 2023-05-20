package com.casada.casadaApi.DTOs;


import java.io.Serializable;

@lombok.Getter
@lombok.Setter
public class OrderProductDTO implements Serializable {
    private Integer orderid;

    private Integer productid;

    private String productName;

    private Double productPrice;

    private Double discount;

    private Integer guarantee;

    private Integer quantity;

    public OrderProductDTO(Integer orderid, Integer productid, String productName, Double productPrice, Double discount, Integer guarantee, Integer quantity) {
        this.orderid = orderid;
        this.productid = productid;
        this.productName = productName;
        this.productPrice = productPrice;
        this.discount = discount;
        this.guarantee = guarantee;
        this.quantity = quantity;
    }
}
