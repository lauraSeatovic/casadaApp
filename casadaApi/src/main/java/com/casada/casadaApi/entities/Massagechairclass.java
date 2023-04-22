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
@Table(name = "massagechairclass")
public class Massagechairclass implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "massagechairclassid", nullable = false)
    private Long massagechairclassid;

    @Column(name = "massagechairclassname", nullable = false)
    private String massagechairclassname;

}
