import 'package:firebase_project/features/auth/repository/auth_repository.dart';

class AuthController {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return authRepository.signInWithEmailAndPassword(email: email, password: password);
  }
   Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return authRepository.signUpWithEmailAndPassword(email: email, password: password);
  }
}

 