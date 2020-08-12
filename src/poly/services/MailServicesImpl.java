package poly.services;

import java.util.Date;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service("mailer")
public class MailServicesImpl implements MailServices {
	@Autowired
	private JavaMailSender mailer;

	@Override
	public void send(String from, String to, String subject, String content) throws Exception {
		// TODO Auto-generated method stub
		MimeMessage mail = mailer.createMimeMessage();

		MimeMessageHelper helper = new MimeMessageHelper(mail, true);
		helper.setFrom(from, from);
		helper.setTo(to);

		helper.setSubject(subject);
		helper.setText(content, true);
		helper.setSentDate(new Date());
		// Gửi mail
		mailer.send(mail);
	}

}
