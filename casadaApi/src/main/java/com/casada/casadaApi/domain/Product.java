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

    @OneToMany(mappedBy = "product")
    private Set<MassageDevice> massageDevices;

    @OneToMany(mappedBy = "product")
    private Set<SportDevice> sportDevices;

    @OneToMany(mappedBy = "product")
    private Set<MassageChair> massageChairs;

    @OneToMany(mappedBy = "product")
    private Set<Service> productServices;

    @OneToMany(mappedBy = "product")
    private Set<OrderProduct> productOrderProducts;

}
