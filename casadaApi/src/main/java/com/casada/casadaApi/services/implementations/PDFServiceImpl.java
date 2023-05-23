package com.casada.casadaApi.services.implementations;

import com.casada.casadaApi.domain.Buyer;
import com.casada.casadaApi.domain.Member;
import com.casada.casadaApi.domain.OrderInfo;
import com.casada.casadaApi.domain.OrderProduct;
import com.casada.casadaApi.repos.BuyerRepository;
import com.casada.casadaApi.repos.OrderInfoRepository;
import com.casada.casadaApi.repos.OrderProductRepository;
import com.casada.casadaApi.services.data.ProductPDF;
import com.lowagie.text.DocumentException;
import com.lowagie.text.pdf.BaseFont;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.thymeleaf.context.Context;
import org.xhtmlrenderer.pdf.ITextRenderer;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Service
public class PDFServiceImpl {
    @Autowired
    private org.thymeleaf.spring6.SpringTemplateEngine templateEngine;

    @Autowired
    private OrderInfoRepository orderInfoRepository;

    @Autowired
    private OrderProductRepository orderProductRepository;

    @Autowired
    private BuyerRepository buyerRepository;

    public ResponseEntity<byte[]> generateOrderPdf(int orderId) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_PDF);
            headers.setContentDispositionFormData("attachment", "document.pdf");
            headers.set(HttpHeaders.CONTENT_ENCODING, "UTF-8");

            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            ITextRenderer renderer = new ITextRenderer();
            renderer.getFontResolver().addFont("/fonts/times.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            renderer.getFontResolver().addFont("/fonts/timesbd.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            renderer.setDocumentFromString(templateEngine.process("orderInfo", getOrderTemplateContext(orderId)));
            renderer.layout();
            renderer.createPDF(outputStream);



            return ResponseEntity.ok().headers(headers).body(outputStream.toByteArray());
        } catch (DocumentException | IOException e) {
            // Handle any exceptions
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    public ResponseEntity<String> generateOrderHtml(int orderId) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.TEXT_HTML);

            String htmlContent = templateEngine.process("orderInfoDetail", getOrderTemplateContext(orderId));

            return ResponseEntity.ok().headers(headers).body(htmlContent);
        } catch (Exception e) {
            // Handle any exceptions
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error generating HTML");
        }
    }

    private Context getOrderTemplateContext(int orderId) {
        Optional<OrderInfo> orderInfoOptional = orderInfoRepository.findById(orderId);
        if(orderInfoOptional.isPresent()){
            OrderInfo orderInfo = orderInfoOptional.get();
            Context context = new Context();
            Buyer buyer = orderInfo.getBuyer();
            String buyerNameSurname = buyer.getBuyerName().concat(" ").concat(buyer.getBuyerSurname());
            context.setVariable("buyerNameSurname", buyerNameSurname);
            context.setVariable("buyerPhone", buyer.getBuyerPhoneNumber());
            context.setVariable("buyerEmail", buyer.getBuyerEmail());
            context.setVariable("buyerAddress", buyer.getBuyerDeliveryAddress());

            List<ProductPDF> products = orderInfo.getOrderOrderProducts().stream().map(product -> new ProductPDF(
                    product.getProduct().getProductName(),
                    product.getQuantity(),
                    product.getProduct().getProductPrice(),
                    product.getDiscount(),
                    product.getProduct().getProductPrice()*product.getQuantity()
            )).toList();
            context.setVariable("products", products);

            Member seller = orderInfo.getSeller();
            String sellerNameSurname = seller.getMemberName().concat(" ").concat(seller.getMemberSurname());
            context.setVariable("payment", orderInfo.getPaymentMethod().getPaymentMethodName());
            context.setVariable("delivery", orderInfo.getDeliveryDate());
            context.setVariable("seller", sellerNameSurname);
            context.setVariable("note", orderInfo.getOrderNote());

            return context;
        }else{
            throw new RuntimeException("Order not found");
        }

    }
}


