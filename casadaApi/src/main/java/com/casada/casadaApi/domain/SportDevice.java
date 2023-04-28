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
    @ManyToOne
    @JoinColumn(name = "productid")
    private Product product;
}

