package com.casada.casadaApi.mappers;

import com.casada.casadaApi.DTOs.OrderInfoDTO;
import com.casada.casadaApi.domain.*;
import com.casada.casadaApi.repos.BuyerRepository;
import com.casada.casadaApi.repos.MemberRepository;
import com.casada.casadaApi.repos.OrderStatusRepository;
import com.casada.casadaApi.repos.PaymentMethodRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
public class OrderInfoMapper {

    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private BuyerRepository buyerRepository;

    @Autowired
    private OrderStatusRepository orderStatusRepository;

    @Autowired
    private PaymentMethodRepository paymentMethodRepository;

    public OrderInfoDTO toDTO(OrderInfo orderInfo){
        return new OrderInfoDTO(
                orderInfo.getOrderId(),
                orderInfo.getOrderDate(),
                orderInfo.getPersonalPickup(),
                orderInfo.getOrderNote(),
                orderInfo.getDeliveryPerson().getMemberId(),
                orderInfo.getSeller().getMemberId(),
                orderInfo.getBuyer().getBuyerId(),
                orderInfo.getBuyer().getBuyerName(),
                orderInfo.getBuyer().getBuyerSurname(),
                orderInfo.getOrderStatus().getOrderStatusId(),
                orderInfo.getOrderStatus().getOrderStatusName(),
                orderInfo.getPaymentMethod().getPaymentMethodId(),
                orderInfo.getPaymentMethod().getPaymentMethodName(),
                orderInfo.getDeliveryDate(),
                orderInfo.getOrderDiscount(),
                orderInfo.getOtherPayment(),
                orderInfo.getOrderDeposit(),
                orderInfo.getIsFullPaid(),
                orderInfo.getOrderNumber(),
                orderInfo.getOrderStatusNotifications()
        );
    }

    public OrderInfo toDomain(OrderInfoDTO orderInfo){
        Optional<Member> optionalDeliveryPerson = memberRepository.findById(orderInfo.getDeliveryPersonId());
        Optional<Member> optionalSeller = memberRepository.findById(orderInfo.getSellerId());
        Optional<Buyer> optionalBuyer = buyerRepository.findById(orderInfo.getBuyerId());
        Optional<OrderStatus> optionalOrderStatus = orderStatusRepository.findById(orderInfo.getOrderStatusId());
        Optional<PaymentMethod> optionalPaymentMethod = paymentMethodRepository.findById(orderInfo.getPaymentMethodId());

        if(optionalDeliveryPerson.isPresent() && optionalSeller.isPresent() && optionalBuyer.isPresent() && optionalOrderStatus.isPresent() && optionalPaymentMethod.isPresent()) {
            Member deliveryPerson = optionalDeliveryPerson.get();
            Member seller = optionalSeller.get();
            Buyer buyer = optionalBuyer.get();
            OrderStatus orderStatus = optionalOrderStatus.get();
            PaymentMethod paymentMethod = optionalPaymentMethod.get();
            return new OrderInfo(
                    orderInfo.getOrderId(),
                    orderInfo.getOrderDate(),
                    orderInfo.getPersonalPickup(),
                    orderInfo.getOrderNote(),
                    orderInfo.getDeliveryDate(),
                    orderInfo.getOrderDiscount(),
                    orderInfo.getOtherPayment(),
                    orderInfo.getOrderDeposit(),
                    orderInfo.getIsFullPaid(),
                    orderInfo.getOrderNumber(),
                    orderInfo.getOrderStatusNotifications(),
                    deliveryPerson,
                    seller,
                    buyer,
                    orderStatus,
                    paymentMethod
            );
        } else {
            throw new RuntimeException("Buyer, seller, deliveryPerson, orderStatus or paymentMethod not found");
        }
    }
}
