package com.casada.casadaApi.DTOs;


import java.io.Serializable;
import java.sql.Date;

@lombok.Data
public class ServiceDTO implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long serviceid;

    private Date servicestartdate;

    private Date servicefinishdate;

    private String servicenote;

    private Double serviceprice;

    private Long orderid;

    private Long productid;

}
