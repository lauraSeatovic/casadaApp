package com.casada.casadaApi.DTOs;

import com.casada.casadaApi.domain.Product;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class MassageChairProductDTO implements Serializable {
    private ProductDTO productDTO;
    private Integer massageChairClassId;
}
