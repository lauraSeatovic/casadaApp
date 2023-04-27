package com.casada.casadaApi.domain;

import jakarta.persistence.*;

import java.util.Set;
import lombok.Getter;
import lombok.Setter;


@Entity
@Getter
@Setter
@Table(name = "massagedevicetype")
public class MassageDeviceType {

    @Id
    @Column(name = "massagedevicetypeid", nullable = false, updatable = false)
    private Integer massageDeviceTypeId;

    @Column(name = "massagedevicetypename", nullable = false, length = 200)
    private String massageDeviceTypeName;

    @ManyToMany(mappedBy = "massageDeviceMassageDeviceTypes")
    private Set<Product> massageDeviceProducts;

}
