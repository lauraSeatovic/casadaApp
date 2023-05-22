package com.casada.casadaApi.services.data;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductPDF {
    private String name;
    private Integer quantity;
    private Double price;
    private Double discount;
    private Double totalProductPrice;

    public ProductPDF(String name, Integer quantity, Double price, Double discount, Double totalProductPrice) {
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.discount = discount;
        this.totalProductPrice = totalProductPrice;
    }
}
