package com.casada.casadaApi.DTOs;


import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class OrderStatusDTO implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer orderStatusId;

    private String orderStatusName;

    public OrderStatusDTO(Integer orderStatusId, String orderStatusName) {
        this.orderStatusId = orderStatusId;
        this.orderStatusName = orderStatusName;
    }
}
