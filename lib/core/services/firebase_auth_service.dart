import 'dart:developer';

import 'package:e_commerce_fruits_hub/core/errors/exeptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      log('exeption in FirebaseAuthService.createUserWithEmailAndPassword : global catch : $e');
      throw CoustomException(
        message: 'الحدث خطأ غير متوقع. يرجى المحاولة مرة أخرى لاحقًا.❌',
      );
    }
  }

  //   Future<UserEntity> signInWithEmailAndPassword({
  //     required String email,
  //     required String password,
  //   }) async {
  //     try {
  //       final userCredential = await FirebaseAuth.instance
  //           .signInWithEmailAndPassword(email: email, password: password);
  //       return UserEntity.fromFirebaseUser(userCredential.user!);
  //     } on FirebaseAuthException catch (e) {
  //       throw ServerFailuer(message: e.message ?? 'An error occurred');
  //     }
  //   }

  //   Future<void> signOut() async {
  //     await FirebaseAuth.instance.signOut();
  //   }
}
