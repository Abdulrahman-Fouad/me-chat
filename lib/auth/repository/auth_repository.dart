import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_chat/auth/screens/otp_screen.dart';
import 'package:me_chat/common/repositories/common_firebase_storage_repository.dart';
import 'package:me_chat/common/utils.dart';
import 'package:me_chat/models/user_model.dart';
import 'package:me_chat/main_mobile_layout/screens/main_screen.dart';
import 'package:me_chat/settings/screens/user_information_screen.dart';

final authRepositoryProvider = Provider(
    (ref) => AuthRepository(FirebaseAuth.instance, FirebaseFirestore.instance));

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRepository(this.auth, this.firestore);

  Future<UserModel?> getCurrentUserData() async {
    var userData =
        await firestore.collection('users').doc(auth.currentUser?.uid).get();
    UserModel? user;
    if (userData.data() != null) {
      user = UserModel.fromMap(userData.data()!);
    }
    return user;
  }

  void signinWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (error) {
          throw Exception(error.message);
        },
        codeSent: (String verificationId, int? forceResendingToken) async {
          Navigator.pushNamed(context, OTPScreen.routeName,
              arguments: verificationId);
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } on FirebaseException catch (e) {
      showSnackBar(context: context, title: e.message!);
    }
  }

  void verifyOTP(
      {required BuildContext context,
      required String verificationId,
      required String userOTP,
      bool mounted = true}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: userOTP,
      );
      await auth.signInWithCredential(credential);
      if (!mounted) return;
      Navigator.pushNamedAndRemoveUntil(
          context, UserInfoScreen.routeName, (route) => false);
    } on FirebaseException catch (e) {
      showSnackBar(context: context, title: e.message!);
    }
  }

  void saveUserDataToFirebase({
    required String name,
    required File? profilePic,
    required BuildContext context,
    required ProviderRef ref,
    bool mounted = true,
  }) async {
    try {
      String uId = auth.currentUser!.uid;
      String photoUrl = 'assets/images/user_placeholder.png';
      if (profilePic != null) {
        photoUrl = await ref
            .read(commonFirebaseStorageRepositoryProvider)
            .storeFileToFirebase('profilePic/$uId', profilePic);
      }
      UserModel user = UserModel(
        name: name,
        uId: uId,
        profilePic: photoUrl,
        phoneNumber: auth.currentUser!.phoneNumber.toString(),
        isOnline: true,
        groupId: [],
      );
      await firestore.collection('users').doc(uId).set(user.toMap());
      if (!mounted) return;
      Navigator.pushNamedAndRemoveUntil(
          context, MainScreen.routeName, (route) => false);
    } on Exception catch (e) {
      showSnackBar(context: context, title: e.toString());
    }
  }

  Stream<UserModel> userData(String uId) {
    return firestore
        .collection('users')
        .doc(uId)
        .snapshots()
        .map((event) => UserModel.fromMap(event.data()!));
  }

  void setUserState(bool isOnline) async {
    await firestore.collection('users').doc(auth.currentUser!.uid).update(
      {
        'isOnline': isOnline,
      },
    );
  }
}
