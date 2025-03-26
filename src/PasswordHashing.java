import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class PasswordHashing{
    public static String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = md.digest(password.getBytes());
            return Base64.getEncoder().encodeToString(hashedBytes);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        String password = "mySecurePassword";
        String hashedPassword1=hashPassword("mySecurePassword");
        String hashedPassword = hashPassword(password);
        System.out.println("Hashed Password1: " + hashedPassword);
        System.out.println("Hashed Password2: " + hashedPassword1);
    }
}
