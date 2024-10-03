import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user
  Future<User?> register({
    required String email,
    required String password,
    required String firstname,
    required String lastname,
  }) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (ex) {
      if (ex.code == "email-already-in-use") {
        throw 'Email is already in use';
      } else {
        throw ex.message ?? 'Registraton failed';
      }
    }
  }

  //login user
  Future<User?> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (ex) {
      throw ex.message ?? 'Login failed';
    }
  }

  // logout
  Future<void> logout() async {
    await _auth.signOut();
  }
}
