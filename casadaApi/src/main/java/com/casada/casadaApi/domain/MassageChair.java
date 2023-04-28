package com.casada.casadaApi.domain;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Set;

@Data
@Entity
@Table(name = "massagechair")
public class MassageChair {

    @ManyToOne
    @JoinColumn(name = "massagechairclassid")
    private MassageChairClass massageChairClass;

    @Id
    @Column(name = "productid")
    private Integer productId;

    @MapsId
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "productid")
    private Product product;


    @OneToMany(mappedBy = "massageChair")
    private Set<MassageChairColor> massageChair;

}
