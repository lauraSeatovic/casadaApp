package com.casada.casadaApi.DTOs;


import java.io.Serializable;

@lombok.Data
public class BuyerDTO implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long buyerid;

    private String buyername;

    private String buyersurname;

    private String buyerphonenumber;

    private String buyerhomeaddress;

    private String buyerdeliveryaddress;

    private String buyeremail;

    private Long homepostalcode;

    private Long deliverypostalcode;

}
