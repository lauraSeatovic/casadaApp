package com.casada.casadaApi.domain;

import jakarta.persistence.*;

import java.io.Serializable;
import java.util.Set;
import lombok.Getter;
import lombok.Setter;


@Entity
@Getter
@Setter
@Table(name = "role")
public class Role {

    @Id
    @Column(name = "roleid", nullable = false, updatable = false)
    private Integer roleId;

    @Column(name = "rolename", nullable = false, length = 200)
    private String roleName;

    @OneToMany(mappedBy = "role")
    private Set<Member> roleMembers;

}
