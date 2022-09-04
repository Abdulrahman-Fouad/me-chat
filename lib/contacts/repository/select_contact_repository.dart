import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_chat/common/utils.dart';
import 'package:me_chat/models/user_model.dart';
import 'package:me_chat/chat/screens/chat_screen.dart';

final selectContactRepositoryProvider = Provider(
  (ref) => SelectContactRepository(
    FirebaseFirestore.instance,
  ),
);

class SelectContactRepository {
  final FirebaseFirestore firestore;

  SelectContactRepository(this.firestore);

  Future<List<Contact>> getContacts() async {
    List<Contact> contacts = [];
    try {
      if (await FlutterContacts.requestPermission()) {
        contacts = await FlutterContacts.getContacts(withProperties: true);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return contacts;
  }

  void selectContact(Contact selectedContact, BuildContext context) async {
    try {
      var userCollection = await firestore.collection('users').get();
      bool isFound = false;
      for (var document in userCollection.docs) {
        var userData = UserModel.fromMap(document.data());
        final selectedPhoneNum =
            selectedContact.phones[0].number.replaceAll(' ', '');
        if (selectedPhoneNum == userData.phoneNumber) {
          isFound = true;

          // ignore: use_build_context_synchronously
          Navigator.pushNamed(context, ChatScreen.routeName, arguments: {
            'name': userData.name,
            'uId': userData.uId,
          });
        }
      }
      if (!isFound) {
        showSnackBar(context: context, title: 'This number does not exist');
      }
    } catch (e) {
      showSnackBar(context: context, title: e.toString());
    }
  }
}
