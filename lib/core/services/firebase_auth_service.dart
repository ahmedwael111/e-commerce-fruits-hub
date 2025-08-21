import 'package:e_commerce_fruits_hub/core/errors/exeptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService { // raper for firebase auth or firebase consumer
  
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
  if (e.code == 'weak-password') {
    throw CoustomException(message:'The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    throw CoustomException(message:'The account already exists for that email.');
  }
  else {
   throw CoustomException(message:'there was an error , please try again later' );
  }
} catch (e) {
  throw CoustomException(message: 'there was an error , please try again later');
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
