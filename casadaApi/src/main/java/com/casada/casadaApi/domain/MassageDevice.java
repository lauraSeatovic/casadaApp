package com.casada.casadaApi.domain;

import jakarta.persistence.*;
import lombok.Data;

import java.io.Serializable;

@Data
@Entity
@Table(name = "massagedevice")
public class MassageDevice {
    @ManyToOne
    @JoinColumn(name = "massagedevicetypeid")
    private MassageDeviceType massageDeviceType;

    @Id
    @Column(name = "productid")
    private Integer productId;

    @MapsId
    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "productid")
    private Product product;

    public MassageDevice(){}

    public MassageDevice(MassageDeviceType massageDeviceType, Product product) {
        this.massageDeviceType = massageDeviceType;
        this.product = product;
        this.productId = product.getProductId();
    }
}

