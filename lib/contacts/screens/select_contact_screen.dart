import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_chat/common/loading_spinner.dart';
import 'package:me_chat/contacts/controller/select_contact_controller.dart';
import 'package:me_chat/common/screens/error_screen.dart';

class SelectContatcScreen extends ConsumerWidget {
  static const String routeName = '/select-contact';
  const SelectContatcScreen({super.key});

  void selectContact(
      WidgetRef ref, BuildContext context, Contact selectedContact) {
    ref
        .read(selectContactControllerProvider)
        .selectContact(selectedContact, context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select contatc'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: ref.watch(getContactProvider).when(
            data: (contactsList) => Scrollbar(
              interactive: true,
              thumbVisibility: true,
              child: ListView.builder(
                  itemCount: contactsList.length,
                  itemBuilder: (context, i) {
                    Contact contact = contactsList[i];
                    return InkWell(
                      onTap: () => selectContact(ref, context, contact),
                      child: ListTile(
                        leading: Hero(
                          tag: contact.id,
                          child: contact.photo == null
                              ? const CircleAvatar(
                                  backgroundImage: AssetImage(
                                  'assets/images/user_placeholder.png',
                                ))
                              : CircleAvatar(
                                  backgroundImage: MemoryImage(contact.photo!),
                                ),
                        ),
                        // Contact photo, should be clickable for some type of data preview
                        title: Text(
                          contact.displayName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text(
                          'about',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    );
                  }),
            ),
            error: (error, stackTrace) => ErrorScreen(error: error.toString()),
            loading: () => const LoadingSpinner(),
          ),
    );
  }
}
