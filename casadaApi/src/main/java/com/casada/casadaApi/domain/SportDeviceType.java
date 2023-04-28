package com.casada.casadaApi.domain;

import jakarta.persistence.*;

import java.util.Set;
import lombok.Getter;
import lombok.Setter;


@Entity
@Getter
@Setter
@Table(name = "sportdevicetype")
public class SportDeviceType {

    @Id
    @Column(name = "sportdevicetypeid", nullable = false, updatable = false)
    private Integer sportDeviceTypeId;

    @Column(name = "sportdevicetypename", nullable = false, length = 200)
    private String sportDeviceTypeName;

    @OneToMany(mappedBy = "sportDeviceType")
    private Set<SportDevice> sportDevices;

}
