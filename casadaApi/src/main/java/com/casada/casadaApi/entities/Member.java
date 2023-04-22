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
@Table(name = "member")
public class Member implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "memberid", nullable = false)
    private Long memberid;

    @Column(name = "membername", nullable = false)
    private String membername;

    @Column(name = "membersurname", nullable = false)
    private String membersurname;

    @Column(name = "memberemail", nullable = false)
    private String memberemail;

    @Column(name = "memberpassword", nullable = false)
    private String memberpassword;

    @Column(name = "roleid", nullable = false)
    private Long roleid;

}
