package com.casada.casadaApi.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;


@Entity
@Getter
@Setter
@Table(name = "orderproduct")
@IdClass(OrderProductId.class)
public class OrderProduct {

    @Column(name = "discount", nullable = false)
    private Double discount;

    @Column(name = "guarantee", nullable = false)
    private Integer guarantee;

    @Column(name = "quantity", nullable = false)
    private Integer quantity;

    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "orderid", nullable = false)
    private OrderInfo order;

    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "productid", nullable = false)
    private Product product;

}
