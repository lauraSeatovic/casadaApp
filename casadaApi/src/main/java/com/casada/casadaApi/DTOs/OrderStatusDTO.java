package com.casada.casadaApi.DTOs;


import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class OrderStatusDTO implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long orderStatusId;

    private String orderStatusName;

}
