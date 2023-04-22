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
@Table(name = "massagedevicetype")
public class Massagedevicetype implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "massagedevicetypeid", nullable = false)
    private Long massagedevicetypeid;

    @Column(name = "massagedevicetypename", nullable = false)
    private String massagedevicetypename;

}
