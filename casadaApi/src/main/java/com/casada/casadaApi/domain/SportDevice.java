package com.casada.casadaApi.domain;

import jakarta.persistence.*;
import lombok.Data;

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
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "productid")
    private Product product;
}

