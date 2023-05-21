package com.casada.casadaApi.DTOs;


import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.time.LocalDate;
import java.sql.Date;

@Getter
@Setter
public class OrderInfoDTO implements Serializable {
    private Integer orderId;

    private Date orderDate;

    private Boolean personalPickup;

    private String orderNote;

    private Integer deliveryPersonId;

    private String deliveryPersonName;

    private String deliveryPersonSurname;

    private Integer sellerId;

    private String sellerName;

    private String sellerSurname;

    private Integer buyerId;

    private String buyerName;

    private String buyerSurname;

    private Integer orderStatusId;

    private String orderStatusName;

    private Integer paymentMethodId;

    private String paymentMethodName;

    private String deliveryDate;

    private Double orderDiscount;

    private String otherPayment;

    private Double orderDeposit;

    private Boolean isFullPaid;

    private String orderNumber;

    private Boolean orderStatusNotifications;

    public OrderInfoDTO(Integer orderId, Date orderDate, Boolean personalPickup, String orderNote, Integer deliveryPersonId, String deliveryPersonName, String deliveryPersonSurname, Integer sellerId, String sellerName, String sellerSurname, Integer buyerId, String buyerName, String buyerSurname, Integer orderStatusId, String orderStatusName, Integer paymentMethodId, String paymentMethodName, String deliveryDate, Double orderDiscount, String otherPayment, Double orderDeposit, Boolean isFullPaid, String orderNumber, Boolean orderStatusNotifications) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.personalPickup = personalPickup;
        this.orderNote = orderNote;
        this.deliveryPersonId = deliveryPersonId;
        this.deliveryPersonName = deliveryPersonName;
        this.deliveryPersonSurname = deliveryPersonSurname;
        this.sellerId = sellerId;
        this.sellerName = sellerName;
        this.sellerSurname = sellerSurname;
        this.buyerId = buyerId;
        this.buyerName = buyerName;
        this.buyerSurname = buyerSurname;
        this.orderStatusId = orderStatusId;
        this.orderStatusName = orderStatusName;
        this.paymentMethodId = paymentMethodId;
        this.paymentMethodName = paymentMethodName;
        this.deliveryDate = deliveryDate;
        this.orderDiscount = orderDiscount;
        this.otherPayment = otherPayment;
        this.orderDeposit = orderDeposit;
        this.isFullPaid = isFullPaid;
        this.orderNumber = orderNumber;
        this.orderStatusNotifications = orderStatusNotifications;
    }
}
