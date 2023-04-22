package com.casada.casadaApi.DTOs;


import java.io.Serializable;

@lombok.Data
public class PaymentmethodDTO implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long paymentmethodid;

    private String paymentmethodname;

}
