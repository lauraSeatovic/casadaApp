package com.casada.casadaApi.DTOs;


import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class PaymentMethodDTO implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer paymentMethodId;

    private String paymentMethodName;

    public PaymentMethodDTO(Integer paymentMethodId, String paymentMethodName) {
        this.paymentMethodId = paymentMethodId;
        this.paymentMethodName = paymentMethodName;
    }
}
