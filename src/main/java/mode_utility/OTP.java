package mode_utility;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.Objects;

public class OTP {


    // OTP mặc định 6 chữ số
    public int randomOTP() {
        return (int) ((Math.random() * (999999 - 100000)) + 100000);
    }

    public boolean checkOTP(String userOTP, String systemOTP) {
        return Objects.equals(userOTP, systemOTP);
    }
}
