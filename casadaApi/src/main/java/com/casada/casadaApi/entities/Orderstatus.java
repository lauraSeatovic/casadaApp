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
@Table(name = "orderstatus")
public class Orderstatus implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "orderstatusid", nullable = false)
    private Long orderstatusid;

    @Column(name = "orderstatusname", nullable = false)
    private String orderstatusname;

}
