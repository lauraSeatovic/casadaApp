package com.casada.casadaApi.DTOs;


import java.io.Serializable;
import java.sql.Date;

@lombok.Data
public class ServiceDTO implements Serializable {
    private Integer serviceId;

    private Date serviceStartDate;

    private Date serviceFinishDate;

    private String serviceNote;

    private Double servicePrice;

    private Integer orderId;

    private String orderNumber;

    private Integer productId;

    private String productName;

    public ServiceDTO(Integer serviceId, Date serviceStartDate, Date serviceFinishDate, String serviceNote, Double servicePrice, Integer orderId, String orderNumber, Integer productId, String productName) {
        this.serviceId = serviceId;
        this.serviceStartDate = serviceStartDate;
        this.serviceFinishDate = serviceFinishDate;
        this.serviceNote = serviceNote;
        this.servicePrice = servicePrice;
        this.orderId = orderId;
        this.orderNumber = orderNumber;
        this.productId = productId;
        this.productName = productName;
    }
}
