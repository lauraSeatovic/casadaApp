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
@Table(name = "service")
public class Service implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "serviceid", nullable = false)
    private Long serviceid;

    @Column(name = "servicestartdate", nullable = false)
    private Date servicestartdate;

    @Column(name = "servicefinishdate")
    private Date servicefinishdate;

    @Column(name = "servicenote")
    private String servicenote;

    @Column(name = "serviceprice", nullable = false)
    private Double serviceprice;

    @Column(name = "orderid", nullable = false)
    private Long orderid;

    @Column(name = "productid", nullable = false)
    private Long productid;

}
