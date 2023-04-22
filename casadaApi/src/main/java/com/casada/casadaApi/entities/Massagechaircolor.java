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
@Table(name = "massagechaircolor")
public class Massagechaircolor implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "colorid", nullable = false)
    private Long colorid;

    @Id
    @Column(name = "productid", nullable = false)
    private Long productid;

}
