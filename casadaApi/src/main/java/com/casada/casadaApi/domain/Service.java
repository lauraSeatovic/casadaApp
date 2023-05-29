package com.casada.casadaApi.domain;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.sql.Date;

import lombok.Getter;
import lombok.Setter;


@Entity
@Getter
@Setter
@Table(name = "service")
public class Service {

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "serviceid", nullable = false, updatable = false)
    private Integer serviceId;

    @Column(name = "servicestartdate", nullable = false)
    private Date serviceStartDate;

    @Column(name = "servicefinishdate")
    private Date serviceFinishDate;

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

    public Service(){}

    public Service(Integer serviceId, Date serviceStartDate, Date serviceFinishDate, String serviceNote, Double servicePrice, OrderInfo order, Product product) {
        this.serviceId = serviceId;
        this.serviceStartDate = serviceStartDate;
        this.serviceFinishDate = serviceFinishDate;
        this.serviceNote = serviceNote;
        this.servicePrice = servicePrice;
        this.order = order;
        this.product = product;
    }
}
