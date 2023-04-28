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
    @Column(name = "massagedevicetypeid")
    private int massageDeviceTypeId;

    @Column(name = "massagedevicetypename")
    private String massageDeviceTypeName;

    @OneToMany(mappedBy = "massageDeviceType")
    private Set<MassageDevice> massageDevices;

}