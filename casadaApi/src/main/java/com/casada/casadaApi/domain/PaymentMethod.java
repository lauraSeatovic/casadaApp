package com.casada.casadaApi.domain;

import jakarta.persistence.*;

import java.util.Set;
import lombok.Getter;
import lombok.Setter;


@Entity
@Getter
@Setter
@Table(name = "paymentmethod")
public class PaymentMethod {

    @Id
    @Column(name = "paymentmethodid", nullable = false, updatable = false)
    private Integer paymentMethodId;

    @Column(name = "paymentmethodname", nullable = false, length = 200)
    private String paymentMethodName;

    @OneToMany(mappedBy = "paymentMethod")
    private Set<OrderInfo> paymentMethodOrderInfos;

    public PaymentMethod(){}

    public PaymentMethod(Integer paymentMethodId, String paymentMethodName) {
        this.paymentMethodId = paymentMethodId;
        this.paymentMethodName = paymentMethodName;
    }
}
