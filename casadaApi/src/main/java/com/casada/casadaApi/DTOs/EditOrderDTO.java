package com.casada.casadaApi.DTOs;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class EditOrderDTO implements Serializable {
    private OrderInfoDTO order;
}
