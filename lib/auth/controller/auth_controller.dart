import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_chat/auth/repository/auth_repository.dart';
import 'package:me_chat/models/user_model.dart';

final authControllerProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository: authRepository, ref: ref);
});

final userDataAuthProvider = FutureProvider((ref) {
  final authController = ref.watch(authControllerProvider).getCurrentUserData();
  return authController;
});

class AuthController {
  final AuthRepository authRepository;
  final ProviderRef ref;

  AuthController({required this.ref, required this.authRepository});

  void signinWithPhone(BuildContext context, String phoneNumber) {
    authRepository.signinWithPhone(context, phoneNumber);
  }

  void verifyOTP(
    BuildContext context,
    String userOTP,
    String verificationId,
  ) {
    authRepository.verifyOTP(
      context: context,
      verificationId: verificationId,
      userOTP: userOTP,
    );
  }

  void saveUserDataToFirebase({
    required String name,
    required File? profilePic,
    required BuildContext context,
  }) {
    authRepository.saveUserDataToFirebase(
      name: name,
      profilePic: profilePic,
      context: context,
      ref: ref,
    );
  }

  Future<UserModel?> getCurrentUserData() async {
    UserModel? user = await authRepository.getCurrentUserData();
    return user;
  }

  Stream<UserModel> userData(String uId) {
    return authRepository.userData(uId);
  }

  void setUserState(bool isOnline) {
    authRepository.setUserState(isOnline);
  }
}
