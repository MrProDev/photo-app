import 'package:firebase_auth/firebase_auth.dart';

class AuthApi {
  Future<User?> anonymousSignIn() async {
    try {
      final credential = await FirebaseAuth.instance.signInAnonymously();
      return credential.user;
    } on FirebaseAuthException {
      return null;
    }
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return authResult.user;
    } on FirebaseAuthException {
      return null;
    }
  }

  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final authResult =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return authResult.user;
    } on FirebaseAuthException {
      return null;
    }
  }

  Future<bool> checkIfEmailInUse(String emailAddress) async {
    try {
      final list =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(emailAddress);

      if (list.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return true;
    }
  }

  String getCurrentUid() {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
