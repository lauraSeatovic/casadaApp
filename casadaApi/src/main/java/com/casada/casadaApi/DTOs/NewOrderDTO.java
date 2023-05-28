package com.casada.casadaApi.DTOs;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;

@Getter
@Setter
public class NewOrderDTO implements Serializable {
    private Integer oldBuyerId;
    private BuyerDTO buyer;
    private OrderInfoDTO order;
    private List<OrderProductDTO> products;
}
