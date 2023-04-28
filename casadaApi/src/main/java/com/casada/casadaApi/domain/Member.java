package com.casada.casadaApi.domain;

import jakarta.persistence.*;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Set;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "member")
public class Member {

    @Id
    @Column(name = "memberid", nullable = false, updatable = false)
    private Integer memberId;

    @Column(name = "membername", nullable = false, length = 100)
    private String memberName;

    @Column(name = "membersurname", nullable = false, length = 100)
    private String memberSurname;

    @Column(name = "memberemail", nullable = false, length = 200)
    private String memberEmail;

    @Column(name = "memberpassword", nullable = false, length = 200)
    private String memberPassword;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "roleid", nullable = false)
    private Role role;

    @OneToMany(mappedBy = "seller")
    private Set<OrderInfo> sellerOrderInfos;

    @OneToMany(mappedBy = "deliveryPerson")
    private Set<OrderInfo> deliveryPersonOrderInfos;

    public Member() {
    }

    public Member(Integer memberId, String memberName, String memberSurname, String memberEmail, String memberPassword, Role role) {
        this.memberId = memberId;
        this.memberName = memberName;
        this.memberSurname = memberSurname;
        this.memberEmail = memberEmail;
        this.memberPassword = memberPassword;
        this.role = role;
    }
}
