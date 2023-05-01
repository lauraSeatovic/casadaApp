package com.casada.casadaApi.domain;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.sql.Date;
import java.util.Set;
import lombok.Getter;
import lombok.Setter;


@Entity
@Getter
@Setter
@Table(name = "orderinfo")
public class OrderInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "orderid", nullable = false, updatable = false)
    private Integer orderId;

    @Column(name = "orderdate", nullable = false)
    private Date orderDate;

    @Column(name = "personalpickup", nullable = false)
    private Boolean personalPickup;

    @Column(name = "ordernote", length = 600)
    private String orderNote;

    @Column(name = "deliverydate", nullable = false, length = 200)
    private String deliveryDate;

    @Column(name = "orderdiscount", nullable = false)
    private Double orderDiscount;

    @Column(name = "otherpayment", length = 200)
    private String otherPayment;

    @Column(name = "orderdeposit")
    private Double orderDeposit;

    @Column(name = "isfullpaid", nullable = false)
    private Boolean isFullPaid;

    @Column(name = "ordernumber", nullable = false, length = 50)
    private String orderNumber;

    @Column(name = "orderstatusnotifications", nullable = false)
    private Boolean orderStatusNotifications;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "sellerid", nullable = false)
    private Member seller;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "deliverypersonid")
    private Member deliveryPerson;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "buyerid", nullable = false)
    private Buyer buyer;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "orderstatusid", nullable = false)
    private OrderStatus orderStatus;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "paymentmethodid", nullable = false)
    private PaymentMethod paymentMethod;

    @OneToMany(mappedBy = "order")
    private Set<Service> orderServices;

    @OneToMany(mappedBy = "order")
    private Set<OrderProduct> orderOrderProducts;

    public OrderInfo(){}

    public OrderInfo(Integer orderId, Date orderDate, Boolean personalPickup, String orderNote, String deliveryDate, Double orderDiscount, String otherPayment, Double orderDeposit, Boolean isFullPaid, String orderNumber, Boolean orderStatusNotifications, Member seller, Member deliveryPerson, Buyer buyer, OrderStatus orderStatus, PaymentMethod paymentMethod) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.personalPickup = personalPickup;
        this.orderNote = orderNote;
        this.deliveryDate = deliveryDate;
        this.orderDiscount = orderDiscount;
        this.otherPayment = otherPayment;
        this.orderDeposit = orderDeposit;
        this.isFullPaid = isFullPaid;
        this.orderNumber = orderNumber;
        this.orderStatusNotifications = orderStatusNotifications;
        this.seller = seller;
        this.deliveryPerson = deliveryPerson;
        this.buyer = buyer;
        this.orderStatus = orderStatus;
        this.paymentMethod = paymentMethod;
    }
}