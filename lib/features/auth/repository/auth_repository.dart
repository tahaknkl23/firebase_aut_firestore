// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//üçüncü adım riveerpod ekledik losröler arasında rahat geçis yapabilmek için

final authRepositoryProvider = Provider((ref) => AuthRepository(auth: FirebaseAuth.instance, firebaseFirestore: FirebaseFirestore.instance));

//birinci adım
class AuthRepository {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth auth;
  AuthRepository({
    required this.auth,
    required this.firebaseFirestore,
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

//burda kayıt olma işlemi yapılacak
Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}

//burda kullanıcı bilgileri firebase'e kaydedilecek
Future<void> storeUserInfoFirebase(UserModel userModel) async {
  userModel.profilPhoto ??= 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png';
  await FirebaseFirestore.instance.collection('users').doc(userModel.uid).set(userModel.toMap());
}
