package com.casada.casadaApi.mappers;

import com.casada.casadaApi.DTOs.OrderStatusDTO;
import com.casada.casadaApi.DTOs.PaymentMethodDTO;
import com.casada.casadaApi.domain.OrderStatus;
import com.casada.casadaApi.domain.PaymentMethod;
import org.springframework.stereotype.Component;

@Component
public class PaymentMethodMapper {
    public PaymentMethodDTO toDTO(PaymentMethod paymentMethod){
        return new PaymentMethodDTO(
                paymentMethod.getPaymentMethodId(),
                paymentMethod.getPaymentMethodName()
        );
    }

    public PaymentMethod toDomain(PaymentMethodDTO paymentMethod){
        return new PaymentMethod(
                paymentMethod.getPaymentMethodId(),
                paymentMethod.getPaymentMethodName()
        );
    }
}
