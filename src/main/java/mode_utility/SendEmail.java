package mode_utility;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

public class SendEmail {
    public static boolean sendOTP(String CustomerMail, String subject, String body) {
        boolean test = false;
        // Mail chủ Shop
        String from = Config.OWNER_EMAIL;

        // Assuming you are sending email from through gmails smtp

        // Get system properties
        Properties properties = new Properties();

        // Setup mail server

        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.starttls.enable", "true");
        // Get the Session object.// and pass username and password
        Authenticator auth = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(Config.OWNER_EMAIL, Config.MAIL_PASSWORD);
            }
        };

        Session session = Session.getInstance(properties, auth);


        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);

            message.addHeader("Content-type", "text/HTML; charset=UTF-8");
            message.addHeader("format", "flowed");
            message.addHeader("Content-Transfer-Encoding", "8bit");
            message.setFrom(new InternetAddress(from, "NoReply-Shop"));
            message.setReplyTo(InternetAddress.parse(from, false));
            message.setSubject(subject, "UTF-8");
            message.setText(body, "UTF-8");
            message.setSentDate(new java.util.Date());


            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(CustomerMail, false));

            // Send message
            Transport.send(message);
            test = true;
        } catch (MessagingException | UnsupportedEncodingException mex) {
            mex.printStackTrace();
        }
        return test;
    }

    public static void main(String[] args) {
        SendEmail.sendOTP("dukhanhqt@gmail.com", "Xác thực tài khoản Mobile Shop", "Mã OTP của bạn là : 123456     Mã có hiệu lực trong 5 phút.");
    }
}
