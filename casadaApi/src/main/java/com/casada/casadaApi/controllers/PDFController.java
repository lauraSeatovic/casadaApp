package com.casada.casadaApi.controllers;

import com.casada.casadaApi.services.implementations.PDFServiceImpl;
import com.lowagie.text.DocumentException;
import com.lowagie.text.pdf.BaseFont;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.xhtmlrenderer.pdf.ITextRenderer;

import org.thymeleaf.context.Context;

@Controller
@RestController
@RequestMapping("/order")
public class PDFController {

    @Autowired
    private PDFServiceImpl pdfService;

    @GetMapping("/pdf/{orderId}")
    public ResponseEntity<byte[]> generateOrderPdf(@PathVariable("orderId") Integer orderId) {
        return pdfService.generateOrderPdf(orderId, "orderInfo");
    }

    @GetMapping("/pdfdispatch/{orderId}")
    public ResponseEntity<byte[]> generateDispatchNotePdf(@PathVariable("orderId") Integer orderId) {
        return pdfService.generateOrderPdf(orderId, "orderInfoDispatch");
    }

    @GetMapping("/html/{orderId}")
    public ResponseEntity<String> generateOrderHtml(@PathVariable("orderId") Integer orderId) {
        return pdfService.generateOrderHtml(orderId);
    }
}

