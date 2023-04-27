package com.casada.casadaApi.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;


@Entity
@Getter
@Setter
@Table(name = "color")
public class Color {

    @Id
    @Column(name = "colorid", nullable = false, updatable = false)
    private Integer colorId;

    @Column(name = "colorname", nullable = false, length = 200)
    private String colorName;

}
