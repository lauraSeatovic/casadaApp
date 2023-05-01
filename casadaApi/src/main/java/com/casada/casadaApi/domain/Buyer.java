package com.casada.casadaApi.domain;

import jakarta.persistence.*;

import java.util.Set;
import lombok.Getter;
import lombok.Setter;


@Entity
@Getter
@Setter
@Table(name = "buyer")
public class Buyer {

    @Id
    @Column(name = "buyerid", nullable = false, updatable = false)
    private Integer buyerId;

    @Column(name = "buyername", nullable = false, length = 100)
    private String buyerName;

    @Column(name = "buyersurname", nullable = false, length = 100)
    private String buyerSurname;

    @Column(name = "buyerphonenumber", nullable = false, length = 30)
    private String buyerPhoneNumber;

    @Column(name = "buyerhomeaddress", nullable = false, length = 200)
    private String buyerHomeAddress;

    @Column(name = "buyerdeliveryaddress", length = 200)
    private String buyerDeliveryAddress;

    @Column(name = "buyeremail", length = 200)
    private String buyerEmail;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "homepostalcode", nullable = false)
    private City homePostalCode;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "deliverypostalcode")
    private City deliveryPostalCode;

    @OneToMany(mappedBy = "buyer")
    private Set<OrderInfo> buyerOrderInfos;

    public Buyer(){}

    public Buyer(Integer buyerId, String buyerName, String buyerSurname, String buyerPhoneNumber, String buyerHomeAddress, String buyerDeliveryAddress, String buyerEmail, City homePostalCode, City deliveryPostalCode) {
        this.buyerId = buyerId;
        this.buyerName = buyerName;
        this.buyerSurname = buyerSurname;
        this.buyerPhoneNumber = buyerPhoneNumber;
        this.buyerHomeAddress = buyerHomeAddress;
        this.buyerDeliveryAddress = buyerDeliveryAddress;
        this.buyerEmail = buyerEmail;
        this.homePostalCode = homePostalCode;
        this.deliveryPostalCode = deliveryPostalCode;
    }
}
