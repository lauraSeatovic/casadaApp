package com.casada.casadaApi.DTOs;


import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class BuyerDTO implements Serializable {
    private Integer buyerId;

    private String buyerName;

    private String buyerSurname;

    private String buyerPhoneNumber;

    private String buyerHomeAddress;

    private String buyerDeliveryAddress;

    private String buyerEmail;

    private Integer homePostalCode;

    private String homePostalCodeName;

    private Integer deliveryPostalCode;

    private String deliveryPostalCodeName;

    public BuyerDTO(Integer buyerId, String buyerName, String buyerSurname, String buyerPhoneNumber, String buyerHomeAddress, String buyerDeliveryAddress, String buyerEmail, Integer homePostalCode, String homePostalCodeName, Integer deliveryPostalCode, String deliveryPostalCodeName) {
        this.buyerId = buyerId;
        this.buyerName = buyerName;
        this.buyerSurname = buyerSurname;
        this.buyerPhoneNumber = buyerPhoneNumber;
        this.buyerHomeAddress = buyerHomeAddress;
        this.buyerDeliveryAddress = buyerDeliveryAddress;
        this.buyerEmail = buyerEmail;
        this.homePostalCode = homePostalCode;
        this.homePostalCodeName = homePostalCodeName;
        this.deliveryPostalCode = deliveryPostalCode;
        this.deliveryPostalCodeName = deliveryPostalCodeName;
    }
}


