import 'package:firebase_auth/firebase_auth.dart';

class Authservice {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //vrification

  //sign in Email pass
  Future signIn(email, password) async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;
      if (!user.emailVerified) {
        await user.sendEmailVerification();
        return 'Verify Your Email First';
      } else {
        return 'Success';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No User with Such Email, Register first';
      } else if (e.code == 'wrong-password') {
        return 'Wrong Password';
      }
    } catch (e) {
      print(e);
      return 'Error Logging in ';
    }
  }

  //register Email pass
  Future registerin(String email, String password, String username) async {
    try {
      final User user = (await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;

      await user.updateProfile(displayName: username);
      if (user != null) {
        if (!user.emailVerified) {
          await user.sendEmailVerification();
          return "Verify Email to Continue";
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'weak password';
      } else if (e.code == 'email-already-in-use') {
        return 'Email already taken';
      }
    } catch (e) {
      print(e);
      return 'Error Logging in ';
    }
  }
  //sign out
}
