package com.casada.casadaApi.domain;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Collections;

@Data
@Entity
@Table(name = "sportdevice")
public class SportDevice {
    @ManyToOne
    @JoinColumn(name = "sportdevicetypeid")
    private SportDeviceType sportDeviceType;

    @Id
    @Column(name = "productid")
    private Integer productId;

    @MapsId
    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "productid")
    private Product product;

    public SportDevice(){}

    public SportDevice(SportDeviceType sportDeviceType, Product product) {
        this.sportDeviceType = sportDeviceType;
        this.product = product;
        this.productId = product.getProductId();
    }
}

