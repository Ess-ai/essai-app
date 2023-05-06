library authentication;

abstract class AuthenticationRepository {
  Future signInEmailAndPassword(
    String email,
    String password,
  );

  Future signUpEmailAndPassword(
    String email,
    String password,
  );

  Future sendRecoveryCode(
    String email,
  );

  Future verifyRecoveryCode(
    String email,
    String token,
  );

  Future verifySignUp(
    String email,
    String token,
  );

  Future<void> signOut();
}
