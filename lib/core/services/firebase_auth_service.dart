import 'dart:developer';

import 'package:e_commerce_fruits_hub/core/errors/exeptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  // raper for firebase auth or firebase consumer

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
    String? name,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
        // name: name, // Assuming you have a way to set the name in Firebase User
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'exeption in FirebaseAuthService.createUserWithEmailAndPassword: ${e.message} and code message: ${e.code}',
      );
      if (e.code == 'weak-password') {
        throw CoustomException(
          message: 'كلمة المرور ضعيفة جدًا. يرجى اختيار كلمة مرور أقوى.',
        );
      } else if (e.code == 'email-already-in-use') {
        throw CoustomException(
          message: 'الإيميل مستخدم بالفعل. يرجى استخدام إيميل آخر.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CoustomException(
          message: 'تأكد من اتصالك بالإنترنت وحاول مرة أخرى.❌',
        );
      } else {
        throw CoustomException(
          message: 'حدث خطاء غير متوقع. يرجى المحاولة مرة أخرى ❌',
        );
      }
    } catch (e) {
      log(
        'exeption in FirebaseAuthService.createUserWithEmailAndPassword : global catch : $e',
      );
      throw CoustomException(
        message: 'الحدث خطأ غير متوقع. يرجى المحاولة مرة أخرى لاحقًا.❌',
      );
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'exeption in FirebaseAuthService.signInWithEmailAndPassword: ${e.message} and code message: ${e.code}',
      );
      if (e.code == 'user-not-found') {
        throw CoustomException(
          message:
              'المستخدم غير موجود. يرجى التحقق من الإيميل والمحاولة مرة أخرى.',
        );
      } else if (e.code == 'wrong-password') {
        throw CoustomException(
          message: 'كلمة المرور غير صحيحة. يرجى المحاولة مرة أخرى.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CoustomException(
          message: 'تأكد من اتصالك بالإنترنت وحاول مرة أخرى.❌',
        );
      } else {
        throw CoustomException(
          message: 'حدث خطاء غير متوقع. يرجى المحاولة مرة أخرى ❌',
        );
      }
    } catch (e) {
      log(
        'exeption in FirebaseAuthService.signInWithEmailAndPassword : global catch : $e',
      );
      throw CoustomException(
        message: 'حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى لاحقًا.❌',
      );
    }
  }

  Future<User?> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId:
          "421466721299-1bubmfp5u504q05mvv30rvue67qrt64b.apps.googleusercontent.com",
    );
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );
      return userCredential.user!;
    } catch (e) {
      log("firebase auth service.Google Sign-In method Error: $e");
      return null;
    }
  }

  Future<User> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    )).user!;
  }
}
