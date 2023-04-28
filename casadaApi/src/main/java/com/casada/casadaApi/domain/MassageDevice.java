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
    @ManyToOne
    @JoinColumn(name = "productid")
    private Product product;
}

