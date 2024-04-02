// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//üçüncü adım riveerpod ekledik losröler arasında rahat geçis yapabilmek için
final authRepositoryProvider = Provider((ref) => AuthRepository(auth: FirebaseAuth.instance));

//birinci adım
class AuthRepository {
  final FirebaseAuth auth;
  AuthRepository({
    required this.auth,
  });

//ikinci adım
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

//burası sign up tıkladığında kayıt olma işlemi yapılacak
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
