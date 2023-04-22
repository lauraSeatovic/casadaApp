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
@Table(name = "buyer")
public class Buyer implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "buyerid", nullable = false)
    private Long buyerid;

    @Column(name = "buyername", nullable = false)
    private String buyername;

    @Column(name = "buyersurname", nullable = false)
    private String buyersurname;

    @Column(name = "buyerphonenumber", nullable = false)
    private String buyerphonenumber;

    @Column(name = "buyerhomeaddress", nullable = false)
    private String buyerhomeaddress;

    @Column(name = "buyerdeliveryaddress")
    private String buyerdeliveryaddress;

    @Column(name = "buyeremail")
    private String buyeremail;

    @Column(name = "homepostalcode", nullable = false)
    private Long homepostalcode;

    @Column(name = "deliverypostalcode")
    private Long deliverypostalcode;

}
