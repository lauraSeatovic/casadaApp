package com.casada.casadaApi.domain;

import jakarta.persistence.*;

import java.util.Set;
import lombok.Getter;
import lombok.Setter;


@Entity
@Getter
@Setter
@Table(name = "city")
public class City {

    @Id
    @Column(name = "citypostalcode", nullable = false, updatable = false)
    private Integer cityPostalCode;

    @Column(name = "cityname", nullable = false, length = 200)
    private String cityName;

    @OneToMany(mappedBy = "homePostalCode")
    private Set<Buyer> homePostalCodeBuyers;

    @OneToMany(mappedBy = "deliveryPostalCode")
    private Set<Buyer> deliveryPostalCodeBuyers;

    public City(Integer cityPostalCode, String cityName) {
        this.cityPostalCode = cityPostalCode;
        this.cityName = cityName;
    }

    public City(){}
}
