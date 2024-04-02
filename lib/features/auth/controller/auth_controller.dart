import 'package:firebase_project/features/auth/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//dördüncü adım repository oluşturduk  burda controller oluşturduk
class AuthController {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

//beşinci adım burda sign in işlemi yapılacak
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return authRepository.signInWithEmailAndPassword(email: email, password: password);
  }

// burda sign up işlemi yapılacak
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return authRepository.signUpWithEmailAndPassword(email: email, password: password);
  }
}

// 11. adım authcontrolller oluşturduk butona tıklanınca işlem yapılacak
final auttControllerProvider = Provider(
  (ref) => AuthController(
    authRepository: ref.watch(authRepositoryProvider),
  ),
);
