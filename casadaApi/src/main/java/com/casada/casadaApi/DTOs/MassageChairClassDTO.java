package com.casada.casadaApi.DTOs;


import java.io.Serializable;

@lombok.Data
public class MassageChairClassDTO implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer massageChairClassId;

    private String massageChairClassName;

    public MassageChairClassDTO(Integer massageChairClassId, String massageChairClassName) {
        this.massageChairClassId = massageChairClassId;
        this.massageChairClassName = massageChairClassName;
    }
}
