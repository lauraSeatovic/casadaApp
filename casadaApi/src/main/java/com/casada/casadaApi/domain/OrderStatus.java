package com.casada.casadaApi.domain;

import jakarta.persistence.*;

import java.util.Set;
import lombok.Getter;
import lombok.Setter;


@Entity
@Getter
@Setter
@Table(name = "orderstatus")
public class OrderStatus {

    @Id
    @Column(name = "orderstatusid", nullable = false, updatable = false)
    private Integer orderStatusId;

    @Column(name = "orderstatusname", nullable = false, length = 200)
    private String orderStatusName;

    @OneToMany(mappedBy = "orderStatus")
    private Set<OrderInfo> orderStatusOrderInfos;

}
