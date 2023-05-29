package com.casada.casadaApi.services.implementations;

import com.casada.casadaApi.DTOs.BuyerDTO;
import com.casada.casadaApi.DTOs.MemberDTO;
import com.casada.casadaApi.DTOs.NewOrderDTO;
import com.casada.casadaApi.DTOs.OrderInfoDTO;
import com.casada.casadaApi.domain.*;
import com.casada.casadaApi.mappers.BuyerMapper;
import com.casada.casadaApi.mappers.OrderInfoMapper;
import com.casada.casadaApi.repos.*;
import com.casada.casadaApi.services.OrderInfoService;
import jakarta.mail.MessagingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.concurrent.CompletableFuture;
import java.util.stream.Collectors;

@Service
public class OrderInfoServiceImpl implements OrderInfoService {

    @Autowired
    private OrderInfoRepository orderInfoRepository;

    @Autowired
    private OrderStatusRepository orderStatusRepository;

    @Autowired
    private OrderInfoMapper orderInfoMapper;

    @Autowired
    private BuyerMapper buyerMapper;

    @Autowired
    private BuyerServiceImpl buyerService;

    @Autowired
    private OrderProductServiceImpl orderProductService;

    @Autowired
    private PDFServiceImpl pdfService;

    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private BuyerRepository buyerRepository;

    @Autowired
    private PaymentMethodRepository paymentMethodRepository;

    @Autowired
    private EmailService emailService;


    public List<OrderInfoDTO> findAll() {
        return orderInfoRepository.findAll().stream()
                .map(orderInfoMapper::toDTO).collect(Collectors.toList());
    }

    public OrderInfo addOrderInfo(OrderInfoDTO orderInfo) {
        OrderInfo order = orderInfoMapper.toDomain(orderInfo);
        OrderInfo savedOrder = orderInfoRepository.save(order);
        Integer generatedId = savedOrder.getOrderId();
        savedOrder.setOrderNumber(generatedId.toString() + "-" + order.getOrderDate());
        return orderInfoRepository.save(savedOrder);
    }

    public OrderInfo updateOrder(OrderInfoDTO orderInfo) {
        Optional<OrderInfo> optionalOrderInfo = orderInfoRepository.findById(orderInfo.getOrderId());
        Optional<Member> optionalDeliveryPerson = memberRepository.findById(orderInfo.getDeliveryPersonId());
        Optional<Member> optionalSeller = memberRepository.findById(orderInfo.getSellerId());
        Optional<PaymentMethod> optionalPaymentMethod = paymentMethodRepository.findById(orderInfo.getPaymentMethodId());
        if(optionalOrderInfo.isPresent() && optionalDeliveryPerson.isPresent() && optionalSeller.isPresent() && optionalPaymentMethod.isPresent()){
            OrderInfo oldOrder = optionalOrderInfo.get();
            Member delivery = optionalDeliveryPerson.get();
            Member seller = optionalSeller.get();
            PaymentMethod paymentMethod = optionalPaymentMethod.get();
            oldOrder.setOrderId(orderInfo.getOrderId());
            oldOrder.setOrderDate(orderInfo.getOrderDate());
            oldOrder.setPersonalPickup(orderInfo.getPersonalPickup());
            oldOrder.setOrderNote(orderInfo.getOrderNote());
            oldOrder.setDeliveryPerson(delivery);
            oldOrder.setSeller(seller);
            oldOrder.setPaymentMethod(paymentMethod);
            oldOrder.setDeliveryDate(orderInfo.getDeliveryDate());
            oldOrder.setOrderDiscount(orderInfo.getOrderDiscount());
            oldOrder.setOtherPayment(orderInfo.getOtherPayment());
            oldOrder.setOrderDeposit(orderInfo.getOrderDeposit());
            oldOrder.setIsFullPaid(orderInfo.getIsFullPaid());
            oldOrder.setOrderStatusNotifications(orderInfo.getOrderStatusNotifications());
            return orderInfoRepository.save(oldOrder);
        }else {
            throw new RuntimeException("Seller, deliveryPerson, order or paymentMethod not found");
        }
    }

    public int addOrderInfoGetId(OrderInfoDTO orderInfo) {
        OrderInfo order = orderInfoMapper.toDomain(orderInfo);
        OrderInfo savedOrder = orderInfoRepository.save(order);
        Integer generatedId = savedOrder.getOrderId();
        savedOrder.setOrderNumber(generatedId.toString() + "-" + order.getOrderDate());
        orderInfoRepository.save(savedOrder);
        return generatedId;
    }

    public OrderInfoDTO findById(Integer orderId) {
        Optional<OrderInfo> orderInfoOptional = orderInfoRepository.findById(orderId);
        if (orderInfoOptional.isPresent()) {
            return orderInfoMapper.toDTO(orderInfoOptional.get());
        } else {
            throw new RuntimeException("Order not found");
        }
    }

    public OrderInfo findByIdDomain(Integer orderId) {
        Optional<OrderInfo> orderInfoOptional = orderInfoRepository.findById(orderId);
        if (orderInfoOptional.isPresent()) {
            return orderInfoOptional.get();
        } else {
            throw new RuntimeException("Order not found");
        }
    }

    public void removeOrder(int orderId) {
        orderInfoRepository.deleteById(orderId);
    }

    public void changeOrderStatus(int orderId, int statusId) {
        Optional<OrderInfo> orderInfoOptional = orderInfoRepository.findById(orderId);
        Optional<OrderStatus> orderStatusOptional = orderStatusRepository.findById(statusId);
        if (orderInfoOptional.isPresent() && orderStatusOptional.isPresent()) {
            OrderInfo orderInfo = orderInfoOptional.get();
            OrderStatus orderStatus = orderStatusOptional.get();
            orderInfo.setOrderStatus(orderStatus);
            orderInfoRepository.save(orderInfo);
        } else {
            throw new RuntimeException("Order or status not found");
        }
    }

    public int newOrder(NewOrderDTO newOrderDTO) {
        //OrderInfo orderInfo = orderInfoMapper.toDomain(newOrderDTO.getOrder());
        if (newOrderDTO.getOldBuyerId() == 0) {
            newOrderDTO.getBuyer().setBuyerId(0);
            System.out.println(newOrderDTO.getBuyer().getHomePostalCode());
            int buyerId = buyerService.addNewBuyer(newOrderDTO.getBuyer());
            newOrderDTO.getOrder().setBuyerId(buyerId);
        } else {
            System.out.println(newOrderDTO.getOldBuyerId());
            newOrderDTO.getOrder().setBuyerId(newOrderDTO.getOldBuyerId());
        }
        newOrderDTO.getOrder().setOrderStatusId(4);
        newOrderDTO.getOrder().setOrderNumber("");
        newOrderDTO.getOrder().setOrderId(0);
        int orderId = addOrderInfoGetId(newOrderDTO.getOrder());
        newOrderDTO.getProducts().forEach(orderProductDTO -> {
            orderProductDTO.setOrderid(orderId);
            OrderProduct tempProduct = orderProductService.addNewProduct(orderProductDTO);
        });
        return orderId;
    }
}
