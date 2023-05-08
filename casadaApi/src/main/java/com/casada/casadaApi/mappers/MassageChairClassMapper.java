package com.casada.casadaApi.mappers;

import com.casada.casadaApi.DTOs.MassageChairClassDTO;
import com.casada.casadaApi.DTOs.PaymentMethodDTO;
import com.casada.casadaApi.domain.MassageChairClass;
import com.casada.casadaApi.domain.PaymentMethod;
import org.springframework.stereotype.Component;

@Component
public class MassageChairClassMapper {
    public MassageChairClassDTO toDTO(MassageChairClass massageChairClass){
        return new MassageChairClassDTO(
                massageChairClass.getMassageChairClassId(),
                massageChairClass.getMassageChairClassName()
        );
    }

    public MassageChairClass toDomain(MassageChairClassDTO massageChairClass){
        return new MassageChairClass(
                massageChairClass.getMassageChairClassId(),
                massageChairClass.getMassageChairClassName()
        );
    }
}
