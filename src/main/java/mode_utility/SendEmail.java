package mode_utility;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class SendEmail {
    public static boolean sendOTP(String CustomerMail, int OTPcode) {
        boolean test = false;
        // Mail chủ Shop
        String from = Config.OWNER_EMAIL;

        // Assuming you are sending email from through gmails smtp
        String host = "smtp.gmail.com";

        // Get system properties
        Properties properties = System.getProperties();

        // Setup mail server

        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.socketFactory.port", "465");
        properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.port", "465");
        // Get the Session object.// and pass username and password
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

            protected PasswordAuthentication getPasswordAuthentication() {

                return new PasswordAuthentication(Config.OWNER_EMAIL, Config.MAIL_PASSWORD);

            }

        });

        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));

            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(CustomerMail));

            // Tiêu Đề
            message.setSubject("Xác thực tài khoản Mobile Shop", "UTF-8");

            // Nội dung
            message.setText("Mã OTP của bạn là : " + OTPcode + "     Mã có hiệu lực trong " + Config.OTP_LIVE / 60 + " phút.", "UTF-8");
            // Send message
            Transport.send(message);
            test = true;
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
        return test;
    }

    public static void main(String[] args) {
        SendEmail.sendOTP("dukhanhqt@gmail.com", 10);
    }
}
