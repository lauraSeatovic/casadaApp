package com.casada.casadaApi.domain;

import jakarta.persistence.*;

import java.time.LocalDate;
import lombok.Getter;
import lombok.Setter;


@Entity
@Getter
@Setter
@Table(name = "service")
public class Service {

    @Id
    @Column(name = "serviceid", nullable = false, updatable = false)
    private Integer serviceId;

    @Column(name = "servicestartdate", nullable = false)
    private LocalDate serviceStartDate;

    @Column(name = "servicefinishdate")
    private LocalDate serviceFinishDate;

    @Column(name = "servicenote", length = 600)
    private String serviceNote;

    @Column(name = "serviceprice", nullable = false)
    private Double servicePrice;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "orderid", nullable = false)
    private OrderInfo order;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "productid", nullable = false)
    private Product product;

}
