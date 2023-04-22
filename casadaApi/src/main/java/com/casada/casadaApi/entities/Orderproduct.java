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
@Table(name = "orderproduct")
public class Orderproduct implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "orderid", nullable = false)
    private Long orderid;

    @Id
    @Column(name = "productid", nullable = false)
    private Long productid;

    @Column(name = "discount", nullable = false)
    private Double discount;

    @Column(name = "guarantee", nullable = false)
    private Long guarantee;

    @Column(name = "quantity", nullable = false)
    private Long quantity;

}
