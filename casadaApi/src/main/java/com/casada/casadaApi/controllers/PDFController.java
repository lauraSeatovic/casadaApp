package com.casada.casadaApi.controllers;

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

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.xhtmlrenderer.pdf.ITextRenderer;

import org.thymeleaf.context.Context;

@Controller
@RestController
@RequestMapping("/pdf")
public class PDFController {

    @Autowired
    private org.thymeleaf.spring6.SpringTemplateEngine templateEngine;

    @GetMapping
    public ResponseEntity<byte[]> generatePdf() {
        try {
            //ClassPathResource templateResource = new ClassPathResource("orderInfo.html");
            //InputStream inputStream = templateResource.getInputStream();

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_PDF);
            headers.setContentDispositionFormData("attachment", "document.pdf");
            headers.set(HttpHeaders.CONTENT_ENCODING, "UTF-8");

            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            ITextRenderer renderer = new ITextRenderer();
            renderer.getFontResolver().addFont("/fonts/times.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            renderer.getFontResolver().addFont("/fonts/timesbd.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            renderer.setDocumentFromString(templateEngine.process("orderInfo", getTemplateContext()));
            renderer.layout();
            renderer.createPDF(outputStream);



            return ResponseEntity.ok().headers(headers).body(outputStream.toByteArray());
        } catch (DocumentException | IOException e) {
            // Handle any exceptions
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    private Context getTemplateContext() {
        Context context = new Context();
        context.setVariable("title", "Hello, World!");
        context.setVariable("message", "This is a sample PDF generated from HTML and Thymeleaf.");
        return context;
    }
}

