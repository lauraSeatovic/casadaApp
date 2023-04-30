package com.casada.casadaApi.domain;

import jakarta.persistence.*;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.Collections;
import java.util.Set;

@Getter
@Setter
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
    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "productid")
    private Product product;


    @OneToMany(mappedBy = "massageChair")
    private Set<MassageChairColor> massageChair;

    public MassageChair(){}

    public MassageChair(MassageChairClass massageChairClass, Product product) {
        this.massageChairClass = massageChairClass;
        this.product = product;
        this.productId = product.getProductId();
        this.massageChair = Collections.emptySet();
    }
}
