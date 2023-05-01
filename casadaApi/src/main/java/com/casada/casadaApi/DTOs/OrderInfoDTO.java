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

    private Integer sellerId;

    private Integer buyerId;

    private Integer orderStatusId;

    private Integer paymentMethodId;

    private String deliveryDate;

    private Double orderDiscount;

    private String otherPayment;

    private Double orderDeposit;

    private Boolean isFullPaid;

    private String orderNumber;

    private Boolean orderStatusNotifications;

    public OrderInfoDTO(Integer orderId, Date orderDate, Boolean personalPickup, String orderNote, Integer deliveryPersonId, Integer sellerId, Integer buyerId, Integer orderStatusId, Integer paymentMethodId, String deliveryDate, Double orderDiscount, String otherPayment, Double orderDeposit, Boolean isFullPaid, String orderNumber, Boolean orderStatusNotifications) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.personalPickup = personalPickup;
        this.orderNote = orderNote;
        this.deliveryPersonId = deliveryPersonId;
        this.sellerId = sellerId;
        this.buyerId = buyerId;
        this.orderStatusId = orderStatusId;
        this.paymentMethodId = paymentMethodId;
        this.deliveryDate = deliveryDate;
        this.orderDiscount = orderDiscount;
        this.otherPayment = otherPayment;
        this.orderDeposit = orderDeposit;
        this.isFullPaid = isFullPaid;
        this.orderNumber = orderNumber;
        this.orderStatusNotifications = orderStatusNotifications;
    }
}
