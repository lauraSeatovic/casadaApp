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

    private Integer productId;

    public ServiceDTO(Integer serviceid, Date servicestartdate, Date servicefinishdate, String servicenote, Double serviceprice, Integer orderid, Integer productid) {
        this.serviceId = serviceid;
        this.serviceStartDate = servicestartdate;
        this.serviceFinishDate = servicefinishdate;
        this.serviceNote = servicenote;
        this.servicePrice = serviceprice;
        this.orderId = orderid;
        this.productId = productid;
    }
}
