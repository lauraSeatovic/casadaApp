package com.casada.casadaApi.domain;

import jakarta.persistence.*;

import java.util.Set;

import lombok.Getter;
import lombok.Setter;


@Entity
@Getter
@Setter
@Table(name = "product")
public class Product {

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "productid", nullable = false, updatable = false)
    private Integer productId;

    @Column(name = "productname", nullable = false, length = 200)
    private String productName;

    @Column(name = "productprice", nullable = false)
    private Double productPrice;

    @Column(name = "productactivestatus", nullable = false)
    private Boolean productActiveStatus;

    @Column(name = "productcode", length = 100)
    private String productCode;

    @OneToOne(mappedBy = "product", cascade = CascadeType.ALL, orphanRemoval = true)
    private MassageDevice massageDevices;

    @OneToOne(mappedBy = "product", cascade = CascadeType.ALL, orphanRemoval = true)
    private SportDevice sportDevice;

    @OneToOne(mappedBy = "product", cascade = CascadeType.ALL, orphanRemoval = true)
    private MassageChair massageChair;

    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<Service> productServices;

    @OneToMany(mappedBy = "product")
    private Set<OrderProduct> productOrderProducts;

    public Product() {
    }

    public Product(Integer productId, String productName, Double productPrice, Boolean productActiveStatus, String productCode) {
        this.productId = productId;
        this.productName = productName;
        this.productPrice = productPrice;
        this.productActiveStatus = productActiveStatus;
        this.productCode = productCode;
    }
}
