package com.casada.casadaApi.services.implementations;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.util.ByteArrayDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;


    public void sendEmail(String to, String subject, String body) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(to);
        message.setSubject(subject);
        message.setText(body);

        mailSender.send(message);
    }

    public void sendEmailWithAttachment(String to, String subject, String body, byte[] attachmentData, String attachmentName) throws MessagingException {
        MimeMessage message = mailSender.createMimeMessage();

        MimeMessageHelper helper = new MimeMessageHelper(message, true);
        try {
            helper.setTo(to);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        helper.setSubject(subject);
        helper.setText(body);

        // Add attachment
        ByteArrayDataSource dataSource = new ByteArrayDataSource(attachmentData, "application/pdf");
        helper.addAttachment(attachmentName, dataSource);

        mailSender.send(message);
    }
}