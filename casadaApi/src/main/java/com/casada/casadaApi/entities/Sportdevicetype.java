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
@Table(name = "sportdevicetype")
public class Sportdevicetype implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "sportdevicetypeid", nullable = false)
    private Long sportdevicetypeid;

    @Column(name = "sportdevicetypename", nullable = false)
    private String sportdevicetypename;

}
