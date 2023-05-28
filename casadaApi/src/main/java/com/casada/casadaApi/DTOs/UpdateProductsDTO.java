package com.casada.casadaApi.DTOs;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;

@Getter
@Setter
public class UpdateProductsDTO implements Serializable {
    private List<OrderProductDTO> products;
}
