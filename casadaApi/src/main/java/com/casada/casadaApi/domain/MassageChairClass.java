package com.casada.casadaApi.domain;

import jakarta.persistence.*;

import java.util.Set;
import lombok.Getter;
import lombok.Setter;


@Entity
@Getter
@Setter
@Table(name = "massagechairclass")
public class MassageChairClass {

    @Id
    @Column(name = "massagechairclassid", nullable = false, updatable = false)
    private Integer massageChairClassId;

    @Column(name = "massagechairclassname", nullable = false, length = 200)
    private String massageChairClassName;

    @OneToMany(mappedBy = "massageChairClass")
    private Set<MassageChair> massageChairs;

}
