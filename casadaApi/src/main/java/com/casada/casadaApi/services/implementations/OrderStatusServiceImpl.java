package com.casada.casadaApi.services.implementations;

import com.casada.casadaApi.DTOs.*;
import com.casada.casadaApi.domain.OrderStatus;
import com.casada.casadaApi.mappers.OrderStatusMapper;
import com.casada.casadaApi.mappers.PaymentMethodMapper;
import com.casada.casadaApi.repos.OrderStatusRepository;
import com.casada.casadaApi.repos.PaymentMethodRepository;
import com.casada.casadaApi.services.OrderInfoService;
import com.casada.casadaApi.services.OrderStatusService;
import jakarta.mail.MessagingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class OrderStatusServiceImpl implements OrderStatusService {

    @Autowired
    private OrderStatusRepository orderStatusRepository;

    @Autowired
    private OrderStatusMapper orderStatusMapper;

    @Autowired
    private PDFServiceImpl pdfService;

    @Autowired
    private EmailService emailService;

    @Autowired
    private OrderInfoServiceImpl orderInfoService;

    @Autowired
    private BuyerServiceImpl buyerService;

    public List<OrderStatusDTO> findAll() {
        return orderStatusRepository.findAll().stream()
                .map(orderStatusMapper::toDTO).collect(Collectors.toList());
    }

    public OrderStatusDTO findById(Integer id) {
        Optional<OrderStatus> orderStatusOptional = orderStatusRepository.findById(id);
        if (orderStatusOptional.isPresent()) {
            return orderStatusMapper.toDTO(orderStatusOptional.get());
        } else {
            throw new RuntimeException("OrderStatus not found");
        }
    }

    public void sendChangeOrderStatusMail(int orderId, int statusId) throws MessagingException {
        byte[] pdf = pdfService.generatePDF(orderId);
        emailService.sendEmailWithAttachment("laura.seatovic@gmail.com", "narudzba", "lp", pdf, "narudzbenica.pdf");

    }

    public void changeOrderStatus(StatusAndOrderDTO statusAndOrderDTO) {
        int orderId = statusAndOrderDTO.getOrderId();
        int statusId = statusAndOrderDTO.getNewStatusId();
        OrderInfoDTO order = orderInfoService.findById(orderId);
        BuyerDTO buyer = buyerService.findById(order.getBuyerId());
        orderInfoService.changeOrderStatus(orderId, statusId);
        switch (statusId) {
            case 1:
                System.out.println("narudzbenica");
                byte[] pdf = pdfService.generatePDF(orderId);
                String body = """
                        Poštovani,

                        U prilogu Vam šaljemo narudžbenicu.

                        Lijep pozdrav, Casada""";
                try {
                    emailService.sendEmailWithAttachment(buyer.getBuyerEmail(), "narudzba-casada", body, pdf, "narudzbenica.pdf");
                } catch (MessagingException e) {
                    e.printStackTrace();
                }
                break;
            case 2:
                System.out.println("dostava");
                String body2 = String.format("""
                                Poštovani,

                                Vaša narudžba je spremna za dostavu te će uskoro biti dostavljena na Vašu adresu.

                                Adresa dostave: %s, %s

                                Lijep pozdrav, Casada""",
                        buyer.getBuyerDeliveryAddress(),
                        buyer.getDeliveryPostalCodeName());
                emailService.sendEmail(buyer.getBuyerEmail(), "narudzba-casada", body2);
                break;
            case 3:
                System.out.println("dostavljena");
                String body3 = String.format("""
                                Poštovani,

                                Vaša narudžba je dostavljena.

                                Hvala na povjerenju!

                                Lijep pozdrav, Casada""",
                        buyer.getBuyerDeliveryAddress(),
                        buyer.getDeliveryPostalCodeName());
                emailService.sendEmail(buyer.getBuyerEmail(), "narudzba-casada", body3);
                break;
        }
    }
}
