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

    @ManyToMany
    @JoinTable(
            name = "massagechair",
            joinColumns = @JoinColumn(name = "productid"),
            inverseJoinColumns = @JoinColumn(name = "massagechairclassid")
    )
    private Set<MassageChairClass> massageChairMassageChairClasss;

    @ManyToMany
    @JoinTable(
            name = "massagedevice",
            joinColumns = @JoinColumn(name = "productid"),
            inverseJoinColumns = @JoinColumn(name = "massagedevicetypeid")
    )
    private Set<MassageDeviceType> massageDeviceMassageDeviceTypes;

    @ManyToMany
    @JoinTable(
            name = "sportdevice",
            joinColumns = @JoinColumn(name = "productid"),
            inverseJoinColumns = @JoinColumn(name = "sportdevicetypeid")
    )
    private Set<SportDeviceType> sportDeviceSportDeviceTypes;

    @OneToMany(mappedBy = "product")
    private Set<Service> productServices;

    @OneToMany(mappedBy = "product")
    private Set<OrderProduct> productOrderProducts;

}
