package com.casada.casadaApi.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@IdClass(MassageChairColorId.class)
@Table(name = "massagechaircolor")
public class MassageChairColor {
    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "colorid", nullable = false)
    private Color color;

    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "productid", nullable = false)
    private MassageChair massageChair;
}
