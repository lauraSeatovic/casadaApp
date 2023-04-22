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
@Table(name = "paymentmethod")
public class Paymentmethod implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "paymentmethodid", nullable = false)
    private Long paymentmethodid;

    @Column(name = "paymentmethodname", nullable = false)
    private String paymentmethodname;

}
