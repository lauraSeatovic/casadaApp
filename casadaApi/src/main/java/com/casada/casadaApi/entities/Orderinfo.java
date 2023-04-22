package com.casada.casadaApi.entities;

import lombok.Data;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.io.Serializable;
import java.sql.Date;

/**
 * $table.getTableComment()
 */
@Data
@Entity
@Table(name = "orderinfo")
public class Orderinfo implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "orderid", nullable = false)
    private Long orderid;

    @Column(name = "orderdate", nullable = false)
    private Date orderdate;

    @Column(name = "personalpickup", nullable = false)
    private Boolean personalpickup;

    @Column(name = "ordernote")
    private String ordernote;

    @Column(name = "deliverypersonid")
    private Long deliverypersonid;

    @Column(name = "sellerid", nullable = false)
    private Long sellerid;

    @Column(name = "buyerid", nullable = false)
    private Long buyerid;

    @Column(name = "orderstatusid", nullable = false)
    private Long orderstatusid;

    @Column(name = "paymentmethodid", nullable = false)
    private Long paymentmethodid;

    @Column(name = "deliverydate", nullable = false)
    private String deliverydate;

    @Column(name = "orderdiscount", nullable = false)
    private Double orderdiscount;

    @Column(name = "otherpayment")
    private String otherpayment;

    @Column(name = "orderdeposit")
    private Double orderdeposit;

    @Column(name = "isfullpaid", nullable = false)
    private Boolean isfullpaid;

    @Column(name = "ordernumber", nullable = false)
    private String ordernumber;

    @Column(name = "orderstatusnotifications", nullable = false)
    private Boolean orderstatusnotifications;

}
