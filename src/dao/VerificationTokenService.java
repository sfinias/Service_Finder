package dao;

import com.hellokoding.account.model.User;
import com.hellokoding.account.model.VerificationToken;
import com.hellokoding.account.repository.UserRepository;
import com.hellokoding.account.repository.VerificationTokenRepository;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import utils.MailService;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class VerificationTokenService {
    private UserDAOInterface userDAOInterface;
    private VerificationTokenRepository verificationTokenRepository;
    private MailService sendingMailService;

    @Autowired
    public VerificationTokenService(UserDAOInterface userDAOInterface, VerificationTokenRepository verificationTokenRepository, MailService sendingMailService){
        this.userDAOInterface = userDAOInterface;
        this.verificationTokenRepository = verificationTokenRepository;
        this.sendingMailService = sendingMailService;
    }

    public void createVerification(String email){
        User user = userDAOInterface.findUserByEmail(email);
        if (user.equals(null)) {
            user = new User();
            user.setEmail(email);
            userRepository.save(user);
        } else {
            user = users.get(0);
        }

        List<VerificationToken> verificationTokens = verificationTokenRepository.findByUserEmail(email);
        VerificationToken verificationToken;
        if (verificationTokens.isEmpty()) {
            verificationToken = new VerificationToken();
            verificationToken.setUser(user);
            verificationTokenRepository.save(verificationToken);
        } else {
            verificationToken = verificationTokens.get(0);
        }

        sendingMailService.sendVerificationMail(email, verificationToken.getToken());
    }

    public ResponseEntity<String> verifyEmail(String token){
        List<VerificationToken> verificationTokens = verificationTokenRepository.findByToken(token);
        if (verificationTokens.isEmpty()) {
            return ResponseEntity.badRequest().body("Invalid token.");
        }

        VerificationToken verificationToken = verificationTokens.get(0);
        if (verificationToken.getExpiredDateTime().isBefore(LocalDateTime.now())) {
            return ResponseEntity.unprocessableEntity().body("Expired token.");
        }

        verificationToken.setConfirmedDateTime(LocalDateTime.now());
        verificationToken.setStatus(VerificationToken.STATUS_VERIFIED);
        verificationToken.getUser().setIsActive(true);
        verificationTokenRepository.save(verificationToken);

        return ResponseEntity.ok("You have successfully verified your email address.");
    }
}