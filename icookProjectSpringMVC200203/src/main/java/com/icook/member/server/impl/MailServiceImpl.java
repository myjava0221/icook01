package com.icook.member.server.impl;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import com.icook.member.server.mailService;
import com.icook.model.ProductOrder;

@Service("mailService")
public class MailServiceImpl implements mailService{

	@Autowired
	JavaMailSender mailSender;
	
	@Override
	public void sendEmail(Object object) {
		ProductOrder order = (ProductOrder) object;
        MimeMessagePreparator preparator = getMessagePreparator(order);
 
        try {
            mailSender.send(preparator);
            System.out.println("Message Send...Hurrey");
        } catch (MailException ex) {
            System.err.println(ex.getMessage());
        }
	}

	private MimeMessagePreparator getMessagePreparator(final ProductOrder order) {
		 
        MimeMessagePreparator preparator = new MimeMessagePreparator() {
 
            public void prepare(MimeMessage mimeMessage) throws Exception {
            	InternetAddress test = new InternetAddress("chang123456@gmail.com");
                mimeMessage.setFrom(test);
                mimeMessage.setRecipient(Message.RecipientType.TO,
                        new InternetAddress(order.getCustomerInfo().getEmail()));
                mimeMessage.setText("Dear " + order.getCustomerInfo().getName()
                        + ", thank you for placing order. Your order id is " + order.getOrderId() + ".  http://localhost:8080/icookProjectSpringMVC200203/");
                mimeMessage.setSubject("Your order on Demoapp");
            }
        };
        return preparator;
    }
}
