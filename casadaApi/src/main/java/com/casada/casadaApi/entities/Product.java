package com.casada.casadaApi.entities;

import lombok.Data;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.io.Serializable;

/**
 * $table.getTableComment()
 */
@Data
@Entity
@Table(name = "product")
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "productid", nullable = false)
    private Long productid;

    @Column(name = "productname", nullable = false)
    private String productname;

    @Column(name = "productprice", nullable = false)
    private Double productprice;

    @Column(name = "productactivestatus", nullable = false)
    private Boolean productactivestatus;

    @Column(name = "productcode")
    private String productcode;

}
