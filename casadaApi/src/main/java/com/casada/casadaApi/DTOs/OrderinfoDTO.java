package com.casada.casadaApi.DTOs;


import java.io.Serializable;
import java.sql.Date;

@lombok.Data
public class OrderinfoDTO implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long orderid;

    private Date orderdate;

    private Boolean personalpickup;

    private String ordernote;

    private Long deliverypersonid;

    private Long sellerid;

    private Long buyerid;

    private Long orderstatusid;

    private Long paymentmethodid;

    private String deliverydate;

    private Double orderdiscount;

    private String otherpayment;

    private Double orderdeposit;

    private Boolean isfullpaid;

    private String ordernumber;

    private Boolean orderstatusnotifications;

}
