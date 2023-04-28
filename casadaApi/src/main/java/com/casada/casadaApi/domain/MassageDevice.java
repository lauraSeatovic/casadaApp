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
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "productid")
    private Product product;
}

