package com.casada.casadaApi.DTOs;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StatusAndOrderDTO {
    private Integer orderId;
    private Integer newStatusId;

    public StatusAndOrderDTO(Integer orderId, Integer newStatusId) {
        this.orderId = orderId;
        this.newStatusId = newStatusId;
    }
}
